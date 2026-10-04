-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Elevator.interface.ElevatorButton
-- Decompile time: 8.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local Sift = require(ReplicatedStorage.Packages.Sift)
return function(a1) -- Line: 13 -- upvalues: React (val), Sift (val) -- types: a1: table
    local createElement = React.createElement
    local v1 = Sift.Dictionary.merge({
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = a1.color,
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.new(0, 104, 0.5, 0),
        Size = UDim2.fromScale(0.44, 0.6),
    }, a1.native)
    local v2 = {}
    local createElement_2 = React.createElement
    local v3 = {}
    v3[React.Event.MouseButton1Click] = a1.onClick
    v3.Text = ""
    v3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v3.BackgroundTransparency = 1
    v3.BorderColor3 = Color3.fromRGB(27, 42, 53)
    v3.Size = UDim2.fromScale(1, 1)
    v3.ZIndex = 4
    v2.button = createElement_2("TextButton", v3)
    v2.uIStroke = React.createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(255, 255, 255)})
    v2.uICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0, 4)})
    v2.textLabel = React.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 24,
        TextWrapped = true,
        BackgroundTransparency = 1,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Text = a1.text,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.5, 0.5),
    }, {uIStroke1 = React.createElement("UIStroke", {Thickness = 2})})
    v2.dropShadow = React.createElement("ImageLabel", {
        Image = "rbxassetid://18610113607",
        BackgroundTransparency = 1,
        ZIndex = -1,
        ImageColor3 = Color3.fromRGB(170, 255, 127),
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(8, 8, 54, 54),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, 16, 1, 16),
    })
    v2.innerGlow = React.createElement("ImageLabel", {
        Image = "rbxassetid://85104292402513",
        ImageTransparency = 0.5,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {
        uIGradient = React.createElement("UIGradient", {
            Rotation = -90,
            Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 1))}),
        }),
        uICorner1 = React.createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
    })
    return createElement("Frame", v1, v2)
end