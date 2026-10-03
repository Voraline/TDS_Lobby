-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PlayerParty.Member
-- Decompile time: 1.48 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Party = ReplicatedStorage.Client.Interfaces.Lobby.Components.Party
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local KickButton = require(Party.PlayerParty.KickButton)
local PartyContext = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartyContext)
local React = require(ReplicatedStorage.Shared.UI.React)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local createElement = React.createElement
return function(a1) -- Line: 21
    -- upvalues: React (val), PartyContext (val), createElement (val), KickButton (val), Players (val), TextLabel (val)
    -- upvalues: ImageLabel (val)
    local v1 = React.useContext(PartyContext)
    local v2 = {
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(7, 7, 7),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromOffset(379, 78),
        Visible = a1.memberUserId ~= nil,
    }
    local v3 = {}
    local isHost = v1.isHost and createElement(KickButton, {kickPlayer = Players:GetPlayerByUserId(a1.memberUserId)})
    v3.kick = isHost
    v3.levelLabel = createElement(TextLabel, {
        FontWeight = "Medium",
        TextScaled = true,
        TextTransparency = 0.3,
        TextWrapped = true,
        Text = ("Lvl. %*"):format(a1.level),
        TextXAlignment = Enum.TextXAlignment.Left,
        Position = UDim2.fromOffset(86, 45),
        Size = UDim2.new(0.812, -96, -0.0456, 20),
        AnchorPoint = Vector2.zero,
    })
    v3.playerIcon = createElement(ImageLabel, {
        BackgroundTransparency = 0.8,
        BorderSizePixel = 0,
        Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(a1.memberUserId),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(0, 8, 0.5, 0),
        Size = UDim2.fromOffset(64, 64),
    }, {
        uiCorner = createElement("UICorner"),
        uiStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.8, Color = Color3.fromRGB(255, 255, 255)}),
    })
    v3.playerName = createElement(TextLabel, {
        FontWeight = "Bold",
        TextScaled = true,
        TextWrapped = true,
        StrokeThickness = 3,
        StrokeTransparency = 0.74,
        Text = a1.memberDisplayName,
        TextXAlignment = Enum.TextXAlignment.Left,
        Position = UDim2.fromOffset(86, 20),
        Size = UDim2.new(0.812, -96, 0, 24),
        AnchorPoint = Vector2.zero,
    })
    return createElement("Frame", v2, v3)
end