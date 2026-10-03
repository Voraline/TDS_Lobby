-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.MainObjective.MiniObjective
-- Decompile time: 5.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Components = ReplicatedStorage.Client.Interfaces.Components
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useMediaQuery = require(Hooks.useMediaQuery)
local useTransparencyModifier = require(Hooks.useTransparencyModifier)
local ImageLabel = require(Components.ImageLabel)
local Tween = ReactFlow.Tween
local useSpring = ReactFlow.useSpring
local useAnimation = ReactFlow.useAnimation
local useGroupAnimation = ReactFlow.useGroupAnimation
local createElement = React.createElement
local joinBindings = React.joinBindings
local useEffect = React.useEffect
local useState = React.useState
local useRef = React.useRef
return React.memo(function(a1) -- Line: 40
    -- upvalues: useRef (val), useMediaQuery (val), useState (val), useSpring (val), useGroupAnimation (val)
    -- upvalues: useAnimation (val), Tween (val), useTransparencyModifier (val), useEffect (val), createElement (val)
    -- upvalues: joinBindings (val), ImageLabel (val)
    local u3 = a1.Visible ~= false
    local icon = a1.icon
    local text = a1.text
    local u8 = useRef()
    local v1 = useMediaQuery("large", true)
    local v2, u16 = useState(text)
    local v3, u20 = useSpring({damper = 0.5, speed = 15, start = 0, target = 0})
    local v4 = TweenInfo.new(0.15, Enum.EasingStyle.Sine)
    local v5, u59 = useGroupAnimation({
        enabled = useAnimation({
            transparency = Tween({target = 0, info = v4}),
            position = Tween({target = UDim2.fromScale(0.5, 0.5), info = v4}),
        }),
        disabled = useAnimation({
            transparency = Tween({target = 1, info = v4}),
            position = Tween({target = UDim2.fromScale(0.5, 1), info = v4}),
        }),
    }, {transparency = 1, position = UDim2.fromScale(0.5, 1)})
    local v6 = useTransparencyModifier(v5.transparency)
    local v7 = {text}
    useEffect(function() -- Line: 74 -- upvalues: text (val), u16 (val)
        if text then
            u16(text)
        end
    end, v7)
    v7 = {v2}
    useEffect(function() -- Line: 80 -- upvalues: u8 (val), text (val), u20 (val)
        local current = u8.current
        u8.current = text
        if current == nil then
            return
        end
        u20({force = 10})
    end, v7)
    v7 = {u3}
    useEffect(function() -- Line: 93 -- upvalues: u59 (val), u3 (val)
        u59(if not u3 then "disabled" else "enabled")
    end, v7)
    v7 = {BackgroundTransparency = 1}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0)
    v7.AnchorPoint = AnchorPoint
    local Position = a1.Position or v1:map(function(a1) -- Line: 99
        return UDim2.fromScale(0.5, if not a1 then 0 else 0.05)
    end)
    v7.Position = Position
    local Size = a1.Size or v1:map(function(a1) -- Line: 102
        return a1 and UDim2.fromScale(0.219, 0.0311) or UDim2.fromScale(0.438, 0.0622)
    end)
    v7.Size = Size
    local v8 = {uIAspectRatioConstraint1 = createElement("UIAspectRatioConstraint", {AspectRatio = 12})}
    local v9 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        Position = v5.position,
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        BackgroundTransparency = v6(0.5),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    local v10 = {
        uIGradient = createElement("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.2, 0.25),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.8, 0.25),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
    }
    local v11 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    v11.Position = joinBindings({v3, v5.position}):map(function(a1) -- Line: 137
        local v1 = a1[1]
        local v2 = a1[2]
        return (UDim2.fromScale(0.5, 0.5 - v1)) + UDim2.fromScale(0, v2.Y.Scale * 2 - 1)
    end)
    local v12 = {}
    local v13 = createElement
    local v14 = {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        Padding = UDim.new(0.02, 0),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
    }
    v12.uIListLayout = v13("UIListLayout", v14)
    v13 = icon
    if v13 then
        v14 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
        }
        v14.Image = not (typeof(icon) ~= "number") and ("rbxassetid://%*"):format(icon) or icon
        v14.ImageTransparency = v5.transparency
        v14.Size = UDim2.fromScale(0.08, 1)
        v13 = createElement(ImageLabel, v14, {uIAspectRatioConstraint = createElement("UIAspectRatioConstraint")})
    end
    v12.imageLabel = v13
    v12.textLabel = createElement("TextLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        RichText = true,
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Size = UDim2.fromScale(0.378, 0.6),
        Text = v2,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextTransparency = v5.transparency,
    }, {
        uIStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(4, 4, 4), Transparency = v6(0.25)}),
    })
    v10.contents = createElement("Frame", v11, v12)
    v10.uIStroke1 = createElement("UIStroke", {Color = Color3.fromRGB(20, 20, 20), Transparency = v5.transparency}, {
        uIGradient1 = createElement("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.2, 0.25),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.8, 0.25),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
    })
    v8.content = createElement("Frame", v9, v10)
    return createElement("Frame", v7, v8)
end)