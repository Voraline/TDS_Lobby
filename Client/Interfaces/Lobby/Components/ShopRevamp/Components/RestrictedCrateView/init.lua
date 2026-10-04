-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Components.RestrictedCrateView
-- Decompile time: 0.87 ms

local Packages = (game:GetService("ReplicatedStorage")).Packages
local React = require(Packages.React)
local ItemBar = require(script.ItemBar)
local memo = React.memo
local createElement = React.createElement
return memo(function(a1) -- Line: 26 -- upvalues: createElement (val), ItemBar (val) -- types: a1: table
    local crate = a1.crate
    return createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {
        ItemBar = createElement(ItemBar, {items = if not crate then {} else crate.items}),
    })
end)