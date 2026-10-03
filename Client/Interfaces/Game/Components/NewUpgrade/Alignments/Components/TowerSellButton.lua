-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.TowerSellButton
-- Decompile time: 3.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Shared = ReplicatedStorage.Shared
local Packages = ReplicatedStorage.Packages
local BaseComponents = script.Parent.Parent.BaseComponents
local Components = Interfaces.Game.Components
local Hooks = Interfaces.Hooks
local Binding = require(Components.Binding)
local React = require(Shared.UI.React)
local ReactFlow = require(Packages.ReactFlow)
local Comma = require(Shared.UI.Comma)
local useReactBindings = require(Hooks.useReactBindings)
local Button = require(BaseComponents.Button)
local Container = require(BaseComponents.Container)
local createElement = React.createElement
local useEffect = React.useEffect
local useSpring = ReactFlow.useSpring
return React.memo(function(a1) -- Line: 35
    -- upvalues: useSpring (val), useEffect (val), useReactBindings (val), createElement (val), Container (val)
    -- upvalues: Button (val), Comma (val), React (val), Binding (val)
    local v1, u4 = useSpring({start = 0, speed = 20, damper = 0.7})
    local v2 = useEffect
    local v3 = {a1.IsLocked}
    v2(function() -- Line: 38 -- upvalues: u4 (val)
        u4({force = 5})
    end, v3)
    v2 = useReactBindings
    v3 = {a1.SellValue}
    v2(function() -- Line: 42 -- upvalues: u4 (val)
        u4({force = 5})
    end, v3)
    v3 = {CornerRadius = 4, Size = a1.Size, Position = a1.Position}
    local v4 = {
        uiListLayout = createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10),
            HorizontalFlex = Enum.UIFlexAlignment.Fill,
        }),
    }
    local v5 = {
        Size = UDim2.fromOffset(218, 40),
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        ZIndex = 2,
        Image = "rbxassetid://8429088937",
    }
    local v6 = not a1.IsLocked and Color3.fromRGB(255, 60, 60) or Color3.fromRGB(79, 79, 79)
    v5.ImageColor3 = v6
    v5.ImageScaleType = Enum.ScaleType.Slice
    v5.ImageSliceCenter = Rect.new(8, 8, 152, 32)
    v5.TextSize = UDim2.fromScale(0.8, 0.55)
    v5.TextPosition = v1:map(function(a1) -- Line: 78
        return UDim2.fromScale(0.5, 0.5 - a1)
    end)
    v5.Text = a1.SellValue:map(function(a1) -- Line: 82 -- upvalues: Comma (upval) -- types: a1: number
        return (("Sell:  $%*"):format((Comma((math.floor(a1))))))
    end)
    v5.TextFontWeight = "Bold"
    v5.TextStrokeThickness = 2
    v5.Transparency = a1.Transparency
    v5.Visible = a1.Transparency:map(function(a1) -- Line: 90
        return a1 < 0.99
    end)
    v5.AutoButtonAnimate = true
    v5.HoverSound = "New Hover"
    v5.HoverSizeScale = 1.1
    v5.DepressSizeScale = 0.9
    v5.SpotlightRefName = "sell"

    v5[React.Event.Activated] = function() -- Line: 102 -- upvalues: a1 (val)
        if not a1.IsLocked and a1.OnSell then
            a1.OnSell()
        end
    end

    v4.sellButton = createElement(Button, v5, {uiFlex = createElement("UIFlexItem", {FlexMode = Enum.UIFlexMode.Grow})})
    v4.sellKeybindFrame = createElement(Binding, {
        DefaultText = "X",
        Binding = "Sell Tower",
        DisableOnGameState = true,
        Size = UDim2.fromOffset(30, 24),
        Visible = not a1.IsLocked,
        Transparency = a1.Transparency,
        Callback = function() -- Line: 123 -- upvalues: a1 (val)
            if a1.CanSell and a1.OnSell then
                a1.OnSell()
            end
        end,
    }, {uiFlex = createElement("UIFlexItem", {FlexMode = Enum.UIFlexMode.None})})
    return createElement(Container, v3, v4)
end, function(a1, a2) -- Line: 134
    local v1 = false
    if a1.Locked == a2.Locked then
        v1 = false
        if a1.OnSell == a2.OnSell then
            v1 = a1.CanSell == a2.CanSell
        end
    end
    return v1
end)