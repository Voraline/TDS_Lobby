-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.PVPProfileCard.PVPTitle
-- Decompile time: 3.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactUtils = require(ReplicatedStorage.Shared.UI.ReactUtils)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 27
    -- upvalues: React (val), useTransparencyModifier (val), createElement (val), ReactUtils (val), ImageLabel (val)
    local v1, u5 = React.useBinding(30)
    local v2 = useTransparencyModifier(a1.transparency)
    local v3 = {
        BackgroundColor3 = Color3.fromRGB(177, 177, 177),
        BackgroundTransparency = v2(0.94),
        BorderColor3 = Color3.new(),
        BorderSizePixel = 0,
        AnchorPoint = a1.anchorPoint,
    }
    local position = a1.position or UDim2.fromScale(0, 0.044758)
    v3.Position = position
    local size = a1.size or UDim2.fromScale(1, 0.20442)
    v3.Size = size

    v3[React.Change.AbsoluteSize] = function(a1) -- Line: 40 -- upvalues: u5 (val)
        u5(a1.AbsoluteSize.Y / 2)
    end

    local v4 = {}
    local v5 = {
        BackgroundTransparency = 1,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.039, 0.05),
        Size = UDim2.fromScale(0.7, 0.5),
    }
    local displayName = a1.displayName or a1.userName or "Player"
    v5.Text = displayName
    v5.TextColor3 = Color3.new(1, 1, 1)
    v5.TextSize = v1:map(function(a1) -- Line: 55
        return (math.floor((math.clamp(a1, 8, 50))))
    end)
    v5.TextTruncate = Enum.TextTruncate.AtEnd
    v5.TextXAlignment = Enum.TextXAlignment.Left
    v5.TextTransparency = v2(0)
    v4.displayName = createElement("TextLabel", v5, {uIStroke = createElement("UIStroke", {Thickness = 3, Transparency = v2(0)})})
    v4.username = createElement("TextLabel", {
        BackgroundTransparency = 1,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.037, 0.5),
        Size = UDim2.fromScale(0.7, 0.4),
        Text = ReactUtils.map(a1.userName, function(a1) -- Line: 77
            return (("@%*"):format(a1 or "Player"))
        end),
        TextColor3 = Color3.fromRGB(222, 222, 222),
        TextSize = v1:map(function(a1) -- Line: 81
            return (math.floor((math.clamp(a1 * 0.8, 8, 50))))
        end),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTransparency = v2(0),
    }, {uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = v2(0)})})
    v4.characterPortrait = createElement(ImageLabel, {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(1, 0.5),
        ImageTransparency = v2(0),
        Image = ReactUtils.map(a1.userId, function(a1) -- Line: 97
            return (("rbxthumb://type=AvatarHeadShot&id=%*&w=352&h=352"):format(a1 or 19004289))
        end),
        Position = UDim2.fromScale(0.98, 0.5),
        ScaleType = Enum.ScaleType.Fit,
        Size = UDim2.fromScale(0.85, 0.85),
        SizeConstraint = Enum.SizeConstraint.RelativeYY,
    })
    return createElement("Frame", v3, v4)
end)