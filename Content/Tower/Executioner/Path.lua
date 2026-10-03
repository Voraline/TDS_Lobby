-- Script path: ReplicatedStorage.Content.Tower.Executioner.Path
-- Decompile time: 2.52 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ArcPath = require(ReplicatedStorage.Shared.Modules.ArcPath)
local ExecutionerTiming = require(ReplicatedStorage.Shared.Modules.ExecutionerTiming)
local u15 = {Windup = ExecutionerTiming.Windup, Catch = ExecutionerTiming.Catch}

function u15.direction(a1, a2) -- Line: 19 -- types: a1: vector, a2: vector
    if 0.0001 < a1.Magnitude then
        return a1.Unit
    end
    return a2
end

function u15.contactDirection(a1, a2, a3, a4, a5) -- Line: 23
    -- upvalues: u15 (val)
    return u15.direction(
        a1:Cross((Vector3.new(0, 1, 0))) * a5 * (if a2 % 2 ~= 0 then -1 else 1) + (if not a4 then Vector3.new(0, 0, 0) else a1 * a3 * 0.65),
        a1
    )
end

function u15.build(a1) -- Line: 37 -- upvalues: ArcPath (val) -- types: a1: table
    return ArcPath.new(a1.Points, a1.StartDirection, a1.EndDirection, {Resolution = 200, ArcAngleStep = 0.05})
end

function u15.describe(a1, a2, a3, a4, a5, a6, a7, a8) -- Line: 44
    -- upvalues: u15 (val), ExecutionerTiming (val)
    local v1, v2
    local v3 = {a1, a3}
    local v4 = a3 - a1
    if v4.Magnitude < 0.1 then
        v1 = u15.direction(a2:Cross((Vector3.new(0, 1, 0))), a8)
        if (v1:Dot(a8)) < 0 then
            v1 = -v1
        end
        v2 = math.max(a6 * (if not a7 then 0.12 else 0.3), 1)
        local v5 = {}
        local v6 = a1 + (a2 + v1) * v2
        local v7 = a1 + v1 * v2 * 2
        local v8 = a1 + (-a2 + v1) * v2
        v5[1] = a1
        v5[2] = v6
        v5[3] = v7
        v5[4] = v8
        v5[5] = a3
        v3 = v5
    elseif a7 then
        v1 = u15.direction(v4:Cross((Vector3.new(0, 1, 0))), a8)
        if (v1:Dot(a8)) < 0 then
            v1 = -v1
        end
        table.insert(v3, 2, (a1 + a3) * 0.5 + v1 * (math.max(a6 * 0.3, 2)))
    end
    v1 = {
        Duration = 0,
        Points = v3,
        StartDirection = u15.direction(a2, (Vector3.new(1, 0, 0))),
        EndDirection = u15.direction(a4, a2),
        StartTime = a5,
        Phase = if not a7 then "Flying" else "Returning",
    }
    v2 = u15.build(v1)
    v1.Duration = math.clamp(
        v2.Length / ((math.max(a6, 0.1)) / ExecutionerTiming.MaxFlightTime),
        if not a7 then 0.08 else 0.12,
        if not a7 then ExecutionerTiming.MaxFlightTime else ExecutionerTiming.MaxReturnTime
    )
    return v1, v2
end

function u15.evaluate(a1, a2, a3) -- Line: 100 -- upvalues: u15 (val) -- types: a1: table, a3: number
    local v1 = math.clamp((a3 - a1.StartTime) / a1.Duration, 0, 1)
    return (a2:get(v1)), u15.direction(a2:getDirection(v1), a1.StartDirection)
end

function u15.isNewer(a1, a2) -- Line: 106
    local v1 = not a2
    if not v1 then
        v1 = true
        if not (a2.ThrowId < a1.ThrowId) then
            v1 = false
            if a1.ThrowId == a2.ThrowId then
                v1 = a2.Revision < a1.Revision
            end
        end
    end
    return v1
end

function u15.activeCurve(a1, a2) -- Line: 113 -- types: a1: table, a2: number
    for i, j in a1 do
        if a2 < j.StartTime + j.Duration then
            return j, i
        end
    end
    return a1[#a1], #a1
end

return u15