-- Script path: ReplicatedStorage.Content.GlobalModifiers.Glass
-- Decompile time: 0.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "Glass",
    description = "You have 1 HP.",
    icon = 131044068065382,
    rewardMultiplier = 0.05,
    canToggle = true,
    onEnableServer = function(a1, a2, a3) -- Line: 13 -- upvalues: LegacyMiddleware (val), ReplicatedStorage (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.OnMapHealthCalculated, LegacyMiddleware.Boundedness.Outbound, function(a1, ...) -- Line: 18 -- upvalues: ReplicatedStorage (upval)
            ReplicatedStorage.State.Health.Max.Value = 1
            ReplicatedStorage.State.Health.Current.Value = 1
            return ...
        end))
    end,
}