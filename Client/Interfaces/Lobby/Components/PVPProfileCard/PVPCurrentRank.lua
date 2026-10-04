-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.PVPProfileCard.PVPCurrentRank
-- Decompile time: 2.76 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactUtils = require(ReplicatedStorage.Shared.UI.ReactUtils)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 25
    -- upvalues: useTransparencyModifier (val), createElement (val), ImageLabel (val), ReactUtils (val)
    local v1 = useTransparencyModifier(a1.transparency)
    local v2 = {
        BackgroundColor3 = Color3.fromRGB(195, 24, 24),
        BackgroundTransparency = v1(0),
        AnchorPoint = a1.anchorPoint,
    }
    local position = a1.position or UDim2.fromScale(0, 0.276243)
    v2.Position = position
    local size = a1.size or UDim2.fromScale(0.491713, 0.723757)
    v2.Size = size
    return createElement("Frame", v2, {
        imageLabel = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            ImageTransparency = v1(0),
            Image = ReactUtils.map(a1.rankIcon, function(a1) -- Line: 39
                return (("rbxassetid://%*"):format(a1 or 79552995243967))
            end),
            Position = UDim2.fromScale(0.5, 0.45),
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromScale(1.1, 1.1),
        }, {aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1})}),
        textLabel = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            AnchorPoint = Vector2.new(0.5, 0),
            FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.5, 0.88),
            Size = UDim2.fromScale(2, 0.1),
            Text = a1.rankName,
            TextColor3 = Color3.new(1, 1, 1),
            TextTransparency = v1(0),
        }, {
            uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = v1(0)}),
            uITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 30}),
        }),
        uIGradient = createElement("UIGradient", {
            Transparency = v1(NumberSequence.new({NumberSequenceKeypoint.new(0, 0.4625), (NumberSequenceKeypoint.new(1, 1))})),
        }),
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(if not a1.physical then 0.11236 else 0, 0)}),
    })
end)