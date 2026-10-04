-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PlayerSearch.CreateLeaveButton
-- Decompile time: 5.18 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PartyContext = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartyContext)
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Button = require(ReplicatedStorage.Client.Interfaces.Components.Button)
local React = require(ReplicatedStorage.Shared.UI.React)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local useSpring = require(Hooks.useSpring)
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
local LocalPlayer = Players.LocalPlayer
return function() -- Line: 18
    -- upvalues: React (val), PartyContext (val), useSpring (val), useBinding (val), useEffect (val), LocalPlayer (val)
    -- upvalues: createElement (val), Button (val), TextLabel (val)
    local u3 = React.useContext(PartyContext)
    local currentWindow = u3.currentWindow
    local host = u3.host
    local v1, u15 = useSpring(UDim2.fromScale(0.5, 1.035), 0.8, 20, true)
    local u19, u20 = useBinding(tick())
    local v2, u24 = useBinding("CREATE PARTY")
    local v3, u28 = useBinding("Create or join a party to start playing!")
    local v4 = {currentWindow, host}
    useEffect(function() -- Line: 29
        -- upvalues: currentWindow (val), u15 (val), host (val), u24 (val), u28 (val), LocalPlayer (upval)
        if currentWindow == "PartySearch" then
            u15(UDim2.fromScale(0.5, 1.035))
        elseif currentWindow ~= "CurrentParty" then
            u15(UDim2.fromScale(0.5, 3))
        else
            u15(UDim2.fromScale(0.5, 1.035))
        end
        if not host then
            u24("CREATE PARTY")
            u28("Create or join a party to start playing!")
            return
        end
        u24("LEAVE PARTY")
        if host ~= LocalPlayer then
            u28("Not feeling the vibes? You can leave the party!")
            return
        end
        u28("Leaving will change the party leader!")
    end, v4)
    v4 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Visible = true,
        ZIndex = 3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(60, 60, 60),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v1,
        Size = UDim2.fromOffset(384, 128),
    }
    local v5 = {}
    local v6 = {
        ZIndex = 3,
        TextStrokeTransparency = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0, 40),
        Size = UDim2.fromOffset(256, 48),
        Text = v2,
    }
    v6.Color = host and Color3.fromRGB(207, 58, 58) or nil
    v6.TextStrokeColor = Color3.new(0, 0, 0)

    function v6.Clicked() -- Line: 69 -- upvalues: u19 (val), u20 (val), host (val), u3 (val)
        if tick() - u19:getValue() < 0.2 then
            return
        end
        u20(tick())
        if not host then
            u3.createParty()
            return
        end
        u3.leaveParty()
    end

    v5.button = createElement(Button, v6)
    v5.description = createElement(TextLabel, {
        FontWeight = "Heavy",
        TextScaled = true,
        TextWrapped = true,
        StrokeThickness = 2,
        StrokeTransparency = 0.35,
        Text = v3,
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.new(0.5, 0, 0.8, 0),
        Size = UDim2.new(1.3, 0, 0, 24),
    })
    return createElement("Frame", v4, v5)
end