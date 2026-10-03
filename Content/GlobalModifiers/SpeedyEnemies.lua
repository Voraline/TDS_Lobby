-- Script path: ReplicatedStorage.Content.GlobalModifiers.SpeedyEnemies
-- Decompile time: 0.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "Speedy Enemies",
    description = "All enemies are Nimble",
    icon = 120242518964452,
    rewardMultiplier = 0.25,
    canToggle = true,
    onEnableServer = function(a1, a2, a3) -- Line: 14 -- upvalues: LegacyMiddleware (val), Enum (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 19 -- upvalues: Enum (upval)
            if not a2 then
                return nil
            end
            a2.StatusEffects:apply(Enum.StatusEffect.Nimble, "innate")
            return a2
        end))
    end,
}