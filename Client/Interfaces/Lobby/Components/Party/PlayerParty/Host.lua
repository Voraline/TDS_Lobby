-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PlayerParty.Host
-- Decompile time: 4.57 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local PartyContext = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartyContext)
local React = require(ReplicatedStorage.Shared.UI.React)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
return function(a1) -- Line: 17
    -- upvalues: React (val), PartyContext (val), useBinding (val), useEffect (val), createElement (val)
    -- upvalues: ImageLabel (val), TextLabel (val)
    local u4 = React.useContext(PartyContext)
    local v1, u8 = useBinding(u4.hostLevel)
    local v2 = useEffect
    local v3 = {u4.hostLevel}
    v2(function() -- Line: 22 -- upvalues: u8 (val), u4 (val)
        u8(u4.hostLevel)
    end, v3)
    v3 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromOffset(0, 32),
        Size = UDim2.fromOffset(384, 112),
        Visible = a1.visible,
    }
    local v4 = {
        divider = createElement("Frame", {
            BackgroundTransparency = 0.8,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.new(0.5, 0, 1, 10),
            Size = UDim2.new(1.05, 0, 0, 3),
        }),
    }
    local v5 = {
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.fromOffset(379, 78),
    }
    local v6 = {
        playerIcon = createElement(ImageLabel, {
            BackgroundTransparency = 0.8,
            BorderSizePixel = 0,
            Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(u4.host and u4.host.UserId or 0),
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.new(0, 8, 0.5, 0),
            Size = UDim2.fromOffset(64, 64),
        }, {
            uiCorner = createElement("UICorner"),
            uiStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.8, Color = Color3.fromRGB(255, 255, 255)}),
        }),
    }
    v6.playerName = createElement(TextLabel, {
        FontWeight = "Bold",
        TextScaled = true,
        TextWrapped = true,
        StrokeThickness = 2,
        Text = ("%*"):format(u4.host and u4.host.Name or "???"),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        Position = UDim2.fromOffset(86, 20),
        Size = UDim2.new(0.812, -96, 0, 24),
        AnchorPoint = Vector2.zero,
    })
    v6.level = createElement(TextLabel, {
        FontWeight = "Medium",
        TextScaled = true,
        TextTransparency = 0.3,
        TextWrapped = true,
        Text = v1:map(function(a1) -- Line: 88
            return (("Lvl. %*"):format(a1 or 0))
        end),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        Position = UDim2.fromOffset(86, 45),
        Size = UDim2.new(0.812, -96, -0.0456, 20),
        AnchorPoint = Vector2.zero,
    })
    v6.uiStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(255, 255, 255)})
    v4.hostFrame = createElement("Frame", v5, v6)
    return createElement("Frame", v3, v4)
end