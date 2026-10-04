-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Catalog.Elements.ShowMore
-- Decompile time: 0.97 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NewsButton = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.NewsButton)
local React = require(ReplicatedStorage.Packages.React)
return function(a1, a2, a3) -- Line: 8
    -- upvalues: React (val), NewsButton (val)
    return React.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {
        Button = React.createElement(NewsButton, {
            ZIndex = 3,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Color = Color3.fromRGB(0, 170, 255),
            LayoutOrder = a2,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.25, 0.85),
            Text = a1,
            Clicked = a3,
        }),
    })
end