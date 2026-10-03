-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.ExtraButton
-- Decompile time: 1.97 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 24
    -- upvalues: ReactFlow (val), useSound (val), createElement (val), React (val)
    local Value = a1.color.Keypoints[1].Value
    local Value_2 = a1.color.Keypoints[2].Value
    local v1, u13 = ReactFlow.useSpring({target = 1, start = 1, damper = 0.6, speed = 43})
    local Click = useSound("Click")
    local v2 = {AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = Color3.new(1, 1, 1)}
    local position = a1.position or UDim2.fromScale(0.117901, -0.2)
    v2.Position = position
    v2.Selectable = true
    v2.Active = true
    local size = a1.size or UDim2.fromScale(0.221503, 0.4)
    v2.Size = size

    v2[React.Event.MouseEnter] = function() -- Line: 44 -- upvalues: u13 (val)
        u13({target = 1.1})
    end

    v2[React.Event.MouseLeave] = function() -- Line: 49 -- upvalues: u13 (val)
        u13({target = 1})
    end

    v2[React.Event.MouseButton1Down] = function() -- Line: 54 -- upvalues: u13 (val), a1 (val), Click (val)
        u13({target = 0.9})
        a1.onClick()
        Click()
    end

    v2[React.Event.MouseButton1Up] = function() -- Line: 61 -- upvalues: u13 (val)
        u13({target = 1.1})
    end

    local v3 = {AspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 3})}
    v3.uIStroke = createElement("UIStroke", {Thickness = 3, Color = Color3.new(1, 1, 1), Enabled = a1.selected == true})
    local v4 = {Scale = v1}
    v3.uIScale = createElement("UIScale", v4)
    local icon = a1.icon
    if icon then
        v4 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = a1.icon or "rbxassetid://8429448520",
            Position = UDim2.fromScale(0.8, 0.499999),
            ScaleType = Enum.ScaleType.Fit,
        }
        local iconSize = a1.iconSize or UDim2.fromScale(0.3, 1)
        v4.Size = iconSize
        v4.ImageColor3 = a1.imageColor
        v4.ImageTransparency = a1.imageTransparency
        icon = createElement("ImageLabel", v4)
    end
    v3.imageLabel = icon
    v3.uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.1, 0)})
    v3.textLabel = createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        AnchorPoint = Vector2.new(0, 0.5),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.0823254, 0.5),
        Size = UDim2.fromScale(0.80161, 0.535202),
        Text = a1.text,
        TextColor3 = Color3.new(1, 1, 1),
        TextXAlignment = Enum.TextXAlignment.Left,
    }, {uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.39})})
    v3.uIGradient = createElement("UIGradient", {
        Rotation = 90,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Value),
            (ColorSequenceKeypoint.new(1, Value_2)),
        }),
    })
    return createElement("ImageButton", v2, v3, a1.children)
end)