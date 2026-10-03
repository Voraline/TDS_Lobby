-- Script path: ReplicatedStorage.Content.GlobalModifiers.Small
-- Decompile time: 0.74 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "Small",
    description = "All mobs are small, faster, and have half health.",
    icon = 4830003493,
    onEnableServer = function(a1, a2, a3) -- Line: 11 -- upvalues: LegacyMiddleware (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 16
            a2.BaseSpeed = a2.BaseSpeed * 2
            a2.MaxHealth = a2.MaxHealth / 2
            a2.Health = a2.MaxHealth
            a2.Replicator:Set("MaxHealth", a2.MaxHealth)
            a2.Replicator:Set("Health", a2.Health)
            a2:UpdateWalkSpeed()
            return a2
        end))
    end,
    onEnableClient = function(a1, a2, a3) -- Line: 31 -- upvalues: LegacyMiddleware (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 36
            a2:ScaleBy(0.5, 100)
            return a2
        end))
    end,
}