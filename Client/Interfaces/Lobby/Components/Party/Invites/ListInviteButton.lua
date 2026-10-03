-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.Invites.ListInviteButton
-- Decompile time: 0.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Button = require(ReplicatedStorage.Client.Interfaces.Components.Button)
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 16 -- upvalues: createElement (val), Button (val) -- types: a1: table
    return createElement(Button, {
        TextScaled = true,
        TextStrokeTransparency = 0,
        IconScale = 0.56,
        TextStrokeThickness = 2.5,
        Color = a1.imageColor3,
        Clicked = function() -- Line: 19 -- upvalues: a1 (val)
            if a1.onClick then
                a1.onClick()
            end
        end,
        Icon = a1.image,
        Text = a1.text,
        TextStrokeColor = Color3.new(0, 0, 0),
        Size = UDim2.fromOffset(57, 57),
        Position = UDim2.fromScale(0.284, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        LayoutOrder = a1.layoutOrder or 1,
    })
end