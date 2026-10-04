-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Views.Gamepasses.story
-- Decompile time: 0.79 ms

local Value = (require(game.ReplicatedStorage.Shared.UI.Fusion)).Value
local Gamepasses = require(script.Parent.Gamepasses)
return function(a1) -- Line: 6 -- upvalues: Gamepasses (val), Value (val)
    local u6 = Gamepasses({Visible = Value(true)})
    u6.Parent = a1
    return function() -- Line: 12 -- upvalues: u6 (val)
        u6:destroy()
    end
end