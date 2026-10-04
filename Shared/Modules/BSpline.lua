-- Script path: ReplicatedStorage.Shared.Modules.BSpline
-- Decompile time: 3.93 ms

local u0 = {}
u0.__index = u0

local function createOpenUniformKnots(a1, a2) -- Line: 30 -- types: a1: number, a2: number
    local v1
    local v2 = a1 + a2 + 1
    local v3 = table.create(v2)
    local v4, v5 = a2, a1
    for i = 1, v2 do
        if i <= v4 + 1 then
            v3[i] = 0
        elseif not (v5 + 1 <= i) then
            v1 = i - v4 - 1
            v3[i] = v1 / (v5 - v4)
        else
            v3[i] = 1
        end
    end
    return v3
end

function u0.new(a1, a2, a3) -- Line: 47
    -- upvalues: createOpenUniformKnots (val), u0 (val)
    assert(#a1 >= 2, "BSpline requires at least two control points")
    local v1 = a2 or math.min(3, #a1 - 1)
    assert(v1 % 1 == 0, "BSpline degree must be an integer")
    assert(v1 >= 1, "BSpline degree must be at least one")
    assert(v1 < #a1, "BSpline degree must be less than the control point count")
    local v2 = a3 or 80
    assert(v2 % 1 == 0, "BSpline arc-length samples must be an integer")
    assert(v2 >= 2, "BSpline requires at least two arc-length samples")
    local v3 = createOpenUniformKnots(#a1, v1)
    local v4 = setmetatable({}, u0)
    v4.Points = table.clone(a1)
    v4.Degree = v1
    v4.Knots = v3
    v4.ArcLengths = {}
    v4.ArcLengthSamples = v2
    v4.Length = 0
    v4:BuildArcLengthTable(v2)
    return v4
end

function u0:_FindSpan(a2) -- Line: 72 -- types: self: table, a2: number
    local v1 = #self.Points - 1
    if a2 >= 1 then
        return v1
    end
    local v2 = a2
    for i = self.Degree, v1 do
        if self.Knots[i + 1] <= v2 and v2 < self.Knots[i + 2] then
            return i
        end
    end
    return self.Degree
end

function u0:SolvePosition(a2) -- Line: 88 -- types: self: table, a2: number
    local v1, v2, v3, v4, v5
    local v6 = math.clamp(a2, 0, 1)
    if v6 == 0 then
        return self.Points[1]
    end
    if v6 == 1 then
        return self.Points[#self.Points]
    end
    local Degree = self.Degree
    local v7 = self:_FindSpan(v6)
    local v8 = table.create(Degree + 1)
    for i = 0, Degree do
        v8[i + 1] = self.Points[v7 - Degree + i + 1]
    end
    for j = 1, Degree do
        v5 = j
        for k = Degree, v5, -1 do
            v1 = v7 - Degree + k
            v2 = self.Knots[v1 + 1]
            v3 = self.Knots[v1 + Degree - j + 2] - v2
            v4 = k + 1
            v8[v4] = (v8[k]:Lerp(v8[k + 1], if not (v3 > 1e-06) then 0 else (v6 - v2) / v3))
        end
    end
    return v8[Degree + 1]
end

function u0:SolveTangent(a2) -- Line: 119 -- types: self: table, a2: number
    local v1 = math.clamp(a2, 0, 1)
    local v2 = math.max(0, v1 - 0.0001)
    local v3 = (self:SolvePosition((math.min(1, v1 + 0.0001)))) - self:SolvePosition(v2)
    if 1e-06 < v3.Magnitude then
        return v3.Unit
    end
    return (Vector3.new(0, 0, 0))
end

function u0:BuildArcLengthTable(a2) -- Line: 129 -- types: self: table, a2: number?
    local v1
    local ArcLengthSamples = a2 or self.ArcLengthSamples
    assert(ArcLengthSamples % 1 == 0, "BSpline arc-length samples must be an integer")
    assert(ArcLengthSamples >= 2, "BSpline requires at least two arc-length samples")
    self.ArcLengthSamples = ArcLengthSamples
    self.ArcLengths = table.create(ArcLengthSamples + 1)
    self.ArcLengths[1] = 0
    self.Length = 0
    local v2 = self:SolvePosition(0)
    for i = 1, ArcLengthSamples do
        v1 = self:SolvePosition(i / ArcLengthSamples)
        self.Length = self.Length + (v1 - v2).Magnitude
        self.ArcLengths[i + 1] = self.Length
    end
end

function u0:_Reparameterize(a2) -- Line: 149 -- types: self: table, a2: number
    local v1 = math.clamp(a2, 0, 1)
    if v1 ~= 0 and not (self.Length <= 1e-06) then
        local v2
        if v1 == 1 then
            return 1
        end
        local v3 = v1 * self.Length
        local v4 = 2
        local v5 = #self.ArcLengths
        local v6 = self
        while v4 <= v5 do
            v2 = math.floor((v4 + v5) / 2)
            if not (v6.ArcLengths[v2] < v3) then
                v5 = v2 - 1
            else
                v4 = v2 + 1
            end
        end
        v2 = math.clamp(v4, 2, #v6.ArcLengths)
        local v7 = v2 - 1
        local v8 = v6.ArcLengths[v7]
        local v9 = v6.ArcLengths[v2] - v8
        local v10 = if not (v9 > 1e-06) then 0 else (v3 - v8) / v9
        return (v7 - 1 + v10) / v6.ArcLengthSamples
    end
    return 0
end

function u0.SolveUniformPosition(a1, a2) -- Line: 182 -- types: a1: table, a2: number
    return a1:SolvePosition((a1:_Reparameterize(a2)))
end

function u0.SolveUniformTangent(a1, a2) -- Line: 187 -- types: a1: table, a2: number
    return a1:SolveTangent((a1:_Reparameterize(a2)))
end

function u0.GetUniformProgress(a1, a2) -- Line: 192 -- types: a1: table, a2: number
    local v1 = math.clamp(a2, 0, 1)
    if v1 ~= 0 and not (a1.Length <= 1e-06) then
        if v1 == 1 then
            return 1
        end
        local v2 = math.floor(v1 * a1.ArcLengthSamples)
        local v3 = v2 / a1.ArcLengthSamples
        local v4 = a1.ArcLengths[v2 + 1]
        if v3 < v1 then
            v4 = v4 + ((a1:SolvePosition(v1)) - a1:SolvePosition(v3)).Magnitude
        end
        return (math.clamp(v4 / a1.Length, 0, 1))
    end
    return 0
end

function u0.SolveLength(a1) -- Line: 212
    return a1.Length
end

function u0.Destroy(a1) -- Line: 216
    a1.Points = {}
    a1.Knots = {}
    a1.ArcLengths = {}
    a1.Length = 0
end

return u0