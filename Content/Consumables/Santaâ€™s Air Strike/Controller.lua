-- Script path: ReplicatedStorage.Content.Consumables.Santa’s Air Strike.Controller
-- Decompile time: 4.05 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local TeamOctrees = require(ReplicatedStorage.Shared.Modules.TeamOctrees)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u46 = {
    Duration = 3,
    Damage = 0,
    DefenseMelt = 20,
    CanFreeze = true,
    MaxSlow = 70,
    FreezeTime = 3,
    SlowPercent = 35,
    TickRate = 0.1,
}

local function getGroundRay(a1) -- Line: 47 -- types: a1: vector
    local v1 = RaycastParams.new()
    v1.FilterType = Enum.RaycastFilterType.Include
    v1.FilterDescendantsInstances = {workspace:WaitForChild("Map")}
    local v2 = workspace:Raycast(a1, Vector3.new(0, -100, 0), v1)
    if v2 then
        return v2.Position
    end
    return nil
end

local function getPositions(a1) -- Line: 61
    local v1 = (CFrame.new(a1.position, a1.position - a1.direction * Vector3.new(1, 0, 1))) * CFrame.new(0, 15, 0)
    local v2 = a1.position + Vector3.new(0, 15, 0)
    local v3 = v1 * CFrame.new(0, 30, 120) * CFrame.new(130, 0, 30)
    v2 = (CFrame.new(v2, v3.Position)) * CFrame.Angles(-0.03490658503988659, -0.17453292519943295, 0.3490658503988659)
    local v4 = (CFrame.new((v1 * CFrame.new(0, 30, -120)).Position, v2.Position)) * CFrame.Angles(-0.08726646259971647, -0.3490658503988659, 0.7853981633974483)
    v3 = (CFrame.new(v3.Position, v2.Position)) * CFrame.Angles(-0.10471975511965978, 3.141592653589793, 0.5235987755982988)
    return {v4, v2, v3}
end

local function getBombs(a1) -- Line: 92 -- upvalues: getGroundRay (val), table (val)
    local Position, Position_2, v1, v2, v3, v4
    _, v4 = CFrame.lookAt(Vector3.new(0, 0, 0), a1.direction).Rotation:ToOrientation()
    local v5 = (CFrame.new(a1.position)) * CFrame.Angles(0, v4, 0)
    local v6 = {}
    local v7 = Random.new():NextInteger(3, 5)
    local v8 = v7 / 2
    local v9 = 1.815 - 0.1 * v7 / 2 - 0.1
    for i = -v8, v8 do
        v1 = i + v8
        v2 = v5 * CFrame.new(0, 0, i * 2.5)
        Position = (v2 + Vector3.new(0, 10, 0)).Position
        Position_2 = getGroundRay(Position) or v2.Position
        v3 = v9 + 0.1 * (v7 - v1)
        table.insert(v6, {
            elapsed = 0,
            tick = 0,
            startPosition = Position,
            endPosition = Position_2,
            radius = Random.new():NextNumber(4, 6),
            startsAt = v3,
        })
    end
    return v6
end

return {
    CreateContext = function(a1) -- Line: 129 -- upvalues: getPositions (val), getBombs (val)
        a1.airstrikeDuration = 3.63
        a1.airstrikePositions = getPositions(a1)
        a1.bombs = getBombs(a1)
        a1.bombDuration = 15
        a1.bombDropTime = 1
        a1.bombHeight = 10
    end,
    OnUse = function(a1) -- Line: 138
        -- upvalues: TypedPromise (val), table (val), RunService (val), GameState (val), TeamOctrees (val), Enum (val)
        -- upvalues: u46 (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 139
            -- upvalues: a1 (val), table (upval), RunService (upval), GameState (upval), TeamOctrees (upval)
            -- upvalues: Enum (upval), u46 (upval)
            local Context = a1.Context
            local u8 = table.deepClone(Context.bombs)
            local u9 = nil
            u9 = RunService.Stepped:Connect(function(a1, a2) -- Line: 144
                -- upvalues: GameState (upval), u8 (val), table (upval), TeamOctrees (upval), Enum (upval), u46 (upval)
                -- upvalues: u9 (ref), a1_2 (val)
                local v1, v2, v3
                local v4 = a2 * GameState.TimeScale
                local v5 = {}
                local v6 = false
                for i = #u8, 1, -1 do
                    v2 = u8[i]
                    v6 = true
                    v2.startsAt = v2.startsAt - v4
                    if not (0 < v2.startsAt) then
                        v2.tick = v2.tick + v4
                        v2.elapsed = v2.elapsed + v4
                        if not (15 < v2.elapsed) then
                            v3 = 0.1 < v2.tick
                            for j, k in (TeamOctrees.getTargets(Enum.Team.Player, v2.endPosition, v2.radius)) do
                                if not v5[k]
                                    and not k.StatusEffects:has(Enum.StatusEffect.FireImmune)
                                    and k.Spawned ~= false then
                                    v1 = u46
                                    k:ApplyDebuff(Enum.DebuffType.Frost, u46.Duration, v1)
                                    if v3 then
                                        v5[k] = true
                                    end
                                end
                            end
                            if v3 then
                                v2.tick = 0
                            end
                        else
                            table.remove(u8, i)
                        end
                    end
                end
                if v6 then
                    return
                end
                print("completed")
                u9:Disconnect()
                a1_2()
            end)
            a3(function() -- Line: 209 -- upvalues: u9 (ref)
                if u9.Connected then
                    u9:Disconnect()
                end
            end)
        end)
    end,
}