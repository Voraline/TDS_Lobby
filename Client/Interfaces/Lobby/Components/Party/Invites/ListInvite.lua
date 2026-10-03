-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.Invites.ListInvite
-- Decompile time: 2.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Party = ReplicatedStorage.Client.Interfaces.Lobby.Components.Party
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local ListInviteButton = require(Party.Invites.ListInviteButton)
local PartyContext = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartyContext)
local React = require(ReplicatedStorage.Shared.UI.React)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local createElement = React.createElement
return function(a1) -- Line: 23
    -- upvalues: React (val), PartyContext (val), createElement (val), TextLabel (val), ListInviteButton (val)
    -- upvalues: ImageLabel (val)
    local u4 = React.useContext(PartyContext)
    return createElement("Frame", {
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(7, 7, 7),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.new(1, -20, 0, 80),
    }, {
        nameLabel = createElement(TextLabel, {
            FontWeight = "Heavy",
            TextScaled = true,
            TextSize = 24,
            TextWrapped = true,
            StrokeThickness = 3,
            StrokeTransparency = 0.7,
            Text = a1.displayName,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
            Position = UDim2.fromScale(0.206, 0.254),
            Size = UDim2.new(0.433, 0, -0.0889, 32),
            AnchorPoint = Vector2.zero,
        }),
        uiGradient = createElement("UIGradient"),
        buttons = createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.new(0.969, -120, 0.5, 0),
            Size = UDim2.fromOffset(160, 48),
        }, {
            accept = createElement(ListInviteButton, {
                image = "rbxassetid://17275148743",
                layoutOrder = 1,
                imageColor3 = Color3.fromRGB(58, 222, 64),
                onClick = function() -- Line: 65 -- upvalues: u4 (val), a1 (val)
                    u4.acceptInvite(a1.player)
                end,
            }),
            deny = createElement(ListInviteButton, {
                text = "X",
                layoutOrder = 2,
                imageColor3 = Color3.fromRGB(247, 63, 66),
                onClick = function() -- Line: 75 -- upvalues: u4 (val), a1 (val)
                    u4.denyInvite(a1.player)
                end,
            }),
            uiListLayout = createElement("UIListLayout", {
                Padding = UDim.new(0, 4),
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
        }),
        levelLabel = createElement(TextLabel, {
            TextSize = 16,
            TextTransparency = 0.41,
            StrokeThickness = 2,
            StrokeTransparency = 1,
            Text = "Lvl " .. a1.level,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.412, 0.637),
            Size = UDim2.fromOffset(263, 15),
        }),
        player = createElement("Frame", {
            BackgroundTransparency = 0.65,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.139, 0.5),
            Size = UDim2.fromOffset(60, 60),
        }, {
            uiCorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
            icon = createElement(ImageLabel, {
                BackgroundTransparency = 1,
                ZIndex = 2,
                Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(a1.userId),
                ScaleType = Enum.ScaleType.Fit,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
            }, {uICorner1 = createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}),
            uiStroke = createElement("UIStroke", {Thickness = 4, Transparency = 0.8, Color = Color3.fromRGB(36, 36, 36)}),
        }),
        playerShadow = createElement(ImageLabel, {
            Image = "rbxassetid://16691356182",
            ImageTransparency = 0.85,
            BackgroundTransparency = 1,
            ZIndex = -1,
            ImageColor3 = Color3.fromRGB(147, 185, 255),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.139, 0.5),
            Size = UDim2.fromOffset(100, 100),
        }),
    })
end