-- Script path: ReplicatedStorage.Content.GlobalModifiers.Weekend
-- Decompile time: 1.14 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "XP Boost",
    description = "Enjoy a boost to your earned EXP!",
    icon = 16671756946,
    sandboxDisabled = true,
    flavorText = function() -- Line: 12 -- upvalues: GameState (val)
        return (("x%*"):format(1 + GameState.State.WeekendMultiplier))
    end,
    onEnableServer = function(a1, a2, a3, a4) -- Line: 16 -- upvalues: GameState (val), LegacyMiddleware (val)
        local u4 = a4 or 1
        local WeekendMultiplier = GameState.WeekendMultiplier
        local v1 = u4
        GameState.Replicator:Set("WeekendMultiplier", v1)
        a2:Mark(function() -- Line: 23 -- upvalues: GameState (upval), WeekendMultiplier (val)
            GameState.Replicator:Set("WeekendMultiplier", WeekendMultiplier)
        end)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.OnRewardCalculated, LegacyMiddleware.Boundedness.Inbound, function(a1, a2) -- Line: 31 -- upvalues: u4 (ref) -- types: a2: table
            if a2.Name == "Experience" then
                a2.Multiplier = a2.Multiplier + u4
            end
            return a2
        end))
    end,
}