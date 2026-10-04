-- Script path: ReplicatedStorage.Content.GlobalModifiers.HiddenEnemies
-- Decompile time: 0.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "Hidden Enemies",
    description = "All enemies are Hidden (after wave 5)",
    icon = 116053659618976,
    rewardMultiplier = 0.1,
    canToggle = true,
    onEnableServer = function(a1, a2, a3) -- Line: 15 -- upvalues: LegacyMiddleware (val), GameState (val), Enum (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 20 -- upvalues: GameState (upval), Enum (upval)
            if not a2 then
                return nil
            end
            if 5 < GameState.Wave then
                a2.StatusEffects:apply(Enum.StatusEffect.Hidden, "innate")
            end
            return a2
        end))
    end,
}