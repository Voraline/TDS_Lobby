-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVP.PVPWaitingScreen
-- Decompile time: 5.64 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local Loader = require(ReplicatedStorage.Client.Interfaces.Components.Loader)
require(script.Parent.PVPTeamDevision)
require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
local memo = React.memo
local Tween = ReactFlow.Tween
local useGroupAnimation = ReactFlow.useGroupAnimation
local useSequenceAnimation = ReactFlow.useSequenceAnimation
local useTween = ReactFlow.useTween
return (memo(function(a1) -- Line: 21 -- upvalues: ReactFlow (val), React (val), createElement (val), ImageLabel (val), Loader (val)
    local status = a1.status
    local counter = a1.counter
    local v1 = a1.loading == true
    local v2, u23 = ReactFlow.useTween({
        start = UDim2.fromScale(0.1, 0.1),
        target = UDim2.fromScale(0.5, 0.5),
        info = TweenInfo.new(1.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    })
    local v3, u33 = ReactFlow.useTween({
        start = 6,
        target = 3,
        info = TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    })
    local v4 = {v1, counter}
    React.useEffect(function() -- Line: 39 -- upvalues: u23 (val), u33 (val)
        u23({start = UDim2.fromScale(0.1, 0.1), target = UDim2.fromScale(0.5, 0.5)})
        u33({start = 6, target = 3})
    end, v4)
    v4 = {BackgroundTransparency = 1, BorderSizePixel = 0}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v4.AnchorPoint = AnchorPoint
    v4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    local Position = a1.Position or UDim2.fromScale(0.5, 0.5)
    v4.Position = Position
    local Size = a1.Size or UDim2.fromScale(1, 1)
    v4.Size = Size
    local v5 = {}
    local v6 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Image = "rbxassetid://11999950713",
        ImageTransparency = 0.19,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    local glowPosition = a1.glowPosition or UDim2.fromScale(0.5, 0.5)
    v6.Position = glowPosition
    v6.Size = v2
    v5.glow = createElement(ImageLabel, v6, {uIAspectRatioConstraint1 = createElement("UIAspectRatioConstraint")})
    v5.status = createElement("TextLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextScaled = true,
        TextSize = 27,
        TextWrapped = true,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        FontFace = Font.new("rbxasset://fonts/families/Roboto.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.5, 0.15),
        Size = UDim2.fromScale(0.4, 0.1),
        Text = a1.status or "Waiting for Players...",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextYAlignment = Enum.TextYAlignment.Top,
    }, {
        uIAspectRatioConstraint2 = createElement("UIAspectRatioConstraint", {AspectRatio = 8}),
        uIStroke1 = createElement("UIStroke", {Thickness = 4, Transparency = 0.6}),
    })
    v5.timer = not v1 and createElement("TextLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextSize = 100,
        TextWrapped = true,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        FontFace = Font.new("rbxasset://fonts/families/Roboto.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.2, 0.2),
        Text = a1.counter,
        TextColor3 = Color3.fromRGB(255, 255, 255),
    }, {
        uIStroke = createElement("UIStroke"),
        uIScale = createElement("UIScale", {Scale = v3}),
        uIAspectRatioConstraint = createElement("UIAspectRatioConstraint"),
    })
    v5.loader = v1 and createElement(Loader, {
        BackgroundTransparency = 1,
        ZIndex = 3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.4, 0.4),
    })
    return createElement("Frame", v4, v5)
end))