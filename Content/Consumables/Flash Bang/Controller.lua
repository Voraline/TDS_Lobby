-- Script path: ReplicatedStorage.Content.Consumables.Flash Bang.Controller
-- Decompile time: 2.02 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
local TeamOctrees = require(ReplicatedStorage.Shared.Modules.TeamOctrees)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
return {
    CreateContext = function(a1) -- Line: 18 -- upvalues: Players (val)
        local Position = Vector3.new(0, 0, 0)
        local PlayerByUserId = Players:GetPlayerByUserId(a1.playerId)
        if PlayerByUserId and PlayerByUserId.Character then
            Position = PlayerByUserId.Character.PrimaryPart.Position
        end
        a1.lifeTime = math.max(0.5, (Position - a1.position).Magnitude / 100)
        a1.noise = Random.new():NextNumber()
    end,
    OnUse = function(a1) -- Line: 33
        -- upvalues: TypedPromise (val), Players (val), ReplicatedStorage (val), Projectile (val), TeamOctrees (val)
        -- upvalues: Enum (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 34
            -- upvalues: a1 (val), Players (upval), ReplicatedStorage (upval), Projectile (upval), TeamOctrees (upval)
            -- upvalues: Enum (upval)
            local Context = a1.Context
            local PlayerByUserId = Players:GetPlayerByUserId(Context.playerId)
            if not PlayerByUserId then
                a2("Invalid player")
                return
            end
            local u13 = 0
            local u21 = ReplicatedStorage.Assets.Effects.Projectile.Flashbang:Clone()
            u21.Position = PlayerByUserId.Character.RightHand.Position
            local u45 = (Projectile:throwWithPhysics({
                asset = u21,
                duration = Context.lifeTime,
                start = u21.Position,
                target = Context.position,
                rotation = function(a1) -- Line: 53 -- upvalues: u13 (ref), Context (val) -- types: a1: vector
                    u13 = u13 + 0.1 * a1.Magnitude / 10
                    return CFrame.Angles(Context.noise + u13, Context.noise + u13, 0)
                end,
                include = {workspace:WaitForChild("Map")},
            })):andThen(function(a1) -- Line: 60 -- upvalues: TeamOctrees (upval), Enum (upval) -- types: a1: vector
                for k, v in pairs((TeamOctrees.getTargets(Enum.Team.Player, a1, 6.5))) do
                    if v.Type ~= "Towers" then
                        if not v.StatusEffects:has(Enum.StatusEffect.Boss) then
                            v:ApplyDebuff(Enum.DebuffType.Stun, 5, {StunTime = 5, DefenseMelt = 0})
                        else
                            v:ApplyDebuff(Enum.DebuffType.Slowness, 5, {SlowPercent = 50})
                        end
                    end
                end
            end)
            u45:finally(function() -- Line: 83 -- upvalues: u45 (ref), u21 (val), a1_2 (val)
                u45 = nil
                u21:Destroy()
                a1_2()
            end)
            a3(function() -- Line: 90 -- upvalues: u45 (ref)
                if u45 then
                    u45:cancel()
                end
            end)
        end)
    end,
}