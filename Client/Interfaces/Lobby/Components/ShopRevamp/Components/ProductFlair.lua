-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Components.ProductFlair
-- Decompile time: 4.80 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local Client = ReplicatedStorage.Client
local React = require(Packages.React)
local Sift = require(Packages.Sift)
local TextLabel = require(Client.Interfaces.Components.TextLabel)
local createElement = React.createElement
local memo = React.memo
local u20 = {}
u20.Red = {
    background = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(172, 0, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 54, 47))),
    }),
    accent = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 33, 28)),
        ColorSequenceKeypoint.new(0.289, Color3.fromRGB(255, 33, 28)),
        ColorSequenceKeypoint.new(0.569, Color3.fromRGB(255, 91, 86)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 91, 86))),
    }),
    outline = Color3.fromRGB(255, 115, 115),
    glow = Color3.fromRGB(255, 0, 0),
}
u20.Green = {
    background = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 130, 48)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(54, 255, 115))),
    }),
    accent = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 210, 79)),
        ColorSequenceKeypoint.new(0.289, Color3.fromRGB(20, 210, 79)),
        ColorSequenceKeypoint.new(0.569, Color3.fromRGB(99, 255, 146)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(99, 255, 146))),
    }),
    outline = Color3.fromRGB(126, 255, 165),
    glow = Color3.fromRGB(0, 255, 76),
}
return memo(function(a1) -- Line: 61 -- upvalues: u20 (val), Sift (val), createElement (val), TextLabel (val) -- types: a1: table
    local v1 = u20[a1.theme or "Red"]
    local v2 = Sift.Dictionary.join({
        BackgroundTransparency = 1,
        ZIndex = 100,
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.fromScale(-0.02, 0.25),
        Size = UDim2.fromScale(0.25, 0.25),
    }, a1.native or {})
    local v3 = {
        UIAspectRatioConstraint = not a1.custom and createElement("UIAspectRatioConstraint", {AspectRatio = 1.67}),
        BaseBackground = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://135656053365824",
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
            Rotation = if not a1.flipped then 0 else 180,
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(216, 152, 216, 152),
        }, {
            UIGradient = createElement("UIGradient", {Rotation = 180, Color = v1.background}),
            Outline = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "rbxassetid://88576814442237",
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                ImageColor3 = v1.outline,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(212, 152, 214, 152),
            }),
        }),
    }
    local v4 = {
        BackgroundTransparency = 1,
        TextScaled = true,
        ZIndex = 2,
        FontWeight = "Bold",
        StrokeThickness = 0.1,
        StrokeTransparency = 0.3,
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local textPosition = a1.textPosition or UDim2.fromScale(0.7, 0.5)
    v4.Position = textPosition
    local textLabelSize = a1.textLabelSize or UDim2.fromScale(0.8, 0.7)
    v4.Size = textLabelSize
    v4.TextColor3 = Color3.fromRGB(255, 255, 255)
    v4.Text = a1.flairText
    v4.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
    v4.TextXAlignment = Enum.TextXAlignment.Left
    v3.TextLabel = createElement(TextLabel, v4)
    v3.DropShadow = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://139642951391099",
        ImageTransparency = 0.5,
        ZIndex = -2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.6),
        Size = UDim2.fromScale(1, 1),
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        Rotation = if not a1.flipped then 0 else 180,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(203, 156, 205, 156),
    })
    v3.Glow = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://133779443473993",
        ImageTransparency = 1,
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.3, 1.3),
        ImageColor3 = v1.glow,
        Rotation = if not a1.flipped then 0 else 180,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(232, 169, 232, 169),
    })
    return createElement("Frame", v2, v3)
end)