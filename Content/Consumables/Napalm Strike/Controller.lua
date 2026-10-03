-- Script path: ReplicatedStorage.Content.Consumables.Napalm Strike.Controller
-- Decompile time: 4.03 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local TeamOctrees = require(ReplicatedStorage.Shared.Modules.TeamOctrees)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)

local function getGroundRay(a1) -- Line: 42 -- types: a1: vector
    local v1 = RaycastParams.new()
    v1.FilterType = Enum.RaycastFilterType.Include
    v1.FilterDescendantsInstances = {workspace:WaitForChild("Map")}
    local v2 = workspace:Raycast(a1, Vector3.new(0, -100, 0), v1)
    if v2 then
        return v2.Position
    end
    return nil
end

local function getPositions(a1) -- Line: 56
    local v1 = (CFrame.new(a1.position, a1.position - a1.direction * Vector3.new(1, 0, 1))) * CFrame.new(0, 15, 0)
    local v2 = a1.position + Vector3.new(0, 15, 0)
    local v3 = v1 * CFrame.new(0, 30, 120) * CFrame.new(130, 0, 30)
    v2 = (CFrame.new(v2, v3.Position)) * CFrame.Angles(-0.03490658503988659, -0.17453292519943295, 0.3490658503988659)
    local v4 = (CFrame.new((v1 * CFrame.new(0, 30, -120)).Position, v2.Position)) * CFrame.Angles(-0.08726646259971647, -0.3490658503988659, 0.7853981633974483)
    v3 = (CFrame.new(v3.Position, v2.Position)) * CFrame.Angles(-0.10471975511965978, 3.141592653589793, 0.5235987755982988)
    return {v4, v2, v3}
end

local function getBombs(a1) -- Line: 87 -- upvalues: getGroundRay (val), table (val)
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
    CreateContext = function(a1) -- Line: 124 -- upvalues: getPositions (val), getBombs (val)
        a1.airstrikeDuration = 3.63
        a1.airstrikePositions = getPositions(a1)
        a1.bombs = getBombs(a1)
        a1.bombDuration = 15
        a1.bombDropTime = 1
        a1.bombHeight = 10
    end,
    OnUse = function(a1) -- Line: 133
        -- upvalues: TypedPromise (val), table (val), RunService (val), GameState (val), TeamOctrees (val), Enum (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 134
            -- upvalues: a1 (val), table (upval), RunService (upval), GameState (upval), TeamOctrees (upval)
            -- upvalues: Enum (upval)
            local Context = a1.Context
            local u8 = table.deepClone(Context.bombs)
            local u9 = nil
            u9 = RunService.Stepped:Connect(function(a1, a2) -- Line: 139
                -- upvalues: GameState (upval), u8 (val), table (upval), TeamOctrees (upval), Enum (upval), u9 (ref)
                -- upvalues: a1_2 (val)
                local Fire, v1, v2
                local v3 = a2 * GameState.TimeScale
                local v4 = {}
                local v5 = false
                for i = #u8, 1, -1 do
                    v1 = u8[i]
                    v5 = true
                    v1.startsAt = v1.startsAt - v3
                    if not (0 < v1.startsAt) then
                        v1.tick = v1.tick + v3
                        v1.elapsed = v1.elapsed + v3
                        if not (15 < v1.elapsed) then
                            v2 = 0.25 < v1.tick
                            for j, k in (TeamOctrees.getTargets(Enum.Team.Player, v1.endPosition, v1.radius)) do
                                if k.Type ~= "Towers"
                                    and not v4[k]
                                    and not k.StatusEffects:has(Enum.StatusEffect.FireImmune)
                                    and k.Spawned ~= false then
                                    k:ApplyDebuff(Enum.DebuffType.Burn, 10, {
                                        BurnTickRate = 0.75,
                                        BurnDamage = 4,
                                        DefenseMelt = 15,
                                        EnemyBuff = 0,
                                    })
                                    if v2 then
                                        v4[k] = true
                                    end
                                end
                            end
                            if v2 then
                                v1.tick = 0
                            end
                        else
                            table.remove(u8, i)
                        end
                    end
                end
                if not v5 then
                    print("completed")
                    u9:Disconnect()
                    a1_2()
                    return
                end
                for n in v4 do
                    Fire = Enum.DamageType.Fire
                    n:Damage(8, Fire)
                end
            end)
            a3(function() -- Line: 214 -- upvalues: u9 (ref)
                if u9.Connected then
                    u9:Disconnect()
                end
            end)
        end)
    end,
}