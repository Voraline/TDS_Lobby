-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartySearch.PlayerIcon
-- Decompile time: 0.67 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local createElement = React.createElement
return function(a1) -- Line: 14 -- upvalues: createElement (val), ImageLabel (val), TextLabel (val) -- types: a1: table
    return createElement(ImageLabel, {
        BackgroundTransparency = 0.85,
        BorderSizePixel = 0,
        Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(a1.userId),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(0, 16, 0.5, 16),
        Size = UDim2.fromOffset(64, 64),
    }, {
        uiCorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
        level = createElement(TextLabel, {
            FontWeight = "Heavy",
            TextSize = 16,
            StrokeThickness = 2,
            Text = ("Lv. %*"):format(a1.level),
            TextColor3 = Color3.fromRGB(0, 170, 255),
            Position = UDim2.fromScale(0.5, 1),
            Size = UDim2.fromOffset(32, 16),
        }),
    })
end