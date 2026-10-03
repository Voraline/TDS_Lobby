-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.MatchmakingPairing
-- Decompile time: 4.53 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Components = ReplicatedStorage.Client.Interfaces.Components
local IconButton = require(Components.IconButton)
local ImageLabel = require(Components.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local Tween = ReactFlow.Tween
local useGroupAnimation = ReactFlow.useGroupAnimation
local useAnimation = ReactFlow.useAnimation
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState

local function map(a1, a2, a3, a4, a5) -- Line: 33 -- types: a1: number, a2: number, a3: number, a4: number, a5: number
    return (a1 - a2) / (a3 - a2) * (a5 - a4) + a4
end

local function formatTime(a1) -- Line: 37 -- types: a1: number
    return string.format("%02d:%02d", math.floor(a1 / 60), a1 % 60)
end

return function(a1) -- Line: 44
    -- upvalues: useState (val), useGroupAnimation (val), useAnimation (val), Tween (val), useEffect (val)
    -- upvalues: createElement (val), IconButton (val), ImageLabel (val), TextLabel (val)
    local u3 = a1.visible ~= false
    local v1 = a1.canCancel ~= false
    local v2 = a1.elapsedSeconds or 0
    local v3 = a1.showElapsedTime ~= false
    local u17 = a1.animateStatusDots == true
    local v4 = a1.playerCountText or "0/2 Players"
    local v5 = a1.statusText or "Searching for players"
    local v6, u26 = useState(3)
    local v7 = v5
    if u17 then
        v7 = ("%*%*"):format(v5:gsub("%.+$", ""), (string.rep(".", v6)))
    end
    local v8, u90 = useGroupAnimation({
        enable = useAnimation({
            transparency = Tween({target = 0, info = TweenInfo.new(0.2)}),
            position = Tween({target = UDim2.fromScale(0.5, 0.5), info = TweenInfo.new(0.2)}),
        }),
        disable = useAnimation({
            transparency = Tween({target = 1, info = TweenInfo.new(0.2)}),
            position = Tween({target = UDim2.fromScale(0.5, 0.6), info = TweenInfo.new(0.2)}),
        }),
    }, {transparency = 1, position = UDim2.fromScale(0.5, 0.6)})
    local v9 = {u3}
    useEffect(function() -- Line: 74 -- upvalues: u90 (val), u3 (val)
        u90(if not u3 then "disable" else "enable")
    end, v9)
    v9 = {u17, u3}
    useEffect(function() -- Line: 78 -- upvalues: u3 (val), u17 (val), u26 (val)
        if u3 and u17 then
            local u2 = true
            local u3_2 = 3
            local u4 = -1
            u26(u3_2)
            local u10 = task.spawn(function() -- Line: 89 -- upvalues: u2 (ref), u3_2 (ref), u4 (ref), u26 (upval)
                while u2 do
                    task.wait(0.45)
                    u3_2 = u3_2 + u4
                    if u3_2 <= 1 then
                        u3_2 = 1
                        u4 = 1
                    elseif u3_2 >= 3 then
                        u3_2 = 3
                        u4 = -1
                    end
                    u26(u3_2)
                end
            end)
            return function() -- Line: 106 -- upvalues: u2 (ref), u10 (val)
                u2 = false
                task.cancel(u10)
            end
        end
        u26(3)
    end, v9)
    v9 = {}
    local anchorPoint = a1.anchorPoint or Vector2.new(0.5, 0)
    v9.AnchorPoint = anchorPoint
    v9.BackgroundTransparency = v8.transparency:map(function(a1) -- Line: 114
        return (a1 - 0) / 1 * 0.8 + 0.2
    end)
    v9.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
    local size = a1.size or UDim2.fromScale(0.291, 0.066)
    v9.Size = size
    local position = a1.position or UDim2.new(0.5, 0, 0, 20)
    v9.Position = position
    return createElement("Frame", v9, {
        corner = createElement("UICorner"),
        gradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(38, 38, 38))),
            }),
        }),
        sizeConstraint = createElement("UISizeConstraint", {MaxSize = Vector2.new((1 / 0), 100)}),
        aspectRadio = createElement("UIAspectRatioConstraint", {
            AspectRatio = 7,
            AspectType = Enum.AspectType.ScaleWithParentSize,
            DominantAxis = Enum.DominantAxis.Height,
        }),
        closeButton = if not v1 then nil else createElement(IconButton, {
            AnchorPoint = Vector2.new(1, 0.5),
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
            Position = UDim2.fromScale(0.962, 0.5),
            Size = UDim2.fromScale(0.925, 0.5),
            Color = Color3.fromRGB(255, 60, 60),
            Transparency = v8.transparency,
            Clicked = a1.onCancel,
        }, {aspectRatio = createElement("UIAspectRatioConstraint")}),
        dropShadow = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            Image = "rbxassetid://9239716855",
            ZIndex = -1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            ImageTransparency = v8.transparency:map(function(a1) -- Line: 154
                return (a1 - 0) / 1 * 0.8 + 0.2
            end),
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Slice,
            Size = UDim2.new(1, 14, 1, 14),
            SliceCenter = Rect.new(14, 14, 64, 24),
        }),
        icon = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            Image = "rbxassetid://6035202013",
            AnchorPoint = Vector2.new(0, 0.5),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            ImageTransparency = v8.transparency,
            Position = UDim2.fromScale(0.03, 0.5),
            Size = UDim2.fromScale(0.7, 0.7),
            SizeConstraint = Enum.SizeConstraint.RelativeYY,
        }),
        playerCount = createElement(TextLabel, {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            TextScaled = true,
            TextWrapped = true,
            StrokeThickness = 4,
            FontWeight = "SemiBold",
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.15, 0.65),
            Size = UDim2.fromScale(0.25, 0.3),
            Text = v4,
            TextColor3 = Color3.fromRGB(157, 181, 204),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTransparency = v8.transparency,
            StrokeColor = Color3.new(0, 0, 0),
            StrokeTransparency = v8.transparency:map(function(a1) -- Line: 194
                return (a1 - 0) / 1 * 0.4 + 0.6
            end),
        }),
        status = createElement(TextLabel, {
            LayoutOrder = 1,
            TextScaled = true,
            FontWeight = "Bold",
            StrokeThickness = 4,
            AnchorPoint = Vector2.zero,
            Position = UDim2.fromScale(0.15, 0.08),
            Size = UDim2.fromScale(0.45, 0.4),
            Text = v7,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTransparency = v8.transparency,
            StrokeColor = Color3.new(0, 0, 0),
            StrokeTransparency = v8.transparency:map(function(a1) -- Line: 211
                return (a1 - 0) / 1 * 0.4 + 0.6
            end),
        }),
        elaspedTime = createElement(TextLabel, {
            BackgroundTransparency = 1,
            Font = "RobotoMono",
            FontWeight = "Bold",
            LayoutOrder = 1,
            TextScaled = true,
            StrokeThickness = 4,
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Position = UDim2.fromScale(0.65, 0.5),
            Size = UDim2.fromScale(0.2, 0.5),
            Text = string.format("%02d:%02d", math.floor(v2 / 60), v2 % 60),
            TextColor3 = Color3.fromRGB(238, 238, 238),
            TextXAlignment = Enum.TextXAlignment.Right,
            TextTransparency = v8.transparency,
            Visible = v3,
            StrokeColor = Color3.new(0, 0, 0),
            StrokeTransparency = v8.transparency:map(function(a1) -- Line: 233
                return (a1 - 0) / 1 * 0.4 + 0.6
            end),
        }),
    })
end