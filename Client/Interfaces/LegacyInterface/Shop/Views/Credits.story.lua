-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Views.Credits.story
-- Decompile time: 0.93 ms

local Shared = game.ReplicatedStorage.Shared
local Fusion = require(Shared.UI.Fusion)
local ScreenQuery = require(Shared.UI.Components.ScreenQuery)
local Value = Fusion.Value
local Credits = require(script.Parent.Credits)
return function(a1) -- Line: 9 -- upvalues: Credits (val), Value (val), ScreenQuery (val)
    local u12 = Credits({Visible = Value(true), IsMobile = ScreenQuery.IsMobile:get(false)})
    u12.Parent = a1
    return function() -- Line: 16 -- upvalues: u12 (val)
        u12:destroy()
    end
end