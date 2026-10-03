-- Script path: ReplicatedStorage.Content.GlobalModifiers.Boss
-- Decompile time: 0.70 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "Boss",
    description = "All mobs spawn with a boss stat and are buffed.",
    rewardMultiplier = 0.4,
    icon = 10044911963,
    onEnableServer = function(a1, a2, a3) -- Line: 12 -- upvalues: LegacyMiddleware (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 17
            a2.MaxHealth = a2.MaxHealth * 2
            a2.Health = a2.MaxHealth
            a2.Replicator:Set("MaxHealth", a2.MaxHealth)
            a2.Replicator:Set("Health", a2.Health)
            return a2
        end))
    end,
    onEnableClient = function(a1, a2, a3) -- Line: 30 -- upvalues: LegacyMiddleware (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 35
            a2:ScaleBy(1.5, 100)
            return a2
        end))
    end,
}