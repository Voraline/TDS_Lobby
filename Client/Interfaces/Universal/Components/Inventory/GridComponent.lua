-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.GridComponent
-- Decompile time: 1.48 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Maid)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Client.Interfaces.Hooks.useFontScale)
local useMediaQuery = require(ReplicatedStorage.Client.Interfaces.Hooks.useMediaQuery)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local createElement = React.createElement
local memo = React.memo
local useEffect = React.useEffect
return (memo(function(a1) -- Line: 25
    -- upvalues: useScale (val), useMediaQuery (val), createElement (val), React (val)
    local v1 = useScale(0.9, nil, true, nil, false, true)
    local v2 = not useMediaQuery("medium")
    local v3 = {
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.Y,
        Size = UDim2.fromScale(1, 0),
        LayoutOrder = a1.layoutOrder,
    }
    local v4 = {}
    local v5 = {}
    local v6 = if not a1.bottomPadding then a1.forceBottomPadding and UDim.new(0, (a1.bottomPaddingAdd or 350) * v1) or UDim.new(0, 10 * v1) else if v2 then UDim.new(0, (a1.bottomPaddingAdd or 350) * v1) or UDim.new(0, 10 * v1) else a1.forceBottomPadding and UDim.new(0, (a1.bottomPaddingAdd or 350) * v1) or UDim.new(0, 10 * v1)
    v5.PaddingBottom = v6
    v5.PaddingTop = UDim.new(0, 10 * v1)
    v4.UIPadding = createElement("UIPadding", v5)
    v5 = {}
    v6 = a1.CellPadding and a1.CellPadding(v1 * (a1.scaleMult or 1)) or UDim2.fromOffset(5 * v1, 20 * v1)
    v5.CellPadding = v6
    v6 = a1.CellSize and a1.CellSize(v1 * (a1.scaleMult or 1)) or UDim2.fromOffset(175 * (a1.scaleMult or 1) * v1, 200 * (a1.scaleMult or 1) * v1)
    v5.CellSize = v6
    local HorizontalAlignment = a1.HorizontalAlignment or Enum.HorizontalAlignment.Left
    v5.HorizontalAlignment = HorizontalAlignment
    v5.VerticalAlignment = Enum.VerticalAlignment.Top
    v5.SortOrder = Enum.SortOrder.LayoutOrder
    v4.UIGridLayout = createElement("UIGridLayout", v5)
    v4.items = createElement(React.Fragment, nil, a1.children)
    return createElement("Frame", v3, v4)
end))