-- Script path: ReplicatedStorage.Content.GlobalModifiers.HealthyEnemies
-- Decompile time: 0.46 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "Healthy Enemies",
    description = "All enemies are Bloated",
    icon = 81512230903222,
    rewardMultiplier = 0.3,
    canToggle = true,
    onEnableServer = function(a1, a2, a3) -- Line: 14 -- upvalues: LegacyMiddleware (val), Enum (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 19 -- upvalues: Enum (upval)
            if not a2 then
                return nil
            end
            a2.StatusEffects:apply(Enum.StatusEffect.Bloated, "innate")
            return a2
        end))
    end,
}