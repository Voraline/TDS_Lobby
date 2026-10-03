-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.LiveEventDisplay
-- Decompile time: 2.64 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u7 = require("./News/EventButton")
local React = require(ReplicatedStorage.Shared.UI.React)
local Sift = require(ReplicatedStorage.Packages.Sift)
local createElement = React.createElement

local function formatTime(a1) -- Line: 19 -- types: a1: number
    local v1 = math.floor(a1 / 86400)
    local v2 = math.floor(a1 % 86400 / 3600)
    local v3 = math.floor(a1 % 3600 / 60)
    local v4 = a1 % 60
    if not (v1 <= 0) then
        return string.format("%02d:%02d:%02d:%02d", v1, v2, v3, v4)
    end
    if not (v2 <= 0) then
        return string.format("%02d:%02d:%02d", v2, v3, v4)
    end
    if v3 <= 0 then
        return string.format("00:%02d", v4)
    end
    return string.format("%02d:%02d", v3, v4)
end

return React.memo(function(a1) -- Line: 41 -- upvalues: Sift (val), createElement (val), formatTime (val), u7 (val) -- types: a1: table
    local v1 = Sift.Dictionary.merge({
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.new(1, 1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.8, 0.8),
    }, a1.native or {})
    local v2 = {
        UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.2, 0)}),
        UIGradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(26, 18, 36)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(26, 18, 36))),
            }),
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.221584, 0.475),
                NumberSequenceKeypoint.new(0.687715, 0.9625),
                (NumberSequenceKeypoint.new(1, 0.6875)),
            }),
        }),
        Thumbnail = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = ("rbxassetid://%*"):format(a1.eventImageId),
            Position = UDim2.fromScale(0.5, 0.25),
            Size = UDim2.fromScale(0.7, 0.7),
        }, {
            UIAspectRatio = createElement("UIAspectRatioConstraint", {
                AspectRatio = 1.77,
                AspectType = Enum.AspectType.ScaleWithParentSize,
                DominantAxis = Enum.DominantAxis.Height,
            }),
            UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.1, 0)}),
            UIStroke = createElement("UIStroke", {Thickness = 6, Transparency = 0.7, Color = Color3.new(1, 1, 1)}),
            DisplayName = createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                AnchorPoint = Vector2.new(0.5, 0.5),
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
                Position = UDim2.fromScale(0.5, 0),
                Size = UDim2.fromScale(1, 0.2),
                Text = a1.eventTitle,
                TextColor3 = Color3.fromRGB(255, 70, 70),
            }, {(createElement("UIStroke", {Thickness = 6}))}),
        }),
    }
    local v3 = {
        BackgroundTransparency = 1,
        ZIndex = 10,
        TextScaled = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.5, 0.6),
        Size = UDim2.fromScale(1, 0.2),
    }
    local v4 = if typeof(a1.eventTimeLeft) ~= "number" then a1.eventTimeLeft:map(function(a1) -- Line: 124 -- upvalues: formatTime (upval)
        return formatTime(a1)
    end) else formatTime(a1.eventTimeLeft)
    v3.Text = v4
    v3.TextColor3 = Color3.new(1, 1, 1)
    v3.Visible = a1.bottomTextVisible
    v2.Countdown = createElement("TextLabel", v3, {UIStroke = createElement("UIStroke", {Thickness = 6})})
    v2.Button = createElement(u7, {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.825),
        Size = UDim2.fromScale(0.4, 0.2),
        eventId = a1.eventId,
    }, {UIScale = createElement("UIScale", {Scale = if a1.bottomTextVisible then 1 else 1.25})})
    v2.UIAspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1.5})
    return createElement("Frame", v1, v2)
end)