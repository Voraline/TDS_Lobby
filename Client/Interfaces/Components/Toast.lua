-- Script path: ReplicatedStorage.Client.Interfaces.Components.Toast
-- Decompile time: 5.79 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Components = ReplicatedStorage.Client.Interfaces.Components
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local ImageLabel = require(Components.ImageLabel)
local memo = React.memo
local createElement = React.createElement
local useRef = React.useRef
local useEffect = React.useEffect
local useAnimation = ReactFlow.useAnimation
local useGroupAnimation = ReactFlow.useGroupAnimation
local Tween = ReactFlow.Tween
return (memo(function(a1) -- Line: 37
    -- upvalues: useRef (val), useGroupAnimation (val), useAnimation (val), Tween (val), useEffect (val)
    -- upvalues: createElement (val), ImageLabel (val)
    local v1 = a1.icon or 17524544403
    local u4 = a1.duration or 5
    local u7 = useRef(a1.onLeave)
    u7.current = a1.onLeave
    local v2, u51 = useGroupAnimation({
        enabled = useAnimation({
            position = Tween({
                info = TweenInfo.new(0.6, Enum.EasingStyle.Cubic),
                target = UDim2.new(0, 2, 0, 2),
            }),
        }),
        disabled = useAnimation({
            position = Tween({
                info = TweenInfo.new(0.6, Enum.EasingStyle.Cubic),
                target = UDim2.new(1, 0, 0, 2),
            }),
        }),
    }, {position = UDim2.new(1, 0, 0, 2)})
    useEffect(function() -- Line: 60 -- upvalues: u51 (val), u4 (val), u7 (val)
        u51("enabled")
        if u4 <= -1 then
            return
        end
        local u8 = task.delay(u4, function() -- Line: 67 -- upvalues: u51 (upval), u7 (upval)
            u51("disabled")
            task.wait(0.6)
            if u7.current then
                u7.current()
            end
        end)
        return function() -- Line: 75 -- upvalues: u8 (val)
            task.cancel(u8)
        end
    end, {})
    local v3 = {BackgroundTransparency = 1, ClipsDescendants = true}
    local size = a1.size or UDim2.fromScale(1, 1)
    v3.Size = size
    local position = a1.position or UDim2.fromScale(0.5, 0.5)
    v3.Position = position
    local anchorPoint = a1.anchorPoint or Vector2.new(0.5, 0.5)
    v3.AnchorPoint = anchorPoint
    v3.LayoutOrder = a1.layoutOrder or 1
    local v4 = {
        uiAspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 6, DominantAxis = Enum.DominantAxis.Height}),
    }
    local v5 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 0.5,
        Size = UDim2.new(1, -4, 1, -4),
        Position = v2.position,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    }
    local v6 = {
        stroke = createElement("UIStroke", {
            Thickness = 1,
            Transparency = 0.8,
            Color = Color3.fromRGB(255, 255, 255),
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        }),
    }
    local v7 = {
        ImageTransparency = 0,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.12, 0.8),
        Position = UDim2.fromScale(0.018, 0.5),
        AnchorPoint = Vector2.new(0, 0.5),
    }
    v7.Image = not (typeof(v1) ~= "number") and ("rbxassetid://%*"):format(v1) or v1
    v7.ScaleType = Enum.ScaleType.Fit
    v7.ImageColor3 = Color3.fromRGB(255, 255, 255)
    v6.icon = createElement(ImageLabel, v7)
    v6.textContainer = createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.16, 0),
        Size = UDim2.fromScale(0.82, 1),
    }, {
        list = createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0, 4),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        title = createElement("TextLabel", {
            LayoutOrder = 0,
            TextSize = 18,
            TextTransparency = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.82, 0.25),
            AnchorPoint = Vector2.new(0, 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Text = a1.title,
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }),
        description = createElement("TextLabel", {
            LayoutOrder = 1,
            TextSize = 14,
            TextWrapped = true,
            TextTransparency = 0,
            BackgroundTransparency = 1,
            AutomaticSize = Enum.AutomaticSize.Y,
            Size = UDim2.fromScale(0.82, 0),
            AnchorPoint = Vector2.new(0, 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
            Text = a1.description,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextTruncate = Enum.TextTruncate.SplitWord,
        }, {
            sizeConstraint = createElement("UISizeConstraint", {MaxSize = Vector2.new((1 / 0), 40)}),
        }),
    })
    v4.content = createElement("Frame", v5, v6)
    return createElement("Frame", v3, v4)
end))