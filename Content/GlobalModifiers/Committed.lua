-- Script path: ReplicatedStorage.Content.GlobalModifiers.Committed
-- Decompile time: 0.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
return {
    displayName = "Committed",
    description = "Every placement is final, you cannot sell towers",
    icon = 117561617617200,
    rewardMultiplier = 0.1,
    canToggle = true,
    onEnableServer = function(a1, a2, a3) -- Line: 13 -- upvalues: GameState (val)
        GameState.Unsellable = true
        GameState.Replicator:Set("Unsellable", true)
        a2:Mark(function() -- Line: 17 -- upvalues: GameState (upval)
            GameState.Unsellable = false
            GameState.Replicator:Set("Unsellable", false)
        end)
    end,
}