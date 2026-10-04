-- Script path: ReplicatedStorage.Content.GlobalModifiers.Death
-- Decompile time: 0.53 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "Death",
    description = "Enemies gain bloated and nimble. ",
    icon = 92844958251572,
    rewardMultiplier = 0.2,
    onEnableServer = function(a1, a2, a3) -- Line: 13 -- upvalues: LegacyMiddleware (val), Enum (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 18 -- upvalues: Enum (upval)
            a2.StatusEffects:apply(Enum.StatusEffect.Bloated, "innate")
            a2.StatusEffects:apply(Enum.StatusEffect.Nimble, "innate")
            return a2
        end))
    end,
}