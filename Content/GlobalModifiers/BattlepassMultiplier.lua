-- Script path: ReplicatedStorage.Content.GlobalModifiers.BattlepassMultiplier
-- Decompile time: 0.75 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "Battlepass Boost",
    description = "Enjoy a boost to your battle pass EXP!",
    icon = 16671756946,
    sandboxDisabled = true,
    flavorText = function() -- Line: 12 -- upvalues: GameState (val)
        return (("x%*"):format(1 + GameState.State.BattlepassMultiplier))
    end,
    onEnableServer = function(a1, a2, a3, a4) -- Line: 16 -- upvalues: GameState (val), LegacyMiddleware (val)
        local u4 = a4 or 0.5
        local BattlepassMultiplier = GameState.BattlepassMultiplier
        local v1 = u4
        GameState.Replicator:Set("BattlepassMultiplier", v1)
        a2:Mark(function() -- Line: 22 -- upvalues: GameState (upval), BattlepassMultiplier (val)
            GameState.Replicator:Set("BattlepassMultiplier", BattlepassMultiplier)
        end)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.OnBattlepassRewardMultiplier, LegacyMiddleware.Boundedness.Inbound, function(a1, a2) -- Line: 30 -- upvalues: u4 (ref) -- types: a2: number
            return a2 + u4
        end))
    end,
}