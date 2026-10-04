-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass.BattlepassButton
-- Decompile time: 8.72 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local Event = React.Event
local Spring = ReactFlow.Spring
local useBinding = React.useBinding
local useState = React.useState
local useAnimation = ReactFlow.useAnimation
local useGroupAnimation = ReactFlow.useGroupAnimation
local createElement = React.createElement
return (React.memo(function(a1) -- Line: 18
    -- upvalues: useBinding (val), useState (val), useGroupAnimation (val), useAnimation (val), Spring (val)
    -- upvalues: createElement (val), Event (val), ImageLabel (val)
    local v1 = a1.text or ""
    local v2 = a1.background or 109738632953931
    local transparency = a1.transparency or useBinding(0)
    local icon = a1.icon
    local clicked = a1.clicked
    local u14, u15 = useState(false)
    local v3, u38 = useGroupAnimation({
        pressing = useAnimation({scale = Spring({target = 0.95, speed = 30, damper = 0.6})}),
        hovering = useAnimation({scale = Spring({target = 1.05, speed = 30, damper = 0.6})}),
        idle = useAnimation({scale = Spring({target = 1, speed = 30, damper = 0.6})}),
    }, {scale = 1})
    local v4 = {BackgroundTransparency = 1}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v4.AnchorPoint = AnchorPoint
    local Position = a1.Position or UDim2.fromScale(0.905, 0.364)
    v4.Position = Position
    local Size = a1.Size or UDim2.fromScale(0.159, 0.0821)
    v4.Size = Size
    v4.ZIndex = a1.ZIndex or 2
    v4.LayoutOrder = a1.LayoutOrder or 1
    local v5 = {}
    local v6 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = v3.scale:map(function(a1) -- Line: 66
            return UDim2.fromScale(a1, a1)
        end),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.999,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        ScaleType = Enum.ScaleType.Fit,
    }

    v6[Event.MouseButton1Down] = function() -- Line: 76 -- upvalues: u14 (val), u38 (val)
        if u14 then
            u38("pressing")
        end
    end

    v6[Event.MouseButton1Up] = function() -- Line: 82 -- upvalues: u14 (val), u38 (val), clicked (val)
        if not u14 then
            u38("idle")
        else
            u38("hovering")
        end
        if u14 and clicked then
            clicked()
        end
    end

    v6[Event.MouseEnter] = function() -- Line: 94 -- upvalues: u15 (val), u38 (val)
        u15(true)
        u38("hovering")
    end

    v6[Event.MouseLeave] = function() -- Line: 99 -- upvalues: u15 (val), u38 (val)
        u15(false)
        u38("idle")
    end

    local v7 = {scale = createElement("UIScale", {Scale = v3.scale})}
    v7.bG = createElement("ImageLabel", {
        BackgroundTransparency = 0.999,
        BorderSizePixel = 0,
        ZIndex = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Image = ("rbxassetid://%*"):format(v2),
        ImageTransparency = transparency,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.21, 1.68),
    })
    local v8 = {BackgroundTransparency = 1, ZIndex = 2, Size = UDim2.fromScale(1, 1)}
    local v9 = {
        listLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.01, 0),
        }),
    }
    v9.text = createElement("TextLabel", {
        BackgroundTransparency = 0.999,
        BorderSizePixel = 0,
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        LayoutOrder = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.5, 0.506),
        Size = UDim2.fromScale(if not icon then 0.9 else 0, 0.474),
        AutomaticSize = Enum.AutomaticSize.X,
        Text = v1,
        TextTransparency = transparency,
        TextColor3 = Color3.fromRGB(255, 255, 255),
    })
    local v10 = icon and createElement(ImageLabel, {
        LayoutOrder = 1,
        BackgroundTransparency = 1,
        Image = ("rbxassetid://%*"):format(icon),
        ImageTransparency = transparency,
        Size = UDim2.fromScale(0.8, 0.8),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(1, 0.5),
    }, {aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1})}) or nil
    v9.icon = v10
    v7.content = createElement("Frame", v8, v9)
    v5.button = createElement("ImageButton", v6, v7)
    return createElement("Frame", v4, v5)
end))