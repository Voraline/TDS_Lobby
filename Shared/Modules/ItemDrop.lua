-- Script path: ReplicatedStorage.Shared.Modules.ItemDrop
-- Decompile time: 3.13 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local u10 = {}
local GameState = require(script.Parent.GameState)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)

function u10.GetTimeToDestination(a1, a2) -- Line: 13 -- types: a1: vector, a2: vector
    local v1 = a2.Y * 2 * -0.1 - a1.Y * -0.2 + 1
    if v1 < 0 then
        return 10
    end
    return -((math.sqrt(v1) + 1) / -0.1)
end

function u10.GetTimeToDestinationWithGV(a1, a2, a3, a4) -- Line: 21
    -- upvalues: 
    local v1 = a2.Y * 2 * a3 - a3 * 2 * a1.Y + a4 * a4
    if v1 < 0 then
        return -(a4 / a3)
    end
    return -((math.sqrt(v1) + a4) / a3)
end

function u10.Step(a1, a2, a3) -- Line: 34 -- upvalues: u10 (val) -- types: a1: vector, a2: vector, a3: number
    local v1 = u10.GetTimeToDestination(a1, a2)
    if v1 ~= v1 then
        local Magnitude = (a1 - a2).Magnitude
        return (a1:Lerp(a2, a3 / Magnitude)), Magnitude <= a3
    end
    local v2 = math.clamp(a3, (-1 / 0), v1)
    local X = a1.X
    local Y = a1.Y
    local Z_2 = a1.Z
    local X_2 = a2.X
    local Z = a2.Z
    local v3 = (X_2 - X) / v1
    local v4 = (Z - Z_2) / v1
    return (Vector3.new(X + v3 * v2, Y + v2 * 1 + v2 * -0.05 * v2, Z_2 + v4 * v2)), v1 <= v2
end

function u10.StepWithGV(a1, a2, a3, a4, a5, a6) -- Line: 60
    -- upvalues: 
    local X = a1.X
    local Y = a1.Y
    local Z = a1.Z
    local X_2 = a2.X
    local Z_2 = a2.Z
    local v1 = (X_2 - X) / a6
    local v2 = (Z_2 - Z) / a6
    return (Vector3.new(X + v1 * a3, Y + a5 * a3 + a4 * 0.5 * a3 * a3, Z + v2 * a3)), a6 <= a3
end

local u30 = {}
Scheduler.add("ItemDrop", RunService.PreSimulation, function(a1) -- Line: 88 -- upvalues: u30 (val), GameState (val), u10 (val)
    local alpha, identity, v1, v2, v3
    if #u30 == 0 then
        return
    end
    local v4 = {}
    local v5 = {}
    local v6 = nil
    local v7 = nil
    local v8 = a1
    for i, j in u30, v6, v7 do
        if not j.done then
            alpha = j.alpha
            v1 = v8 * j.dtMultiplier
            j.alpha = alpha + v1 * GameState.TimeScale
            v3, v1 = u10.StepWithGV(j.origin, j.destination, j.alpha, j.myG, j.myV, j.t)
            j.done = v1
            v2 = v3
            v3 = u10.StepWithGV(j.origin, j.destination, j.alpha - v8, j.myG, j.myV, j.t)
            identity = CFrame.identity
            v1 = identity * (j.rotationModifierFunction and j.rotationModifierFunction(j.alpha, v2, v3) or CFrame.identity) + v2
            if j.adornee then
                if not j.adornee:IsA("Model") then
                    table.insert(v4, v1)
                    table.insert(v5, j.adornee)
                else
                    j.adornee:PivotTo(v1)
                end
            end
        end
    end
    if #v4 ~= 0 and #v5 ~= 0 then
        if #v4 ~= #v5 then
            return
        end
        workspace:BulkMoveTo(v5, v4, Enum.BulkMoveMode.FireCFrameChanged)
        return
    end
end)

function u10.Drop(a1, a2, a3, a4, a5, a6, a7, a8) -- Line: 153
    -- upvalues: u10 (val), u30 (val), Promise (val)
    local u8 = {
        alpha = 0,
        done = false,
        origin = a1,
        destination = a2,
        adornee = a3,
        dtMultiplier = a4 or 1,
        myG = a5 or -0.1,
        myV = a6 or 1,
        rotationModifierFunction = a7,
    }
    u8.t = a8 or u10.GetTimeToDestinationWithGV(a1, a2, a5, a6)
    table.insert(u30, u8)
    return (Promise.new(function(a1, a2_2, a3) -- Line: 179 -- upvalues: u8 (val), u30 (upval), a2 (val)
        local v1
        while not u8.done do
            if a3() then
                v1 = table.find(u30, u8)
                if v1 then
                    table.remove(u30, v1)
                end
                return
            end
            task.wait()
        end
        a1(a2)
    end)):finally(function() -- Line: 194 -- upvalues: u30 (upval), u8 (val)
        local v1 = table.find(u30, u8)
        if v1 then
            table.remove(u30, v1)
        end
    end)
end

return u10