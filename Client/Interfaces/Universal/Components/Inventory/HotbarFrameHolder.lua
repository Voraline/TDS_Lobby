-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.HotbarFrameHolder
-- Decompile time: 1.14 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 18 -- upvalues: useScale (val), createElement (val), React (val) -- types: a1: table
    local v1 = useScale(1.2, nil, true)
    local v2 = {BackgroundTransparency = 1, LayoutOrder = 123}
    local anchorPoint = a1.anchorPoint or Vector2.new(0.5, 1)
    v2.AnchorPoint = anchorPoint
    local position = a1.position or UDim2.fromScale(0.5, 1.5)
    v2.Position = position
    local size = a1.size or UDim2.fromScale(1, 0.5)
    v2.Size = size
    return createElement("Frame", v2, {
        children = React.createElement(React.Fragment, nil, a1.children),
        uILayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10 * v1),
        }),
    })
end)