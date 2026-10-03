-- Script path: ReplicatedStorage.Content.GlobalModifiers.LimitHealth
-- Decompile time: 0.52 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "HP Locked",
    description = "Base health is capped.",
    icon = 10045657037,
    sandboxDisabled = true,
    rewardMultiplier = function() -- Line: 11 -- upvalues: GameState (val)
        if GameState.GameMode ~= "Halloween2024" and GameState.GameMode ~= "PlsDonate" then
            return 0.2
        end
        return 0
    end,
    onEnableServer = function(a1, a2, a3, a4) -- Line: 20 -- upvalues: LegacyMiddleware (val), ReplicatedStorage (val)
        local u4 = a4 or 100
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.OnMapHealthCalculated, LegacyMiddleware.Boundedness.Outbound, function(a1, ...) -- Line: 26 -- upvalues: ReplicatedStorage (upval), u4 (ref)
            ReplicatedStorage.State.Health.Max.Value = u4
            ReplicatedStorage.State.Health.Current.Value = u4
            return ...
        end))
    end,
}