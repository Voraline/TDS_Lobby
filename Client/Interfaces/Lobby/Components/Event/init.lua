-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Event
-- Decompile time: 4.63 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Button = require(ReplicatedStorage.Client.Interfaces.Components.Button)
local EventRewards = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Event.EventRewards)
local EventThumbnail = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Event.EventThumbnail)
local Header = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Header)
local React = require(ReplicatedStorage.Shared.UI.React)
local TopBanner = require(ReplicatedStorage.Client.Interfaces.Universal.Components.TopBanner)
local createElement = React.createElement
return function(a1) -- Line: 34
    -- upvalues: createElement (val), TopBanner (val), Header (val), EventRewards (val), Button (val)
    -- upvalues: EventThumbnail (val)
    return createElement("Frame", {
        BackgroundTransparency = 0.3,
        Visible = a1.Visible,
        AnchorPoint = a1.AnchorPoint,
        Size = a1.Size,
        Position = a1.Position,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    }, {
        uicorner = createElement("UICorner", {CornerRadius = UDim.new(0, 8)}),
        uiscale = createElement("UIScale", {Scale = a1.Scale or 1}),
        topbanner = createElement(TopBanner, {
            SmallTitle = "New Objective",
            RemoveGradient = true,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 100),
            Title = a1.Title,
        }, {
            icon = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "rbxassetid://16747403746",
                ZIndex = 0,
                Size = UDim2.fromScale(1, 1),
                ScaleType = Enum.ScaleType.Crop,
            }, {
                uigradient = createElement("UIGradient", {
                    Rotation = -90,
                    Color = ColorSequence.new(Color3.fromRGB(255, 255, 255)),
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0.719),
                        NumberSequenceKeypoint.new(0.249, 0.781),
                        (NumberSequenceKeypoint.new(1, 1)),
                    }),
                }),
            }),
        }),
        createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(1, 0),
            Size = UDim2.new(0, 550, 1, -100),
            Position = UDim2.new(1, 0, 0, 100),
        }, {
            objectiveheader = createElement(Header, {
                Title = "Objective",
                TitleIcon = "rbxassetid://16380994239",
                TextSize = 22,
                Position = UDim2.fromOffset(48, 20),
                Size = UDim2.new(0.5, 0, 0, 32),
            }),
            createElement("TextLabel", {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0),
                Position = UDim2.new(0.5, 0, 0, 70),
                Size = UDim2.new(1, -64, 0, 64),
                Text = a1.EventObjective,
                TextColor3 = Color3.fromRGB(213, 213, 213),
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
            }, {(createElement("UITextSizeConstraint", {MaxTextSize = 20}))}),
            rewardheader = createElement(Header, {
                Title = "Unlocks",
                TitleIcon = "rbxassetid://16381447184",
                TextSize = 24,
                Position = UDim2.fromOffset(48, 130),
                Size = UDim2.new(0.5, 0, 0, 32),
            }),
            eventrewards = createElement(EventRewards, {
                Size = UDim2.fromOffset(128, 80),
                Position = UDim2.new(0.5, 0, 0, 255),
                AnchorPoint = Vector2.new(0.5, 0),
                Rewards = a1.Rewards,
            }),
            startbutton = createElement(Button, {
                Text = "Start",
                TextFontSize = 32,
                TextScaled = true,
                TextStrokeTransparency = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.fromOffset(160, 46),
                Position = UDim2.new(0.5, -100, 1, -48),
                Color = Color3.fromRGB(10, 220, 80),
                Clicked = a1.OnStartClicked,
            }),
            skipbutton = createElement(Button, {
                Text = "Skip",
                TextFontSize = 32,
                TextScaled = true,
                TextStrokeTransparency = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.fromOffset(160, 46),
                Position = UDim2.new(0.5, 100, 1, -48),
                Color = Color3.fromRGB(229, 40, 40),
                Clicked = a1.OnSkipClicked,
            }),
        }),
        thumbnail = createElement(EventThumbnail, {
            Size = UDim2.fromOffset(300, 400),
            Position = UDim2.new(0, 175, 0.5, 50),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = a1.EventThumbnail,
            Description = a1.EventDescription,
            SmallDescription = a1.EventSmallDescription,
        }),
    })
end