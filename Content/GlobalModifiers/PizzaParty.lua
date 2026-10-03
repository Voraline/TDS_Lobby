-- Script path: ReplicatedStorage.Content.GlobalModifiers.PizzaParty
-- Decompile time: 1.07 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
local SharedModifierData = require(ReplicatedStorage.Shared.Modules.SharedModifierData)
local u26 = Random.new()
return {
    displayName = "Pizza Party",
    description = "Mobs are replaced with pizzeria variants.",
    icon = 11416882364,
    rewardMultiplier = 0.1,
    onEnableServer = function(a1, a2, a3) -- Line: 16
        -- upvalues: LegacyMiddleware (val), u26 (val), SharedModifierData (val), GameState (val)
        -- upvalues: ReplicatedStorage (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.ManagerCreatedEnemy, LegacyMiddleware.Boundedness.Inbound, function(a1, a2, a3, a4, a5, a6, a7, a8, a9) -- Line: 21
            -- upvalues: u26 (upval), SharedModifierData (upval), GameState (upval), ReplicatedStorage (upval)
            if (u26:NextNumber()) <= SharedModifierData.getPathChance(0.6)
                and a4 == GameState.EnemyDirectorPlayer then
                if not a9 or not a9.replacedEnemy then
                    if not a9 then
                        a9 = {}
                    end
                    if not a9.LayeredHats then
                        a9.LayeredHats = {}
                    end
                    local Children = ReplicatedStorage.Assets.Hats.Layered.Pizzeria:GetChildren()
                    table.insert(a9.LayeredHats, Children[(u26:NextInteger(1, #Children))])
                end
            end
            return a2, a3, a4, a5, a6, a7, a8, a9
        end))
    end,
}