-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.GlitchEventText
-- Decompile time: 0.52 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local RichText = require(ReplicatedStorage.Client.Interfaces.Components.RichText)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 13 -- upvalues: createElement (val), RichText (val) -- types: a1: table
    return createElement("Frame", {
        BackgroundTransparency = 0,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    }, {
        GlitchEventText = createElement(RichText, {
            Size = UDim2.new(1, 0, 0, 50),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Text = ("<staticglitch>%*</staticglitch>"):format(a1.text),
        }),
    })
end)