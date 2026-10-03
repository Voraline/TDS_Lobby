-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Views.Subscriptions.story
-- Decompile time: 0.36 ms

local Value = (require(game.ReplicatedStorage.Shared.UI.Fusion)).Value
local Subscriptions = require(script.Parent.Subscriptions)
return function(a1) -- Line: 6 -- upvalues: Subscriptions (val), Value (val)
    local u6 = Subscriptions({Visible = Value(true)})
    u6.Parent = a1
    return function() -- Line: 12 -- upvalues: u6 (val)
        u6:destroy()
    end
end