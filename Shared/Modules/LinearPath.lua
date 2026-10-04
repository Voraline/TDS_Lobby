-- Script path: ReplicatedStorage.Shared.Modules.LinearPath
-- Decompile time: 3.67 ms

local u0 = {}
u0.__index = u0
u0.LOW_QUALITY_MODE = false

local function round(a1, a2) -- Line: 40 -- types: a1: number, a2: number
    local v1 = 10 ^ (a2 or 0)
    return math.floor(a1 * v1 + 0.5) / v1
end

function u0.new(a1, a2) -- Line: 93 -- upvalues: u0 (val) -- types: a1: table, a2: boolean?
    local v1 = setmetatable({}, u0)
    v1.ShouldCache = a2 or false
    v1.PathCache = {}
    v1.NormalCache = {}
    v1.StartPointCache = {}
    v1.EndPointCache = {}
    v1:SetPoints(a1)
    return v1
end

function u0:SetPoints(a2) -- Line: 117 -- types: self: table, a2: table
    local Magnitude, v1, v2, v3
    assert(#a2 > 0, "LinearPath:SetPoints: No waypoints provided.")
    self.Points = a2
    self.Distances = table.create(#a2)
    self.FullDistances = table.create(#a2)
    self.Normals = table.create(#a2)
    self.PathDistance = 0
    self.PathCache = {}
    self.NormalCache = {}
    self.StartPointCache = {}
    self.EndPointCache = {}
    local v4 = #a2
    for i = 2, v4 do
        Magnitude = (a2[i] - a2[i - 1]).Magnitude
        self.Distances[i] = Magnitude
        self.PathDistance = self.PathDistance + Magnitude
        self.FullDistances[i] = self.PathDistance
    end
    v4 = #a2
    local v5, v6 = a2, self
    for j = 1, v4 do
        v1 = v5[j]
        v2 = not (j ~= #v5) and j - 1 or j + 1
        v3 = (v1 - v5[v2]).Unit:Cross((Vector3.new(0, 1, 0)))
        v6.Normals[j] = v3
    end
end

function u0:_FindSegment(a2) -- Line: 156 -- types: self: table, a2: number
    local v1, v2
    if a2 <= 0 then
        return 2, 0
    end
    if self.PathDistance <= a2 then
        return #self.Points, 1
    end
    local v3 = 2
    local v4 = #self.Points
    local v5, v6 = self, a2
    while v3 <= v4 do
        v1 = math.floor((v3 + v4) / 2)
        v2 = v5.FullDistances[v1]
        if v2 == nil then
            v2 = 0
        end
        if not (v2 < v6) then
            v4 = v1 - 1
        else
            v3 = v1 + 1
        end
    end
    v1 = math.clamp(v3, 2, #v5.Points)
    v2 = v5.FullDistances[v1 - 1] or 0
    local v7 = v5.Distances[v1]
    local v8 = 0
    if v7 > 0 then
        v8 = (v6 - v2) / v7
    end
    v8 = math.clamp(v8, 0, 1)
    return v1, v8
end

u0._FindSegment = u0._FindSegment

function u0.Get(a1, a2) -- Line: 208 -- types: a1: table, a2: number
    local v1 = math.clamp(a2, 0, 1)
    if a1.ShouldCache then
        v1 = math.floor(v1 * 1000 + 0.5) / 1000
        if a1.PathCache[v1] then
            return a1.PathCache[v1]
        end
    end
    local v2 = v1 * #a1.Points
    local v3 = math.floor(v2 - 1)
    if v2 <= 0 then
        return a1.Points[1]
    end
    if #a1.Points <= v2 then
        return a1.Points[#a1.Points]
    end
    local v4 = a1.Points[v3 + 1]:Lerp(a1.Points[(math.clamp(v3 + 2, 1, #a1.Points))], v2 - v3)
    if a1.ShouldCache then
        a1.PathCache[v1] = v4
    end
    return v4
end

function u0:GetDistanceToEnd(a2) -- Line: 240 -- types: self: table, a2: number
    return self.PathDistance - a2
end

function u0.GetScalar(a1, a2, a3) -- Line: 254 -- upvalues: u0 (val) -- types: a1: table, a2: number, a3: number?
    local v1, v2, v3, v4, v5
    local v6 = a3 or 0
    local v7 = math.clamp(a2, 0, a1.PathDistance)
    if v7 <= 0 then
        return a1.Points[1] + a1.Normals[1] * v6, false
    end
    if a1.PathDistance <= v7 then
        return a1.Points[#a1.Points] + a1.Normals[#a1.Points] * v6, true
    end
    local v8 = nil
    if a1.ShouldCache then
        v3 = 10 ^ ((if not u0.LOW_QUALITY_MODE then 3 else 1) or 0)
        v8 = math.floor(v7 * v3 + 0.5) / v3
        v2 = a1.PathCache[v8]
        if v2 then
            v3 = a1.NormalCache[v8]
            v4 = a1.StartPointCache[v8]
            v5 = a1.EndPointCache[v8]
            v1 = v2 + v3 * v6
            return v1, a1.PathDistance <= v8, v4, v5
        end
    end
    v2, v3 = a1:_FindSegment(v7)
    v4 = v2 - 1
    v5 = a1.Points[v4]
    v1 = a1.Points[v2]
    local v9 = a1.Normals[v4]:Lerp(a1.Normals[v2], v3)
    local v10 = v5:Lerp(v1, v3)
    if a1.ShouldCache and v8 ~= nil then
        a1.PathCache[v8] = v10
        a1.NormalCache[v8] = v9
        a1.StartPointCache[v8] = v5
        a1.EndPointCache[v8] = v1
    end
    return v10 + v9 * v6, false, v5, v1
end

function u0.GetClosestPoint(a1, a2) -- Line: 315 -- types: a1: table, a2: vector
    local Magnitude_3, Unit, v1, v2, v3, v4
    local v5 = nil
    local v6 = (1 / 0)
    local v7 = 0
    local v8 = 1
    local v9 = #a1.Points - 1
    local v10 = a2
    for i = 1, v9 do
        v4 = a1.Points[i]
        v1 = a1.Points[i + 1]
        Unit = (v1 - v4).Unit
        v3 = math.clamp((v4 + Unit * ((v10 - v4):Dot(Unit)) - v4).Magnitude / (v1 - v4).Magnitude, 0, 1)
        v2 = v4 + (v1 - v4) * v3
        Magnitude_3 = (v10 - v2).Magnitude
        if Magnitude_3 < v6 then
            v5 = v2
            v8 = i
        end
    end
    v9 = v8 + 1
    for j = 2, v9 do
        v7 = v7 + a1.Distances[j]
    end
    return v5, a1:GetDistanceToEnd(v7)
end

return u0