-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.MerchShop.ShopItemBanner
-- Decompile time: 1.34 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useFontScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useFontScale)
local createElement = React.createElement
return (React.memo(function(a1) -- Line: 26 -- upvalues: useFontScale (val), createElement (val)
    local v1 = useFontScale({scale = 1})
    local v2 = {BackgroundTransparency = 1, Image = "rbxassetid://84996667316716"}
    local anchorPoint = a1.anchorPoint or Vector2.new(1, 0)
    v2.AnchorPoint = anchorPoint
    local position = a1.position or UDim2.fromScale(1.05, -0.08)
    v2.Position = position
    v2.Size = UDim2.new(UDim.new(), a1.size and a1.size.Y or UDim.new(0.172, 0))
    local automaticSize = a1.automaticSize or Enum.AutomaticSize.X
    v2.AutomaticSize = automaticSize
    v2.ScaleType = Enum.ScaleType.Slice
    v2.SliceCenter = Rect.new(110, 137, 249, 138)
    v2.ZIndex = a1.zIndex
    return createElement("ImageLabel", v2, {
        text = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = false,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.13806, 0.0715817),
            Size = UDim2.fromScale(0, 0.894772),
            AutomaticSize = Enum.AutomaticSize.X,
            Text = a1.text,
            TextSize = v1,
            TextColor3 = Color3.new(1, 1, 1),
            TextStrokeColor3 = Color3.new(1, 1, 1),
        }, {
            padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 15)}),
            gradient = createElement("UIGradient", {
                Rotation = -90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 136, 0)),
                    ColorSequenceKeypoint.new(0.488774, Color3.fromRGB(255, 234, 0)),
                    ColorSequenceKeypoint.new(0.739206, Color3.fromRGB(255, 252, 220)),
                    (ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))),
                }),
            }),
            stroke = createElement("UIStroke", {Thickness = 3}),
        }),
    })
end))