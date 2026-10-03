-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PlayerParty.SettingsIcon
-- Decompile time: 0.69 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Button = require(ReplicatedStorage.Client.Interfaces.Components.Button)
local PartyContext = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartyContext)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useContext = React.useContext
local useEffect = React.useEffect
local useBinding = React.useBinding
return function(a1) -- Line: 18
    -- upvalues: useContext (val), PartyContext (val), useBinding (val), useEffect (val), createElement (val)
    -- upvalues: Button (val)
    local u3 = useContext(PartyContext)
    local v1, u7 = useBinding(u3.isHost)
    local v2 = useEffect
    local v3 = {u3.isHost}
    v2(function() -- Line: 22 -- upvalues: u7 (val), u3 (val)
        u7(u3.isHost)
    end, v3)
    return createElement(Button, {
        BackgroundIcon = "rbxassetid://17012766194",
        Size = UDim2.fromOffset(32, 32),
        Position = UDim2.fromOffset(368, 43),
        Color = Color3.new(1, 1, 1),
        Visible = v1,
        Clicked = function() -- Line: 32 -- upvalues: a1 (val)
            a1.updateSettingsVisible(not a1.settingsVisible:getValue())
        end,
    })
end