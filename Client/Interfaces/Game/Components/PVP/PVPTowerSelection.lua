-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVP.PVPTowerSelection
-- Decompile time: 8.18 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
require(ReplicatedStorage.Client.Interfaces.Components.Loader)
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
local u52 = memo(function(a1) -- Line: 22 -- upvalues: Players (val), createElement (val), ImageLabel (val)
    local player = a1.player or Players.LocalPlayer
    local v1 = ("rbxthumb://type=AvatarHeadShot&id=%*&w=420&h=420"):format(player.UserId)
    local v2 = {BackgroundTransparency = 1, BorderSizePixel = 0}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v2.AnchorPoint = AnchorPoint
    v2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v2.Image = v1
    v2.ImageColor3 = Color3.fromRGB(0, 0, 0)
    local Position = a1.Position or UDim2.fromScale(0.5, 0.5)
    v2.Position = Position
    local Size = a1.Size or UDim2.fromScale(0.8, 0.8)
    v2.Size = Size
    return createElement(ImageLabel, v2, {
        uIAspectRatioConstraint = createElement("UIAspectRatioConstraint"),
        imageLabel = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Image = v1,
            Position = UDim2.fromScale(-0.05, 0),
            Size = UDim2.fromScale(1, 1),
        }, {
            frame = createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.new(0.5, -5, 1, 0),
                Size = UDim2.new(1, 10, 0.13, 0),
            }, {
                uIListLayout = createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    Padding = UDim.new(0, 10),
                    SortOrder = Enum.SortOrder.LayoutOrder,
                }),
                imageLabel1 = createElement("ImageLabel", {
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(80, 80, 80),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Image = v1,
                    ScaleType = Enum.ScaleType.Crop,
                    Size = UDim2.fromScale(1, 1),
                    SizeConstraint = Enum.SizeConstraint.RelativeYY,
                }, {
                    uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
                    uIStroke = createElement("UIStroke", {Thickness = 3, Color = Color3.fromRGB(13, 13, 13)}),
                }),
                imageLabel2 = createElement("ImageLabel", {
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(80, 80, 80),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Image = v1,
                    ScaleType = Enum.ScaleType.Crop,
                    Size = UDim2.fromScale(1, 1),
                    SizeConstraint = Enum.SizeConstraint.RelativeYY,
                }, {
                    uICorner1 = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
                    uIStroke1 = createElement("UIStroke", {Thickness = 3, Color = Color3.fromRGB(13, 13, 13)}),
                }),
                imageLabel3 = createElement("ImageLabel", {
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(80, 80, 80),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Image = v1,
                    ScaleType = Enum.ScaleType.Crop,
                    Size = UDim2.fromScale(1, 1),
                    SizeConstraint = Enum.SizeConstraint.RelativeYY,
                }, {
                    uICorner2 = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
                    uIStroke2 = createElement("UIStroke", {Thickness = 3, Color = Color3.fromRGB(13, 13, 13)}),
                }),
                imageLabel4 = createElement("ImageLabel", {
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(80, 80, 80),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Image = v1,
                    ScaleType = Enum.ScaleType.Crop,
                    Size = UDim2.fromScale(1, 1),
                    SizeConstraint = Enum.SizeConstraint.RelativeYY,
                }, {
                    uICorner3 = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
                    uIStroke3 = createElement("UIStroke", {Thickness = 3, Color = Color3.fromRGB(13, 13, 13)}),
                }),
            }),
        }),
        textLabel = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            FontFace = Font.new("rbxasset://fonts/families/Roboto.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.5, 0),
            Size = UDim2.fromScale(1, 0.12),
            Text = ("@%*"):format(player.Name),
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }, {uIStroke4 = createElement("UIStroke", {Thickness = 2, Transparency = 0.5})}),
        uISizeConstraint = createElement("UISizeConstraint", {MaxSize = Vector2.new(240, 240)}),
    })
end)
local u55 = memo(function(a1) -- Line: 173 -- upvalues: createElement (val), u52 (val)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(0, 1),
    }, {
        uIFlexItem = createElement("UIFlexItem", {FlexMode = Enum.UIFlexMode.Grow}),
        imageLabel = createElement(u52, {Position = UDim2.fromScale(0.5, 0)}),
        imageLabel6 = createElement(u52, {Position = UDim2.fromScale(0.5, 0.5)}),
    })
end)
local u58 = memo(function(a1) -- Line: 196 -- upvalues: createElement (val), u52 (val)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 3,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(0, 1),
    }, {
        uIFlexItem = createElement("UIFlexItem", {FlexMode = Enum.UIFlexMode.Grow}),
        imageLabel = createElement(u52, {Position = UDim2.fromScale(0.5, 0)}),
        imageLabel6 = createElement(u52, {Position = UDim2.fromScale(0.5, 0.5)}),
    })
end)
return (memo(function(a1) -- Line: 219 -- upvalues: createElement (val), u55 (val), u58 (val)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.new(1, 0, 0.75, 5),
    }, {
        uIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        leftPlayers = createElement(u55, {}),
        rightPlayers = createElement(u58, {}),
    })
end))