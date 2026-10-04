-- Script path: ReplicatedStorage.Content.GlobalModifiers.DoubleHealth
-- Decompile time: 1.04 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "Double Health",
    description = "All enemies have double health.",
    icon = 1565113310,
    onEnableServer = function(a1, a2, a3) -- Line: 12 -- upvalues: LegacyMiddleware (val), Enum (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 17 -- upvalues: Enum (upval)
            a2.MaxHealth = a2.MaxHealth * 2
            a2.Health = a2.MaxHealth
            if a2.StatusEffects:has(Enum.StatusEffect.Bloated) then
                a2.MaxHealth = a2.MaxHealth * 2
                a2.Health = a2.MaxHealth
            end
            a2.Replicator:Set("MaxHealth", a2.MaxHealth)
            a2.Replicator:Set("Health", a2.Health)
            return a2
        end))
    end,
    onEnableClient = function(a1, a2, a3) -- Line: 34 -- upvalues: LegacyMiddleware (val), ReplicatedStorage (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 39 -- upvalues: ReplicatedStorage (upval)
            if not a2 then
                return nil
            end
            local v1 = ReplicatedStorage.Assets.Effects.Misc.Health.HealthParticle:Clone()
            v1.Parent = a2.PrimaryPart
            return a2
        end))
    end,
}