-- Script path: ReplicatedStorage.Client.Modules.BSplineCamera
-- Decompile time: 26.81 ms

local u0 = {}
u0.__index = u0

local function isFiniteNumber(a1) -- Line: 56 -- types: a1: number
    local v1 = false
    if a1 == a1 then
        v1 = false
        if a1 > (-1 / 0) then
            v1 = a1 < (1 / 0)
        end
    end
    return v1
end

local function isFiniteCFrame(a1) -- Line: 60 -- types: a1: userdata
    local v1
    local v2 = {a1:GetComponents()}
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        v1 = false
        if j == j then
            v1 = false
            if j > (-1 / 0) then
                v1 = j < (1 / 0)
            end
        end
        if not v1 then
            return false
        end
    end
    return true
end

local function copyAndValidatePoints(a1) -- Line: 71 -- upvalues: isFiniteCFrame (val) -- types: a1: table
    local v1
    assert(type(a1) == "table", "Points must be a table")
    assert(#a1 > 0, "Points table cannot be empty")
    local v2 = table.create(#a1)
    local v3 = nil
    local v4 = nil
    for i, j in a1, v3, v4 do
        v1 = ("Point %* must be a CFrame"):format(i)
        assert(typeof(j) == "CFrame", v1)
        assert(isFiniteCFrame(j), (("Point %* must contain finite values"):format(i)))
        v2[i] = j
    end
    return v2
end

local function buildUniformParameters(a1) -- Line: 85 -- types: a1: number
    if a1 == 1 then
        return {0}
    end
    local v1 = table.create(a1)
    for i = 1, a1 do
        v1[i] = (i - 1) / (a1 - 1)
    end
    return v1
end

local function unwrapDegrees(a1, a2) -- Line: 98 -- types: a1: number, a2: number
    return a2 + (a1 - a2 + 180) % 360 - 180
end

local function unwrapRotations(a1) -- Line: 102 -- types: a1: table
    local X, X_2, Y, Y_2, Z, Z_2, v1, v2, v3, v4
    local v5 = table.create(#a1)
    for i, j in a1 do
        if i ~= 1 then
            v3 = v5[i - 1]
            X = j.X
            X_2 = v3.X
            v4 = X_2 + (X - X_2 + 180) % 360 - 180
            Y = j.Y
            Y_2 = v3.Y
            v1 = Y_2 + (Y - Y_2 + 180) % 360 - 180
            Z = j.Z
            Z_2 = v3.Z
            v2 = Z_2 + (Z - Z_2 + 180) % 360 - 180
            v5[i] = (Vector3.new(v4, v1, v2))
        else
            v5[i] = j
        end
    end
    return v5
end

local function cframesToValues(a1) -- Line: 120 -- upvalues: unwrapRotations (val) -- types: a1: table
    local v1, v2, v3, v4, v5, v6
    local v7 = table.create(#a1)
    for i, j in a1 do
        v4, v5, v6 = j:ToOrientation()
        v1 = math.deg(v4)
        v2 = math.deg(v5)
        v3 = math.deg(v6)
        v7[i] = (Vector3.new(v1, v2, v3))
    end
    v7 = unwrapRotations(v7)
    local v8 = table.create(#a1)
    for k, n in a1 do
        v5 = {position = n.Position, rotationDegrees = v7[k]}
        v8[k] = v5
    end
    return v8
end

local function valueToCFrame(a1) -- Line: 139 -- types: a1: table
    return (CFrame.new(a1.position)) * CFrame.fromOrientation(math.rad(a1.rotationDegrees.X), math.rad(a1.rotationDegrees.Y), (math.rad(a1.rotationDegrees.Z)))
end

local function scaleValue(a1, a2) -- Line: 148 -- types: a1: table, a2: number
    return {position = a1.position * a2, rotationDegrees = a1.rotationDegrees * a2}
end

local function subtractValues(a1, a2) -- Line: 155 -- types: a1: table, a2: table
    return {
        position = a1.position - a2.position,
        rotationDegrees = a1.rotationDegrees - a2.rotationDegrees,
    }
end

local function lerpValues(a1, a2, a3) -- Line: 162 -- types: a1: table, a2: table, a3: number
    return {
        position = a1.position:Lerp(a2.position, a3),
        rotationDegrees = a1.rotationDegrees:Lerp(a2.rotationDegrees, a3),
    }
end

local function buildKnots(a1, a2) -- Line: 169 -- types: a1: table, a2: number
    local v1, v2, v3
    local v4 = #a1
    local v5 = v4 + a2 + 1
    local v6 = table.create(v5, 0)
    for i = v4 + 1, v5 do
        v6[i] = 1
    end
    local v7 = v4 - a2 - 1
    for j = 1, v7 do
        v2 = 0
        v1 = j + 1
        v3 = j + a2
        for k = v1, v3 do
            v2 = v2 + a1[k]
        end
        v3 = a2 + 1 + j
        v6[v3] = v2 / a2
    end
    return v6
end

local function getBasis(a1, a2, a3) -- Line: 189 -- types: a1: table, a2: number, a3: number
    local v1, v2, v3, v4, v5, v6, v7
    local v8 = #a1 - a2 - 1
    local v9 = math.clamp(a3, 0, 1)
    if v9 >= 1 then
        v5 = table.create(v8, 0)
        v5[v8] = 1
        return v5
    end
    v5 = table.create(#a1 - 1, 0)
    local v10 = #v5
    for i = 1, v10 do
        if a1[i] <= v9 and v9 < a1[i + 1] then
            v5[i] = 1
        end
    end
    for j = 1, a2 do
        v6 = table.create(#v5 - 1, 0)
        v7 = #v6
        for k = 1, v7 do
            v1 = a1[k + j] - a1[k]
            v2 = a1[k + j + 1] - a1[k + 1]
            v3 = if not (v1 > 1e-08) then 0 else (v9 - a1[k]) / v1 * v5[k]
            v4 = if not (v2 > 1e-08) then 0 else (a1[k + j + 1] - v9) / v2 * v5[k + 1]
            v6[k] = v3 + v4
        end
        v5 = v6
    end
    return v5
end

local function solveControls(a1, a2, a3) -- Line: 225 -- types: a1: table, a2: table, a3: number
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
    local v11 = #a2
    local v12 = v11 - 1
    for i = 1, v12 do
        v8 = a1[i][i]
        assert(1e-08 < (math.abs(v8)), "Could not solve B-spline controls for these points")
        for j = i + 1, (math.min(v11, i + a3)) do
            v2 = a1[j][i]
            v3 = math.abs(v2)
            if v3 > 1e-08 then
                v3 = v2 / v8
                a1[j][i] = 0
                for k = i + 1, (math.min(v11, i + a3)) do
                    v7 = a1[j]
                    v7[k] = v7[k] - v3 * a1[i][k]
                end
                v5 = a2[j]
                v7 = a2[i]
                v6 = {
                    position = v7.position * v3,
                    rotationDegrees = v7.rotationDegrees * v3,
                }
                v4 = {
                    position = v5.position - v6.position,
                    rotationDegrees = v5.rotationDegrees - v6.rotationDegrees,
                }
                a2[j] = v4
            end
        end
    end
    v12 = table.create(v11)
    for n = v11, 1, -1 do
        v9 = a1[n][n]
        assert(1e-08 < (math.abs(v9)), "Could not solve B-spline controls for these points")
        v10 = a2[n]
        for m = n + 1, (math.min(v11, n + a3)) do
            v4 = v10
            v6 = v12[m]
            v7 = a1[n][m]
            v5 = {
                position = v6.position * v7,
                rotationDegrees = v6.rotationDegrees * v7,
            }
            v10 = {
                position = v4.position - v5.position,
                rotationDegrees = v4.rotationDegrees - v5.rotationDegrees,
            }
        end
        v3 = 1 / v9
        v1 = {position = v10.position * v3, rotationDegrees = v10.rotationDegrees * v3}
        v12[n] = v1
    end
    return v12
end

local function buildInterpolatingControls(a1, a2, a3, a4) -- Line: 268
    -- upvalues: getBasis (val), solveControls (val)
    local v1 = table.create(#a1)
    for i, j in a2 do
        v1[i] = (getBasis(a4, a3, j))
    end
    return (solveControls(v1, table.clone(a1), a3))
end

local function findSpan(a1, a2, a3, a4) -- Line: 282 -- types: a1: table, a2: number, a3: number, a4: number
    local v1
    if a4 >= 1 then
        return a3
    end
    local v2 = a2 + 1
    local v3 = a3
    local v4, v5, v6 = a1, a4, a3
    while v2 <= v3 do
        v1 = math.floor((v2 + v3) / 2)
        if v5 < v4[v1] then
            v3 = v1 - 1
        elseif not (v4[v1 + 1] <= v5) then
            return v1
        else
            v2 = v1 + 1
        end
    end
    return v6
end

local function solveValue(a1, a2) -- Line: 308 -- upvalues: findSpan (val) -- types: a1: table, a2: number
    local v1, v2, v3, v4, v5, v6, v7
    local v8 = math.clamp(a2, 0, 1)
    if #a1.controls == 1 then
        return a1.controls[1]
    end
    local v9 = findSpan(a1.knots, a1.degree, #a1.controls, v8)
    local v10 = table.create(a1.degree + 1)
    local degree_2 = a1.degree
    for i = 0, degree_2 do
        v10[i + 1] = a1.controls[v9 - a1.degree + i]
    end
    local degree_3 = a1.degree
    for j = 1, degree_3 do
        v7 = j
        for k = a1.degree, v7, -1 do
            v1 = v9 - a1.degree + k
            v2 = a1.knots[v9 + k - j + 1] - a1.knots[v1]
            v3 = if not (v2 > 1e-08) then 0 else (v8 - a1.knots[v1]) / v2
            v4 = k + 1
            v5 = v10[k]
            v6 = v10[k + 1]
            v10[v4] = {
                position = v5.position:Lerp(v6.position, v3),
                rotationDegrees = v5.rotationDegrees:Lerp(v6.rotationDegrees, v3),
            }
        end
    end
    return v10[a1.degree + 1]
end

local function getParameterAtDistance(a1, a2) -- Line: 336 -- types: a1: table, a2: number
    local v1
    local v2 = math.clamp(a2, 0, 1)
    if v2 <= 0 then
        return 0
    end
    if v2 >= 1 then
        return 1
    end
    if a1.length <= 1e-08 then
        return v2
    end
    local v3 = v2 * a1.length
    local _arcLengthSamples = a1._arcLengthSamples
    local v4 = 2
    local v5 = #_arcLengthSamples
    while v4 < v5 do
        v1 = math.floor((v4 + v5) / 2)
        if not (_arcLengthSamples[v1].length < v3) then
            v5 = v1
        else
            v4 = v1 + 1
        end
    end
    v1 = _arcLengthSamples[v4]
    local v6 = _arcLengthSamples[v4 - 1]
    local v7 = v1.length - v6.length
    return (math.lerp(v6.parameter, v1.parameter, if not (v7 > 1e-08) then 0 else (v3 - v6.length) / v7))
end

function u0.new(a1, a2, a3) -- Line: 368
    -- upvalues: copyAndValidatePoints (val), cframesToValues (val), buildUniformParameters (val), buildKnots (val)
    -- upvalues: buildInterpolatingControls (val), u0 (val)
    local v1
    local v2 = a2 or "Points"
    local v3 = true
    if v2 ~= "Points" then
        v3 = v2 == "ControlPoints"
    end
    assert(v3, "Mode must be \"Points\" or \"ControlPoints\"")
    local v4 = copyAndValidatePoints(a1)
    v3 = cframesToValues(v4)
    local v5 = a3 or 3
    local v6 = false
    if type(v5) == "number" then
        v6 = false
        if v5 % 1 == 0 then
            v6 = v5 >= 1
        end
    end
    assert(v6, "Degree must be a positive integer")
    v5 = math.min(v5, #v4 - 1)
    if #v4 == 1 then
        v5 = 0
    end
    local v7 = buildUniformParameters(#v4)
    v6 = buildKnots(v7, v5)
    local v8 = {
        length = 0,
        mode = v2,
        points = v4,
        controls = if v2 ~= "Points" then v3 else buildInterpolatingControls(v3, v7, v5, v6),
        degree = v5,
        knots = v6,
        domains = v7,
        _arcLengthSamples = {},
    }
    local v9 = setmetatable(v8, u0)
    v9:PrecomputeArcLengthParams((math.max((#v1 - 1) * 32, 32)))
    return v9
end

function u0:PrecomputeArcLengthParams(a2) -- Line: 410 -- upvalues: solveValue (val) -- types: self: table, a2: number?
    local position, v1
    local v2 = a2 or math.max((#self.controls - 1) * 32, 32)
    assert(type(v2) == "number", "Number of intervals must be a number")
    v2 = math.max(1, (math.round(v2)))
    local v3 = table.create(v2 + 1)
    local v4 = 0
    local v5 = nil
    local v6 = self
    for i = 0, v2 do
        v1 = i / v2
        position = solveValue(v6, v1).position
        if v5 then
            v4 = v4 + (position - v5).Magnitude
        end
        v3[i + 1] = {length = v4, parameter = v1}
    end
    v6._arcLengthSamples = v3
    v6.length = v4
end

function u0.Solve(a1, a2) -- Line: 435 -- types: a1: table, a2: number
    return a1:SolveCFrame(a2)
end

function u0.SolveUniform(a1, a2) -- Line: 439 -- types: a1: table, a2: number
    return a1:SolveUniformCFrame(a2)
end

function u0.SolveCFrame(a1, a2) -- Line: 443 -- upvalues: solveValue (val) -- types: a1: table, a2: number
    assert(type(a2) == "number", "Parameter must be a number")
    local v1 = solveValue(a1, a2)
    return (CFrame.new(v1.position)) * CFrame.fromOrientation(math.rad(v1.rotationDegrees.X), math.rad(v1.rotationDegrees.Y), (math.rad(v1.rotationDegrees.Z)))
end

function u0.SolveUniformCFrame(a1, a2) -- Line: 448
    -- upvalues: solveValue (val), getParameterAtDistance (val)
    assert(type(a2) == "number", "Alpha must be a number")
    local v1 = solveValue(a1, (getParameterAtDistance(a1, a2)))
    return (CFrame.new(v1.position)) * CFrame.fromOrientation(math.rad(v1.rotationDegrees.X), math.rad(v1.rotationDegrees.Y), (math.rad(v1.rotationDegrees.Z)))
end

function u0.GetUniformParameter(a1, a2) -- Line: 454
    -- upvalues: getParameterAtDistance (val)
    assert(type(a2) == "number", "Alpha must be a number")
    return (getParameterAtDistance(a1, a2))
end

function u0.SolvePosition(a1, a2) -- Line: 459 -- upvalues: solveValue (val) -- types: a1: table, a2: number
    assert(type(a2) == "number", "Parameter must be a number")
    return solveValue(a1, a2).position
end

function u0.SolveUniformPosition(a1, a2) -- Line: 464
    -- upvalues: solveValue (val), getParameterAtDistance (val)
    assert(type(a2) == "number", "Alpha must be a number")
    return solveValue(a1, (getParameterAtDistance(a1, a2))).position
end

function u0.SolveVelocity(a1, a2) -- Line: 469 -- upvalues: solveValue (val) -- types: a1: table, a2: number
    assert(type(a2) == "number", "Parameter must be a number")
    local v1 = math.clamp(a2, 0, 1)
    local v2 = math.max(0, v1 - 0.0001)
    local v3 = math.min(1, v1 + 0.0001)
    local v4 = v3 - v2
    if v4 <= 1e-08 then
        return (Vector3.new(0, 0, 0))
    end
    return (solveValue(a1, v3).position - solveValue(a1, v2).position) / v4
end

function u0.SolveTangent(a1, a2) -- Line: 484 -- types: a1: table, a2: number
    local v1 = a1:SolveVelocity(a2)
    if 1e-08 < v1.Magnitude then
        return v1.Unit
    end
    return (Vector3.new(0, 0, 0))
end

return u0