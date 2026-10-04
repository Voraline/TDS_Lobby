-- Script path: ReplicatedStorage.Shared.Modules.ArcPath
-- Decompile time: 9.18 ms

local v1 = {}

local function isFiniteNumber(a1) -- Line: 5 -- types: a1: number
    local v1 = false
    if a1 == a1 then
        v1 = false
        if a1 > (-1 / 0) then
            v1 = a1 < (1 / 0)
        end
    end
    return v1
end

local function safeUnit(a1) -- Line: 15 -- types: a1: vector
    local X = a1.X
    local v1 = false
    if X == X then
        v1 = false
        if X > (-1 / 0) then
            v1 = X < (1 / 0)
        end
    end
    if v1 then
        local Y = a1.Y
        v1 = false
        if Y == Y then
            v1 = false
            if Y > (-1 / 0) then
                v1 = Y < (1 / 0)
            end
        end
        if v1 then
            local Z = a1.Z
            v1 = false
            if Z == Z then
                v1 = false
                if Z > (-1 / 0) then
                    v1 = Z < (1 / 0)
                end
            end
            if v1 then
                local Magnitude = a1.Magnitude
                local v2 = false
                if Magnitude == Magnitude then
                    v2 = false
                    if Magnitude > (-1 / 0) then
                        v2 = Magnitude < (1 / 0)
                    end
                end
                if v2 and not (Magnitude <= 1e-06) then
                    return a1 / Magnitude
                end
                return (Vector3.new(0, 0, 0))
            end
        end
    end
    return (Vector3.new(0, 0, 0))
end

local function makeArc(a1, a2, a3) -- Line: 44 -- upvalues: safeUnit (val) -- types: a1: vector, a2: vector, a3: vector
    local v1 = safeUnit(a2)
    if v1.Magnitude < 1e-06 then
        return {
            isLine = true,
            radius = 0,
            basisX = Vector3.new(0, 0, 0),
            basisY = Vector3.new(0, 0, 0),
            sweepAngle = 0,
            startPoint = a1,
            endPoint = a3,
            center = a1,
        }
    end
    local v2 = safeUnit(v1:Cross(a3 - a1))
    if v2.Magnitude < 1e-06 then
        return {
            isLine = true,
            radius = 0,
            basisX = Vector3.new(0, 0, 0),
            basisY = Vector3.new(0, 0, 0),
            sweepAngle = 0,
            startPoint = a1,
            endPoint = a3,
            center = a1,
        }
    end
    local v3 = safeUnit(v2:Cross(v1))
    if v3.Magnitude < 1e-06 then
        return {
            isLine = true,
            radius = 0,
            basisX = Vector3.new(0, 0, 0),
            basisY = Vector3.new(0, 0, 0),
            sweepAngle = 0,
            startPoint = a1,
            endPoint = a3,
            center = a1,
        }
    end
    local v4 = a1 - a3
    local v5 = v4:Dot(v3)
    if (math.abs(v5)) < 1e-06 then
        return {
            isLine = true,
            radius = 0,
            basisX = Vector3.new(0, 0, 0),
            basisY = Vector3.new(0, 0, 0),
            sweepAngle = 0,
            startPoint = a1,
            endPoint = a3,
            center = a1,
        }
    end
    local v6 = -v4:Dot(v4) / (2 * v5)
    local v7 = false
    if v6 == v6 then
        v7 = false
        if v6 > (-1 / 0) then
            v7 = v6 < (1 / 0)
        end
    end
    if not v7 then
        return {
            isLine = true,
            radius = 0,
            basisX = Vector3.new(0, 0, 0),
            basisY = Vector3.new(0, 0, 0),
            sweepAngle = 0,
            startPoint = a1,
            endPoint = a3,
            center = a1,
        }
    end
    v7 = a1 + v3 * v6
    local v8 = math.abs(v6)
    local v9 = safeUnit(a1 - v7)
    local v10 = safeUnit(v2:Cross(v9))
    if not (v9.Magnitude < 1e-06) and not (v10.Magnitude < 1e-06) then
        if (v10:Dot(v1)) < 0 then
            v10 = -v10
        end
        local v11 = a3 - v7
        return {
            isLine = false,
            startPoint = a1,
            endPoint = a3,
            center = v7,
            radius = v8,
            basisX = v9,
            basisY = v10,
            sweepAngle = math.atan2(v11:Dot(v10), (v11:Dot(v9))) % 6.283185307179586,
        }
    end
    return {
        isLine = true,
        radius = 0,
        basisX = Vector3.new(0, 0, 0),
        basisY = Vector3.new(0, 0, 0),
        sweepAngle = 0,
        startPoint = a1,
        endPoint = a3,
        center = a1,
    }
end

local function getArcPoint(a1, a2) -- Line: 160 -- types: a1: table, a2: number
    if a1.isLine then
        return a1.startPoint:Lerp(a1.endPoint, a2)
    end
    local v1 = a1.sweepAngle * a2
    return a1.center + a1.basisX * (a1.radius * math.cos(v1)) + a1.basisY * (a1.radius * math.sin(v1))
end

local function getArcTangent(a1, a2) -- Line: 172 -- upvalues: safeUnit (val) -- types: a1: table, a2: number
    if a1.isLine then
        return (safeUnit(a1.endPoint - a1.startPoint))
    end
    local v1 = a1.sweepAngle * a2
    return (safeUnit(a1.basisX * -math.sin(v1) + a1.basisY * math.cos(v1)))
end

local function createBiarc(a1, a2, a3, a4) -- Line: 182
    -- upvalues: safeUnit (val), makeArc (val)
    local v1, v2, v3
    local v4 = a3 - a1
    local v5 = safeUnit(v4)
    local v6 = safeUnit(a2)
    local v7 = safeUnit(a4)
    if v6.Magnitude < 1e-06 then
        v6 = v5
    end
    if v7.Magnitude < 1e-06 then
        v7 = v5
    end
    local v8 = v6 + v7
    local v9 = 2 * (1 - v6:Dot(v7))
    local v10 = v4:Dot(v8)
    local v11 = v4:Dot(v4)
    if not (v9 < 1e-06) then
        v1 = (-v10 + math.sqrt((math.max(0, v10 * v10 + v9 * v11)))) / v9
    else
        v2 = v4:Dot(v7)
        v1 = if not (1e-06 < (math.abs(v2))) then if not (v11 > 0) then 0 else math.sqrt(v11) / 2 else v11 / (4 * v2)
    end
    v2 = false
    if v1 == v1 then
        v2 = false
        if v1 > (-1 / 0) then
            v2 = v1 < (1 / 0)
        end
    end
    if not v2 or v1 < 0 then
        v1 = if not (v11 > 0) then 0 else math.sqrt(v11) / 2
    end
    v2 = (a1 + a3 + (v6 - v7) * v1) * 0.5
    local v12 = makeArc(a1, v6, v2)
    if not v12.isLine then
        local v13 = v12.sweepAngle * 1
        v3 = safeUnit(v12.basisX * -math.sin(v13) + v12.basisY * math.cos(v13))
    else
        v3 = safeUnit(v12.endPoint - v12.startPoint)
    end
    return v12, (makeArc(v2, v3, a3))
end

local function computeSegmentTangents(a1, a2, a3) -- Line: 243
    -- upvalues: safeUnit (val)
    local v1, v2, v3, v4
    local v5 = #a1
    local v6 = table.create(v5)
    local v7 = table.create(v5)
    local v8 = safeUnit(a1[2] - a1[1])
    local v9 = safeUnit(a1[v5] - a1[v5 - 1])
    v6[1] = (safeUnit(a2))
    v7[v5] = (safeUnit(a3))
    if v6[1].Magnitude < 1e-06 then
        v6[1] = v8
    end
    if v7[v5].Magnitude < 1e-06 then
        v7[v5] = v9
    end
    local v10 = v5 - 1
    local v11 = a1
    for i = 2, v10 do
        v1 = safeUnit(v11[i] - v11[i - 1])
        v2 = safeUnit(v11[i + 1] - v11[i])
        v3 = v1 + v2
        if v1.Magnitude < 1e-06 then
            v1 = v2
        end
        if v2.Magnitude < 1e-06 then
            v2 = v1
        end
        if not (v3.Magnitude < 1e-06) then
            v4 = safeUnit(v3)
            v7[i] = v4
            v6[i] = v4
        else
            v7[i] = v1
            v6[i] = v2
        end
    end
    return v6, v7
end

local u8 = {}
u8.__index = u8

function v1.new(a1, a2, a3, a4) -- Line: 307
    -- upvalues: computeSegmentTangents (val), createBiarc (val), getArcPoint (val), safeUnit (val), u8 (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9
    local v10 = a4 or {}
    local v11 = math.max(2, (math.floor(v10.Resolution or 200)))
    local v12 = math.max(1e-06, v10.ArcAngleStep or 0.1)
    local v13 = #a1
    assert(v13 >= 2, "ArcPath.new needs at least 2 points")
    local v14, v15 = computeSegmentTangents(a1, a2, a3)
    local v16 = {a1[1]}
    local v17 = table.create(v13)
    v17[1] = 1
    local MinRadius = a4 and a4.MinRadius or (1 / 0)
    local v18 = v13 - 1
    local v19 = a1
    for i = 1, v18 do
        v1, v2 = createBiarc(v19[i], v14[i], v19[i + 1], v15[i + 1])
        v3 = {v1, v2}
        v4 = nil
        v5 = nil
        for j, k in v3, v4, v5 do
            if not k.isLine then
                MinRadius = math.min(MinRadius, k.radius)
            end
            v7 = if not k.isLine then math.max(6, (math.ceil(k.sweepAngle / v12))) else 1
            for n = 1, v7 do
                v8 = getArcPoint
                v9 = n / v7
                v8 = v8(k, v9)
                table.insert(v16, v8)
            end
        end
        v17[i + 1] = #v16
    end
    v18 = #v16
    local v20 = table.create(v18)
    v20[1] = 0
    for m = 2, v18 do
        v4 = v20[m - 1]
        v20[m] = v4 + (v16[m] - v16[m - 1]).Magnitude
    end
    local v21 = v20[v18]
    v1 = false
    if v21 == v21 then
        v1 = false
        if v21 > (-1 / 0) then
            v1 = v21 < (1 / 0)
        end
    end
    if not v1 then
        v21 = 0
    end
    v1 = table.create(v13)
    for i5 = 1, v13 do
        v5 = if not (v21 > 1e-06) then (i5 - 1) / (v13 - 1) else v20[v17[i5]] / v21
        v1[i5] = v5
    end
    v2 = table.create(v11 + 1)
    if not (v21 < 1e-06) then
        local v22, v23
        v3 = 1
        for i6 = 0, v11 do
            v6 = i6 / v11 * v21
            while v3 < v18 - 1 do
                if not (v20[v3 + 1] < v6) then
                    break
                end
                v3 = v3 + 1
            end
            v7 = v20[v3 + 1] - v20[v3]
            v22 = if not (v7 > 1e-06) then 0 else (v6 - v20[v3]) / v7
            v23 = i6 + 1
            v2[v23] = (v16[v3]:Lerp(v16[v3 + 1], v22))
        end
        v2[v11 + 1] = v16[v18]
    else
        for i7 = 0, v11 do
            v2[i7 + 1] = v16[1]
        end
    end
    v3 = table.create(v11 + 1)
    v4 = v11 + 1
    for i8 = 1, v4 do
        v6 = v2[math.min(v11 + 1, i8 + 1)]
        v7 = v2[math.max(1, i8 - 1)]
        v3[i8] = (safeUnit(v6 - v7))
    end
    return (setmetatable({
        Length = v21,
        MinRadius = if MinRadius ~= (1 / 0) then MinRadius else 0,
        WaypointT = v1,
        _resolution = v11,
        _positions = v2,
        _directions = v3,
    }, u8))
end

local function getLookupValues(a1, a2, a3) -- Line: 428 -- types: a1: table, a2: number, a3: number
    local v1
    local v2 = false
    if a3 == a3 then
        v2 = false
        if a3 > (-1 / 0) then
            v2 = a3 < (1 / 0)
        end
    end
    v2 = (if not v2 then 0 else math.clamp(a3, 0, 1)) * a2
    local v3 = math.floor(v2)
    local v4 = a1[#a1] or Vector3.new(0, 0, 0)
    if a2 <= v3 then
        v1 = a1[a2 + 1] or v4
        return v1, v1, 0
    end
    v1 = math.max(1, v3 + 1)
    local v5 = math.min(v1 + 1, a2 + 1)
    local v6 = a1[v1] or v4
    return v6, a1[v5] or v6, v2 - v3
end

function u8:get(a2) -- Line: 451 -- upvalues: getLookupValues (val) -- types: self: table, a2: number
    local v1, v2, v3 = getLookupValues(self._positions, self._resolution, a2)
    return v1:Lerp(v2, v3)
end

function u8:getDirection(a2) -- Line: 457
    -- upvalues: getLookupValues (val), safeUnit (val)
    local v1, v2, v3 = getLookupValues(self._directions, self._resolution, a2)
    return (safeUnit(v1:Lerp(v2, v3)))
end

function u8.getCFrame(a1, a2) -- Line: 464 -- types: a1: table, a2: number
    local v1 = a1:get(a2)
    local v2 = a1:getDirection(a2)
    if v2.Magnitude < 1e-06 then
        return CFrame.new(v1)
    end
    return CFrame.lookAt(v1, v1 + v2)
end

function u8.getWaypointT(a1, a2) -- Line: 475 -- types: a1: table, a2: number
    return a1.WaypointT[a2]
end

function u8.destroy(a1) -- Line: 479
    a1._positions = nil
    a1._directions = nil
    a1.WaypointT = nil
    setmetatable(a1, nil)
end

return v1