-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartySearch.JoinButton
-- Decompile time: 1.10 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Button = require(ReplicatedStorage.Client.Interfaces.Components.Button)
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 13 -- upvalues: createElement (val), Button (val) -- types: a1: table
    return createElement(Button, {
        Text = "Join",
        TextStrokeTransparency = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(1, -140, 0.5, 16),
        Size = UDim2.fromOffset(160, 40),
        TextStrokeColor = Color3.new(0, 0, 0),
        Clicked = function() -- Line: 21 -- upvalues: a1 (val)
            if a1.onClick then
                a1.onClick(a1.host)
            end
        end,
    })
end