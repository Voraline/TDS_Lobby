-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Hotbar.CurrencyBar
-- Decompile time: 1.02 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CurrencyItem = require(script.Parent.CurrencyItem)
local React = require(ReplicatedStorage.Shared.UI.React)
local Fragment = React.Fragment
local createElement = React.createElement
return function(a1) -- Line: 28 -- upvalues: createElement (val), CurrencyItem (val), Fragment (val) -- types: a1: table
    local v1 = {
        layout = createElement("UIListLayout", {
            Padding = UDim.new(0, 20),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }
    local v2 = a1.isMobile and createElement("UIScale", {Scale = 0.7}) or nil
    v1.scale = v2
    for i, j in a1.items do
        v1[j.key] = (createElement(CurrencyItem, j))
    end
    return createElement(Fragment, nil, v1)
end