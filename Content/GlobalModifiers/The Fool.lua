-- Script path: ReplicatedStorage.Content.GlobalModifiers.The Fool
-- Decompile time: 0.47 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "The Fool",
    description = "You have 1 HP, Gain 10% more eco from wave bounuses",
    icon = 123482208929214,
    rewardMultiplier = 0,
    onEnableServer = function(a1, a2, a3) -- Line: 13 -- upvalues: LegacyMiddleware (val), GameState (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.OnWaveBonus, LegacyMiddleware.Boundedness.Outbound, function(a1) -- Line: 18
            return a1 * 1.1
        end))
        GameState.SetHealth(1)
    end,
}