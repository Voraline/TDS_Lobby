-- Script path: ReplicatedStorage.Client.Interfaces.Components.GlowButton
-- Decompile time: 8.78 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local Event = React.Event
local Spring = ReactFlow.Spring
local useBinding = React.useBinding
local useState = React.useState
local useAnimation = ReactFlow.useAnimation
local useGroupAnimation = ReactFlow.useGroupAnimation
local createElement = React.createElement
return (React.memo(function(a1) -- Line: 20
    -- upvalues: useBinding (val), useTransparencyModifier (val), useState (val), useGroupAnimation (val)
    -- upvalues: useAnimation (val), Spring (val), createElement (val), Event (val), ImageLabel (val)
    local v1 = a1.text or ""
    local v2 = a1.background or 77004607150620
    local v3 = useTransparencyModifier(a1.transparency or useBinding(0))
    local icon = a1.icon
    local clicked = a1.clicked
    local padding = a1.padding
    local textColor = a1.textColor
    local u20, u21 = useState(false)
    local v4, u44 = useGroupAnimation({
        pressing = useAnimation({scale = Spring({target = 0.95, speed = 30, damper = 0.6})}),
        hovering = useAnimation({scale = Spring({target = 1.05, speed = 30, damper = 0.6})}),
        idle = useAnimation({scale = Spring({target = 1, speed = 30, damper = 0.6})}),
    }, {scale = 1})
    local v5 = {BackgroundTransparency = 1}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v5.AnchorPoint = AnchorPoint
    local Position = a1.Position or UDim2.fromScale(0.905, 0.364)
    v5.Position = Position
    local Size = a1.Size or UDim2.fromScale(0.159, 0.0821)
    v5.Size = Size
    v5.ZIndex = a1.ZIndex or 2
    v5.LayoutOrder = a1.LayoutOrder or 1
    local v6 = {}
    local v7 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = v4.scale:map(function(a1) -- Line: 72
            return UDim2.fromScale(a1, a1)
        end),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = v3(0.999),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        ScaleType = Enum.ScaleType.Fit,
    }

    v7[Event.MouseButton1Down] = function() -- Line: 82 -- upvalues: u20 (val), u44 (val)
        if u20 then
            u44("pressing")
        end
    end

    v7[Event.MouseButton1Up] = function() -- Line: 88 -- upvalues: u20 (val), u44 (val), clicked (val)
        if not u20 then
            u44("idle")
        else
            u44("hovering")
        end
        if u20 and clicked then
            clicked()
        end
    end

    v7[Event.MouseEnter] = function() -- Line: 100 -- upvalues: u21 (val), u44 (val)
        u21(true)
        u44("hovering")
    end

    v7[Event.MouseLeave] = function() -- Line: 105 -- upvalues: u21 (val), u44 (val)
        u21(false)
        u44("idle")
    end

    local v8 = {scale = createElement("UIScale", {Scale = v4.scale})}
    v8.bG = createElement("ImageLabel", {
        BorderSizePixel = 0,
        ZIndex = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = v3(0.999),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Image = ("rbxassetid://%*"):format(v2),
        ImageTransparency = v3(0),
        ImageColor3 = a1.color,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.21, 1.68),
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(91, 91, 91, 91),
    })
    local v9 = {BackgroundTransparency = 1, ZIndex = 2, Size = UDim2.fromScale(1, 1)}
    local v10 = {
        listLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = padding or UDim.new(0.01, 0),
        }),
    }
    local v11 = {
        BorderSizePixel = 0,
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        LayoutOrder = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = v3(0.999),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.5, 0.506),
        Size = UDim2.fromScale(if not icon then 0.9 else 0, 0.474),
        AutomaticSize = Enum.AutomaticSize.X,
        Text = v1,
        TextTransparency = v3(0),
        TextColor3 = textColor or Color3.fromRGB(255, 255, 255),
    }
    local v12 = {}
    local stroke = a1.stroke and createElement("UIStroke", {Thickness = 3, Transparency = v3(0.6)})
    v12.stroke = stroke
    local textScale = a1.textScale and createElement("UIScale", {Scale = a1.textScale})
    v12.textScale = textScale
    v10.text = createElement("TextLabel", v11, v12)
    local v13 = icon and createElement(ImageLabel, {
        LayoutOrder = 1,
        BackgroundTransparency = 1,
        Image = if typeof(icon) == "number" then ("rbxassetid://%*"):format(icon) else if typeof(icon) ~= "string" then icon else if not tonumber(icon) then icon else ("rbxassetid://%*"):format(icon),
        ImageTransparency = v3(0),
        Size = UDim2.fromScale(0.8, 0.8),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(1, 0.5),
    }, {aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1})}) or nil
    v10.icon = v13
    v8.content = createElement("Frame", v9, v10)
    v6.button = createElement("ImageButton", v7, v8)
    return createElement("Frame", v5, v6, a1.children)
end))