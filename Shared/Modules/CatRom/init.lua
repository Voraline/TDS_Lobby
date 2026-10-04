-- Script path: ReplicatedStorage.Shared.Modules.CatRom
-- Decompile time: 8.17 ms

local Spline = require(script.Spline)
local u4 = {}
u4.__index = u4

local function FuzzyEq(a1, a2) -- Line: 13
    local v1 = typeof(a1)
    if v1 == "number" then
        local v2 = true
        if a1 ~= a2 then
            v2 = (math.abs(a1 - a2)) <= (math.abs(a1) + 1) * 0.0001
        end
        return v2
    end
    if v1 == "Vector3" then
        return a1:FuzzyEq(a2, 0.0001)
    end
    if v1 ~= "Vector2" then
        if v1 == "CFrame" then
            return a1.Position:FuzzyEq(a2.Position, 0.0001) and a1.RightVector:FuzzyEq(a2.RightVector, 0.0001) and a1.UpVector:FuzzyEq(a2.UpVector, 0.0001) and a1.LookVector:FuzzyEq(a2.LookVector, 0.0001)
        end
        return false
    end
    local X = a1.X
    local X_2 = a2.X
    local Y = a1.Y
    local Y_2 = a2.Y
    local v3 = true
    if X ~= X_2 then
        if not ((math.abs(X - X_2)) <= (math.abs(X) + 1) * 0.0001) then
            v3 = (math.abs(Y - Y_2)) <= (math.abs(Y) + 1) * 0.0001
        else
            v3 = true
            if Y ~= Y_2 then
                v3 = (math.abs(Y - Y_2)) <= (math.abs(Y) + 1) * 0.0001
            end
        end
    end
    return v3
end

local function CFrameToQuaternion(a1) -- Line: 36
    local v1, v2 = a1:ToAxisAngle()
    v2 = v2 / 2
    v1 = math.sin(v2) * v1
    return {math.cos(v2), v1.X, v1.Y, v1.Z}
end

local function ToTransform(a1, a2) -- Line: 43
    if a2 ~= "Vector2" and a2 ~= "Vector3" then
        if a2 ~= "CFrame" then
            return nil
        end
        local v1 = {}
        local Position = a1.Position
        local v2, v3 = a1:ToAxisAngle()
        v3 = v3 / 2
        v2 = math.sin(v3) * v2
        local v4 = {math.cos(v3), v2.X, v2.Y, v2.Z}
        v1[1] = Position
        v1[2] = v4
        return v1
    end
    return {a1}
end

function u4.Destroy(a1) -- Line: 53
    a1.splines = nil
    a1.domains = nil
    setmetatable(a1, nil)
end

function u4.new(a1, a2, a3) -- Line: 60
    -- upvalues: FuzzyEq (val), Spline (val), ToTransform (val), u4 (val)
    local v1, v2, v3, v4
    local v5 = a2 or 0.5
    local v6 = a3 or 0
    assert(type(a1) == "table", "Points must be a table")
    assert(type(v5) == "number", "Alpha must be a number")
    assert(type(v6) == "number", "Tension must be a number")
    assert(#a1 > 0, "Points table cannot be empty")
    local v7 = typeof(a1[1])
    local v8 = true
    if v7 ~= "Vector2" then
        v8 = true
        if v7 ~= "Vector3" then
            v8 = v7 == "CFrame"
        end
    end
    assert(v8, "Points must be a table of Vector2s, Vector3s, or CFrames")
    local v9 = a1
    for i, v in ipairs(a1) do
        assert(typeof(v) == v7, "All points must have the same type")
    end
    local v10 = {}
    v8 = v9[1]
    v10[1] = v8
    local v11 = 2
    local v12 = #v9
    for i2 = 2, v12 do
        v1 = v9[i2]
        if not FuzzyEq(v1, v8) then
            v10[v11] = v1
            v11 = v11 + 1
            v8 = v1
        end
    end
    v9 = v10
    v8 = #v9
    if v8 == 1 then
        return (setmetatable({
            length = 0,
            alpha = v5,
            tension = v6,
            splines = {Spline.fromPoint((ToTransform(v9[1], v7)))},
            domains = {0},
        }, u4))
    end
    v11 = v9[1]
    v12 = v9[v8]
    if not FuzzyEq(v11, v12) then
        v3 = v9[2]:Lerp(v11, 2)
        v4 = v9[v8 - 1]:Lerp(v12, 2)
    else
        v3 = v9[v8 - 1]
        v4 = v9[2]
    end
    if v8 == 2 then
        v1 = Spline.fromLine(ToTransform(v3, v7), ToTransform(v11, v7), ToTransform(v12, v7), (ToTransform(v4, v7)))
        return (setmetatable({
            alpha = v5,
            tension = v6,
            splines = {v1},
            domains = {0},
            length = v1.length,
        }, u4))
    end
    v1 = v8 - 1
    local v13 = table.create(v1)
    local v14 = ToTransform(v3, v7)
    local v15 = ToTransform(v11, v7)
    local v16 = ToTransform(v9[2], v7)
    local v17 = ToTransform(v9[3] or v4, v7)
    v13[1] = (Spline.new(v14, v15, v16, v17, v5, v6))
    local v18 = 0 + v13[1].length
    local v19 = v8 - 3
    for j = 1, v19 do
        v2 = Spline.new(v15, v16, v17, ToTransform(v9[j + 3], v7), v5, v6)
        v18 = v18 + v2.length
        v13[j + 1] = v2
    end
    v13[v1] = (Spline.new(v15, v16, v17, ToTransform(v4, v7), v5, v6))
    v18 = v18 + v13[v1].length
    v19 = table.create(v1 - 1)
    local v20 = 0
    for i3, k in ipairs(v13) do
        v19[i3] = v20 / v18
        v20 = v20 + k.length
    end
    return (setmetatable({
        alpha = v5,
        tension = v6,
        splines = v13,
        domains = v19,
        length = v18,
    }, u4))
end

function u4:GetSplineFromT(a2) -- Line: 200 -- types: self: table, a2: number
    local v1, v2, v3
    local splines = self.splines
    local domains = self.domains
    local v4 = #splines
    if v4 == 1 then
        return splines[1], a2
    end
    if a2 < 0 then
        return splines[1], a2 / domains[1], 1
    end
    if a2 == 0 then
        return splines[1], 0, 1
    end
    if a2 == 1 then
        return splines[v4], 1, v4
    end
    if a2 > 1 then
        return splines[v4], (a2 - domains[v4]) / (1 - domains[v4]), v4
    end
    local v5 = 1
    local v6 = v4 + 1
    local v7 = a2
    while v5 <= v6 do
        v1 = math.floor((v5 + v6) / 2)
        v2 = domains[v1]
        if not (v2 <= v7) then
            v6 = v1 - 1
        else
            v3 = if v1 ~= v4 then domains[v1 + 1] else 1
            if v7 <= v3 then
                return splines[v1], (v7 - v2) / (v3 - v2), v1
            end
            v5 = v1 + 1
        end
    end
    error("Failed to get spline from t")
end

function u4.PrecomputeArcLengthParams(a1, a2) -- Line: 251 -- types: a1: table, a2: number?
    local v1 = a2 and math.max(1, (math.round(a2))) or 16
    for i, v in ipairs(a1.splines) do
        v:_PrecomputeArcLengthParams(v1)
    end
end

function u4:SolveLength(a2, a3) -- Line: 259 -- types: self: table, a2: number?, a3: number?
    local v1 = a2 or 0
    local v2 = a3 or 1
    if v1 == 0 and v2 == 1 then
        return self.length
    end
    local SplineFromT, SplineFromT_2, SplineFromT_3 = self:GetSplineFromT(v1)
    local SplineFromT_4, SplineFromT_5, SplineFromT_6 = self:GetSplineFromT(v2)
    local v3 = SplineFromT:SolveLength(SplineFromT_2, 1)
    local v4 = SplineFromT_4:SolveLength(0, SplineFromT_5)
    local v5 = 0
    local v6 = SplineFromT_3 + 1
    local v7 = SplineFromT_6 - 1
    for i = v6, v7 do
        v5 = v5 + self.splines[i].length
    end
    return v3 + v5 + v4
end

function u4:SolveUniformLength(a2, a3) -- Line: 289 -- types: self: table, a2: number?, a3: number?
    local v1 = a2 or 0
    local v2 = a3 or 1
    if v1 == 0 and v2 == 1 then
        return self.length
    end
    local SplineFromT, SplineFromT_2, SplineFromT_3 = self:GetSplineFromT(v1)
    local SplineFromT_4, SplineFromT_5, SplineFromT_6 = self:GetSplineFromT(v2)
    local v3 = SplineFromT:SolveUniformLength(SplineFromT_2, 1)
    local v4 = SplineFromT_4:SolveUniformLength(0, SplineFromT_5)
    local v5 = 0
    local v6 = SplineFromT_3 + 1
    local v7 = SplineFromT_6 - 1
    for i = v6, v7 do
        v5 = v5 + self.splines[i].length
    end
    return v3 + v5 + v4
end

function u4:SolvePosition(a2) -- Line: 311 -- types: self: table, a2: number
    local SplineFromT, SplineFromT_2 = self:GetSplineFromT(a2)
    return SplineFromT:SolvePosition(SplineFromT_2)
end

function u4:SolveVelocity(a2) -- Line: 315 -- types: self: table, a2: number
    local SplineFromT, SplineFromT_2 = self:GetSplineFromT(a2)
    return SplineFromT:SolveVelocity(SplineFromT_2)
end

function u4:SolveAcceleration(a2) -- Line: 319 -- types: self: table, a2: number
    local SplineFromT, SplineFromT_2 = self:GetSplineFromT(a2)
    return SplineFromT:SolveAcceleration(SplineFromT_2)
end

function u4:SolveTangent(a2) -- Line: 323 -- types: self: table, a2: number
    local SplineFromT, SplineFromT_2 = self:GetSplineFromT(a2)
    return SplineFromT:SolveTangent(SplineFromT_2)
end

function u4:SolveNormal(a2) -- Line: 327 -- types: self: table, a2: number
    local SplineFromT, SplineFromT_2 = self:GetSplineFromT(a2)
    return SplineFromT:SolveNormal(SplineFromT_2)
end

function u4:SolveBinormal(a2) -- Line: 331 -- types: self: table, a2: number
    local SplineFromT, SplineFromT_2 = self:GetSplineFromT(a2)
    return SplineFromT:SolveBinormal(SplineFromT_2)
end

function u4:SolveCurvature(a2) -- Line: 335 -- types: self: table, a2: number
    local SplineFromT, SplineFromT_2 = self:GetSplineFromT(a2)
    return SplineFromT:SolveCurvature(SplineFromT_2)
end

function u4:SolveCFrame(a2) -- Line: 339 -- types: self: table, a2: number
    local SplineFromT, SplineFromT_2 = self:GetSplineFromT(a2)
    return SplineFromT:SolveCFrame(SplineFromT_2)
end

function u4:SolveRotCFrame(a2) -- Line: 343 -- types: self: table, a2: number
    local SplineFromT, SplineFromT_2 = self:GetSplineFromT(a2)
    return SplineFromT:SolveRotCFrame(SplineFromT_2)
end

function u4:SolveUniformPosition(a2) -- Line: 347 -- types: self: table, a2: number
    local SplineFromT, SplineFromT_2 = self:GetSplineFromT(a2)
    return SplineFromT:SolveUniformPosition(SplineFromT_2)
end

function u4:SolveUniformVelocity(a2) -- Line: 351 -- types: self: table, a2: number
    local SplineFromT, SplineFromT_2 = self:GetSplineFromT(a2)
    return SplineFromT:SolveUniformVelocity(SplineFromT_2)
end

function u4:SolveUniformAcceleration(a2) -- Line: 355 -- types: self: table, a2: number
    local SplineFromT, SplineFromT_2 = self:GetSplineFromT(a2)
    return SplineFromT:SolveUniformAcceleration(SplineFromT_2)
end

function u4:SolveUniformTangent(a2) -- Line: 359 -- types: self: table, a2: number
    local SplineFromT, SplineFromT_2 = self:GetSplineFromT(a2)
    return SplineFromT:SolveUniformTangent(SplineFromT_2)
end

function u4:SolveUniformNormal(a2) -- Line: 363 -- types: self: table, a2: number
    local SplineFromT, SplineFromT_2 = self:GetSplineFromT(a2)
    return SplineFromT:SolveUniformNormal(SplineFromT_2)
end

function u4:SolveUniformBinormal(a2) -- Line: 367 -- types: self: table, a2: number
    local SplineFromT, SplineFromT_2 = self:GetSplineFromT(a2)
    return SplineFromT:SolveUniformBinormal(SplineFromT_2)
end

function u4:SolveUniformCurvature(a2) -- Line: 371 -- types: self: table, a2: number
    local SplineFromT, SplineFromT_2 = self:GetSplineFromT(a2)
    return SplineFromT:SolveUniformCurvature(SplineFromT_2)
end

function u4:SolveUniformCFrame(a2) -- Line: 375 -- types: self: table, a2: number
    local SplineFromT, SplineFromT_2 = self:GetSplineFromT(a2)
    return SplineFromT:SolveUniformCFrame(SplineFromT_2)
end

function u4:SolveUniformRotCFrame(a2) -- Line: 379 -- types: self: table, a2: number
    local SplineFromT, SplineFromT_2 = self:GetSplineFromT(a2)
    return SplineFromT:SolveUniformRotCFrame(SplineFromT_2)
end

return u4