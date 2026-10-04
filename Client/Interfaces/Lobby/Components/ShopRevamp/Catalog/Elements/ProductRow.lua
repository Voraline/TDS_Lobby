-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Catalog.Elements.ProductRow
-- Decompile time: 1.07 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local Constants = require(script.Parent.Parent.Constants)
local Container = require(script.Parent.Container)
return function(a1) -- Line: 10 -- upvalues: Container (val), Constants (val), React (val) -- types: a1: table
    return Container(Constants.CONTENT_WIDTH_SCALE, {
        UIListLayout = React.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, Constants.PRODUCT_ROW_GAP),
        }),
        Products = React.createElement(React.Fragment, nil, a1),
    })
end