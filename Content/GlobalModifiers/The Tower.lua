-- Script path: ReplicatedStorage.Content.GlobalModifiers.The Tower
-- Decompile time: 0.59 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "The Tower",
    description = "Debuffs applied to towers last 50% longer, debuffs applied from towers have a 10% longer duration.",
    icon = 118511436642503,
    rewardMultiplier = 0,
    onEnableServer = function(a1, a2, a3) -- Line: 11 -- upvalues: LegacyMiddleware (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.OnDebuffCreated, LegacyMiddleware.Boundedness.Inbound, function(a1) -- Line: 16
            a1.Duration = a1.Duration * 1.5
        end))
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.OnBuffCreated, LegacyMiddleware.Boundedness.Inbound, function(a1) -- Line: 25
            if a1.Duration then
                a1.Duration = a1.Duration * 1.1
            end
        end))
    end,
}