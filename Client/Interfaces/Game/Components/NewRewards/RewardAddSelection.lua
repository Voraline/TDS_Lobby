-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewRewards.RewardAddSelection
-- Decompile time: 2.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GlowButton = require(ReplicatedStorage.Client.Interfaces.Components.GlowButton)
local React = require(ReplicatedStorage.Shared.UI.React)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 19
    -- upvalues: useTransparencyModifier (val), createElement (val), GlowButton (val)
    local v1 = useTransparencyModifier(a1.transparency)
    return createElement("Frame", {
        BackgroundColor3 = Color3.fromRGB(18, 18, 18),
        Position = UDim2.fromScale(0, 1.025),
        Size = UDim2.fromScale(1, 0.17193),
        BackgroundTransparency = v1(0.1),
        Visible = not a1.hasVIP,
    }, {
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.1, 0)}),
        uIStroke = createElement("UIStroke", {Thickness = 3, Color = Color3.new(1, 1, 1), Transparency = v1(0.86)}),
        gamepass = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://124682982561761",
            Position = UDim2.fromScale(0.0148503, 0.10304),
            ScaleType = Enum.ScaleType.Fit,
            ImageTransparency = a1.transparency,
            Size = UDim2.fromScale(0.0628036, 0.77551),
        }),
        textContainer = createElement("Frame", {
            BackgroundTransparency = 1,
            Position = UDim2.fromScale(0.0869176, 0.0395446),
            Size = UDim2.fromScale(0.591398, 0.918367),
        }, {
            uIListLayout = createElement("UIListLayout", {Padding = UDim.new(0.025, 0), SortOrder = Enum.SortOrder.LayoutOrder}),
            adTitle = createElement("TextLabel", {
                BackgroundTransparency = 1,
                Rotation = 90,
                Text = "VIP",
                TextSize = 32,
                TextScaled = true,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                Size = UDim2.fromScale(0.621539, 0.4375),
                TextColor3 = Color3.new(1, 1, 1),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextTransparency = a1.transparency,
            }, {
                iStroke = createElement("UIStroke", {Thickness = 3.2, Transparency = v1(0.74)}),
                iGradient = createElement("UIGradient", {
                    Rotation = 90,
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 238, 0)),
                        ColorSequenceKeypoint.new(0.508651, Color3.fromRGB(255, 210, 28)),
                        ColorSequenceKeypoint.new(0.513841, Color3.fromRGB(255, 192, 32)),
                        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 115, 0))),
                    }),
                }),
            }),
            tagLine = createElement("TextLabel", {
                BackgroundTransparency = 1,
                RichText = true,
                Text = "Earn <font color=\"#ffca2c\">2X</font> more XP by becoming a VIP",
                TextScaled = true,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Position = UDim2.fromScale(0, 0.38),
                Size = UDim2.fromScale(1, 0.34),
                TextColor3 = Color3.new(1, 1, 1),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextTransparency = a1.transparency,
            }),
            uIPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0.0151515, 0), PaddingTop = UDim.new(0.111111, 0)}),
        }),
        price = createElement(GlowButton, {
            Selectable = false,
            stroke = true,
            textScale = 1.2,
            AnchorPoint = Vector2.new(0.985000014, 0.5),
            color = Color3.fromRGB(80, 255, 86),
            ImageColor3 = Color3.fromRGB(89, 255, 186),
            Position = UDim2.fromScale(0.985, 0.5),
            ScaleType = Enum.ScaleType.Tile,
            Size = UDim2.fromScale(0.163082, 0.602041),
            text = ("%* "):format(a1.vipPrice),
            transparency = a1.transparency,
            clicked = function() -- Line: 125 -- upvalues: a1 (val)
                if a1.vipClicked then
                    a1.vipClicked()
                end
            end,
        }),
    })
end)