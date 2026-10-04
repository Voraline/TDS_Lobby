-- Script path: ReplicatedStorage.Client.Interfaces.Components.GlowIconButton
-- Decompile time: 5.82 ms

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
    local v1 = a1.background or 77004607150620
    local transparency = a1.transparency or useBinding(0)
    local icon = a1.icon
    local clicked = a1.clicked
    local v2 = useTransparencyModifier(transparency)
    local u16, u17 = useState(false)
    local v3, u40 = useGroupAnimation({
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
    v4.Visible = a1.Visible
    local v5 = {}
    local v6 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = v3.scale:map(function(a1) -- Line: 69
            return UDim2.fromScale(a1, a1)
        end),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = v2(0.999),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        ScaleType = Enum.ScaleType.Fit,
    }

    v6[Event.MouseButton1Down] = function() -- Line: 79 -- upvalues: u16 (val), u40 (val)
        if u16 then
            u40("pressing")
        end
    end

    v6[Event.MouseButton1Up] = function() -- Line: 85 -- upvalues: u16 (val), u40 (val), clicked (val)
        if not u16 then
            u40("idle")
        else
            u40("hovering")
        end
        if u16 and clicked then
            clicked()
        end
    end

    v6[Event.MouseEnter] = function() -- Line: 97 -- upvalues: u17 (val), u40 (val)
        u17(true)
        u40("hovering")
    end

    v6[Event.MouseLeave] = function() -- Line: 102 -- upvalues: u17 (val), u40 (val)
        u17(false)
        u40("idle")
    end

    local v7 = {scale = createElement("UIScale", {Scale = v3.scale})}
    v7.bG = createElement("ImageLabel", {
        BorderSizePixel = 0,
        ZIndex = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = v2(0.999),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Image = ("rbxassetid://%*"):format(v1),
        ImageTransparency = v2(0),
        ImageColor3 = a1.color,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.21, 1.21),
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(91, 91, 91, 91),
    })
    local v8 = {
        LayoutOrder = 1,
        BackgroundTransparency = 1,
        Image = if typeof(icon) == "number" then ("rbxassetid://%*"):format(icon) else if typeof(icon) ~= "string" then icon else if not tonumber(icon) then icon else ("rbxassetid://%*"):format(icon),
        ImageTransparency = v2(0),
    }
    local iconSize = a1.iconSize or UDim2.fromScale(0.5, 0.5)
    v8.Size = iconSize
    v8.Position = UDim2.fromScale(0.5, 0.5)
    v8.AnchorPoint = Vector2.new(0.5, 0.5)
    v7.icon = createElement(ImageLabel, v8)
    v5.button = createElement("ImageButton", v6, v7, a1.children)
    return createElement("Frame", v4, v5)
end))