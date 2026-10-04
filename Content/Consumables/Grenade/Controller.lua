-- Script path: ReplicatedStorage.Content.Consumables.Grenade.Controller
-- Decompile time: 1.83 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Damage = require(ServerStorage.Server.Modules.Damage)
local PlayerService = require(ServerStorage.Server.Services.Shared.PlayerService)
local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
local TeamOctrees = require(ReplicatedStorage.Shared.Modules.TeamOctrees)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
return {
    CreateContext = function(a1) -- Line: 15 -- upvalues: Players (val)
        local Position = Vector3.new(0, 0, 0)
        local PlayerByUserId = Players:GetPlayerByUserId(a1.playerId)
        if PlayerByUserId and PlayerByUserId.Character then
            Position = PlayerByUserId.Character.PrimaryPart.Position
        end
        a1.lifeTime = math.max(0.5, (Position - a1.position).Magnitude / 100)
        a1.noise = Random.new():NextNumber()
    end,
    OnUse = function(a1) -- Line: 30
        -- upvalues: TypedPromise (val), Players (val), ReplicatedStorage (val), Projectile (val), PlayerService (val)
        -- upvalues: TeamOctrees (val), Enum (val), Damage (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 31
            -- upvalues: a1 (val), Players (upval), ReplicatedStorage (upval), Projectile (upval), PlayerService (upval)
            -- upvalues: TeamOctrees (upval), Enum (upval), Damage (upval)
            local Context = a1.Context
            local PlayerByUserId = Players:GetPlayerByUserId(Context.playerId)
            if not PlayerByUserId then
                a2("Invalid player")
                return
            end
            local u13 = 0
            local Handle = ReplicatedStorage.Assets.Effects.Client.Grenade:Clone().Handle
            Handle.Anchored = true
            local CFrame = PlayerByUserId.Character.RightHand.CFrame
            Handle:PivotTo(CFrame)
            local u50 = (Projectile:throwWithPhysics({
                asset = Handle,
                duration = Context.lifeTime,
                start = Handle.Position,
                target = Context.position,
                rotation = function(a1) -- Line: 52 -- upvalues: u13 (ref), Context (val) -- types: a1: vector
                    u13 = u13 + 0.1 * a1.Magnitude / 10
                    return CFrame.Angles(Context.noise + u13, Context.noise + u13, 0)
                end,
                include = {workspace:WaitForChild("Map")},
            })):andThen(function(a1_2) -- Line: 59
                -- upvalues: PlayerService (upval), a1 (upval), TeamOctrees (upval), Enum (upval), Damage (upval)
                local v1 = PlayerService.GetEntityFromPlayer(a1.Executor)
                for k, v in pairs((TeamOctrees.getTargets(Enum.Team.Player, a1_2, 6))) do
                    if v1 and v.Type ~= "Towers" then
                        Damage.dealDamage({Owner = v1}, v, 125, Enum.DamageType.Energy)
                    end
                end
            end)
            u50:finally(function() -- Line: 82 -- upvalues: u50 (ref), Handle (ref), a1_2 (val)
                u50 = nil
                Handle:Destroy()
                a1_2()
            end)
            a3(function() -- Line: 89 -- upvalues: u50 (ref)
                if u50 then
                    u50:cancel()
                end
            end)
        end)
    end,
}