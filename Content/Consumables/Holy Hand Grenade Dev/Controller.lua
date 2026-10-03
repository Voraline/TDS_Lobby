-- Script path: ReplicatedStorage.Content.Consumables.Holy Hand Grenade Dev.Controller
-- Decompile time: 3.56 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Damage = require(ServerStorage.Server.Modules.Damage)
local EnemyService = require(ServerStorage.Server.Services.Game.EnemyService)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local PlayerService = require(ServerStorage.Server.Services.Shared.PlayerService)
local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
local TeamOctrees = require(ReplicatedStorage.Shared.Modules.TeamOctrees)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
return {
    CreateContext = function(a1) -- Line: 20 -- upvalues: Players (val)
        local Position = Vector3.new(0, 0, 0)
        local PlayerByUserId = Players:GetPlayerByUserId(a1.playerId)
        if PlayerByUserId and PlayerByUserId.Character then
            Position = PlayerByUserId.Character.PrimaryPart.Position
        end
        a1.lifeTime = math.max(0.5, (Position - a1.position).Magnitude / 100)
        a1.noise = Random.new():NextNumber()
    end,
    OnUse = function(a1) -- Line: 35
        -- upvalues: TypedPromise (val), Players (val), ReplicatedStorage (val), Projectile (val), PlayerService (val)
        -- upvalues: TeamOctrees (val), Enum (val), TimescaleUtilities (val), Damage (val), RunService (val)
        -- upvalues: GameState (val), EnemyService (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 36
            -- upvalues: a1 (val), Players (upval), ReplicatedStorage (upval), Projectile (upval), PlayerService (upval)
            -- upvalues: TeamOctrees (upval), Enum (upval), TimescaleUtilities (upval), Damage (upval)
            -- upvalues: RunService (upval), GameState (upval), EnemyService (upval)
            local Context = a1.Context
            local u5 = 8
            local u6 = 0
            local u7 = {}
            local u8 = nil
            local PlayerByUserId = Players:GetPlayerByUserId(Context.playerId)
            if not PlayerByUserId then
                a2("Invalid player")
                return
            end
            local u17 = 0
            local Handle = ReplicatedStorage.Assets.Effects.Client.HolyHandGrenade:Clone().Handle
            Handle.Anchored = true
            local CFrame = PlayerByUserId.Character.RightHand.CFrame
            Handle:PivotTo(CFrame)
            local u54 = (Projectile:throwWithPhysics({
                asset = Handle,
                duration = Context.lifeTime,
                start = Handle.Position,
                target = Context.position,
                rotation = function(a1) -- Line: 62 -- upvalues: u17 (ref), Context (val) -- types: a1: vector
                    u17 = u17 + 0.1 * a1.Magnitude / 10
                    return CFrame.Angles(Context.noise + u17, Context.noise + u17, 0)
                end,
                include = {workspace:WaitForChild("Map")},
            })):andThen(function(a1_3) -- Line: 69
                -- upvalues: PlayerService (upval), a1 (upval), TeamOctrees (upval), Enum (upval)
                -- upvalues: TimescaleUtilities (upval), Damage (upval), u8 (ref), RunService (upval), GameState (upval)
                -- upvalues: u5 (ref), u6 (ref), a1_2 (val), EnemyService (upval), u7 (val)
                local v1 = PlayerService.GetEntityFromPlayer(a1.Executor)
                local v2 = TeamOctrees.getTargets(Enum.Team.Player, a1_3, 1000)
                TimescaleUtilities.Wait(8.5)
                for k, v in pairs(v2) do
                    if v1 and v.Type ~= "Towers" then
                        Damage.dealDamage({Owner = v1}, v, 1000000, Enum.DamageType.Energy)
                    end
                end
                u8 = RunService.Stepped:Connect(function(a1_3, a2) -- Line: 93
                    -- upvalues: GameState (upval), u5 (upval), u6 (upval), u8 (upval), a1_2 (upval)
                    -- upvalues: EnemyService (upval), u7 (upval), Enum (upval), PlayerService (upval), a1 (upval)
                    -- upvalues: Damage (upval)
                    local v1 = a2 * GameState.TimeScale
                    u5 = u5 - v1
                    u6 = u6 + v1
                    if u5 <= 0 then
                        u8:Disconnect()
                        a1_2()
                    end
                    for i, j in EnemyService.GetEnemies() do
                        if not u7[j] then
                            u7[j] = j
                        end
                    end
                    if u6 > 0.5 then
                        local v2, v3
                        for k in u7 do
                            if not k.StatusEffects:has(Enum.StatusEffect.Boss) then
                                v2 = k.MaxHealth * 0.05
                                v3 = PlayerService.GetEntityFromPlayer(a1.Executor)
                                if v3 then
                                    Damage.dealDamage({Owner = v3}, k, v2, Enum.DamageType.Energy)
                                end
                            end
                        end
                        u6 = 0
                    end
                end)
            end)
            u54:finally(function() -- Line: 137 -- upvalues: u54 (ref), Handle (ref), a1_2 (val)
                u54 = nil
                Handle:Destroy()
                a1_2()
            end)
            a3(function() -- Line: 143 -- upvalues: u54 (ref)
                if u54 then
                    u54:cancel()
                end
            end)
        end)
    end,
}