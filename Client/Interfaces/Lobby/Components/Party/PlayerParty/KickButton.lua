-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PlayerParty.KickButton
-- Decompile time: 0.53 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Button = require(ReplicatedStorage.Client.Interfaces.Components.Button)
local PartyContext = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartyContext)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return function(a1) -- Line: 14
    -- upvalues: React (val), PartyContext (val), createElement (val), Button (val)
    local u4 = React.useContext(PartyContext)
    return createElement(Button, {
        Text = "X",
        TextScaled = true,
        TextStrokeTransparency = 0,
        Position = UDim2.fromScale(0.9, 0.5),
        Size = UDim2.fromOffset(40, 40),
        Color = Color3.fromRGB(247, 63, 66),
        TextStrokeColor = Color3.new(0, 0, 0),
        TextAutomaticSize = Enum.AutomaticSize.X,
        Clicked = function() -- Line: 26 -- upvalues: a1 (val), u4 (val)
            if a1.kickPlayer then
                u4.onKickCallback(a1.kickPlayer)
            end
        end,
    })
end