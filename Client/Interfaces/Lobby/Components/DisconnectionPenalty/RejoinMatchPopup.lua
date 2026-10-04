-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.DisconnectionPenalty.RejoinMatchPopup
-- Decompile time: 14.10 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GlowButton = require(ReplicatedStorage.Client.Interfaces.Components.GlowButton)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local useGroupAnimation = ReactFlow.useGroupAnimation
local useSequenceAnimation = ReactFlow.useSequenceAnimation
local useAnimation = ReactFlow.useAnimation
local useSpring = ReactFlow.useSpring
local Spring = ReactFlow.Spring
return function(a1) -- Line: 16
    -- upvalues: useSpring (val), useGroupAnimation (val), useSequenceAnimation (val), Spring (val), useAnimation (val)
    -- upvalues: useReactBindings (val), React (val), GlowButton (val)
    local Visible = a1.Visible
    local OnClose = a1.OnClose
    local OnRejoin = a1.OnRejoin
    local Offset = a1.Offset
    local v1, u11 = useSpring({damper = 0.5, speed = 15, target = 0, start = Offset:getValue()})
    local v2, u142 = useGroupAnimation({
        enable = useSequenceAnimation({
            {
                timestamp = 0,
                framePosition = Spring({speed = 20, damper = 0.4, target = UDim2.new(0.5, 0, 0.5, 0)}),
                frameSize = Spring({speed = 15, damper = 0.4, target = UDim2.new(0.15, 200, 0.15, 200)}),
                rotation = Spring({target = 0, speed = 25, damper = 0.25}),
            },
            {
                timestamp = 0.1,
                disclaimer1Size = Spring({speed = 20, damper = 0.4, target = UDim2.new(0.875, 0, 0.18, 0)}),
            },
            {
                timestamp = 0.2,
                disclaimer2Size = Spring({speed = 20, damper = 0.4, target = UDim2.new(0.75, 0, 0.25, 0)}),
            },
            {
                timestamp = 0.3,
                buttonSize = Spring({speed = 20, damper = 0.4, target = UDim2.fromScale(0.475, 1)}),
            },
        }),
        disable = useAnimation({
            framePosition = Spring({speed = 14, damper = 0.5, target = UDim2.new(0.5, 0, 0.75, 0)}),
            frameSize = Spring({speed = 15, damper = 0.5, target = UDim2.new(0, 50, 0, 50)}),
            rotation = Spring({target = 0, speed = 25, damper = 0.3}),
            disclaimer2Size = Spring({speed = 20, damper = 0.4, target = UDim2.new(0, 0, 0, 0)}),
            disclaimer1Size = Spring({speed = 20, damper = 0.4, target = UDim2.new(0, 0, 0, 0)}),
            buttonSize = Spring({speed = 15, damper = 0.4, target = UDim2.fromScale(0, 0)}),
        }),
    }, {
        rotation = 0,
        framePosition = UDim2.new(0.5, 0, 0.75, 0),
        frameSize = UDim2.new(0, 50, 0, 50),
        disclaimer1Size = UDim2.fromScale(0, 0),
        disclaimer2Size = UDim2.fromScale(0, 0),
        buttonSize = UDim2.fromScale(0, 0),
    })
    local v3 = {Visible}
    useReactBindings(function(a1) -- Line: 115 -- upvalues: u142 (val)
        if a1 then
            u142("enable")
            return
        end
        u142("disable")
    end, v3)
    v3 = {Offset}
    useReactBindings(function(a1) -- Line: 123 -- upvalues: u11 (val)
        u11({target = a1})
    end, v3)
    return React.createElement("Frame", {
        BackgroundTransparency = 0.25,
        BorderSizePixel = 0,
        Visible = a1.Visible,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v2.framePosition,
        Size = v2.frameSize,
        Rotation = v2.rotation,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    }, {
        UIAspectRatioConstraint = React.createElement("UIAspectRatioConstraint", {AspectRatio = 2}),
        UICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.05, 0)}),
        UIStroke = React.createElement("UIStroke", {Thickness = 2, Transparency = 0.75, Color = Color3.fromRGB(255, 255, 255)}),
        Stripe = React.createElement("ImageLabel", {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Image = "rbxassetid://135054013494272",
            ImageTransparency = 0.8,
            ZIndex = 0,
            Size = UDim2.new(1, 0, 0.1, 0),
        }, {
            UIGradient = React.createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.5, 0),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
        }),
        BottomStripe = React.createElement("ImageLabel", {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Rotation = 180,
            Image = "rbxassetid://135054013494272",
            ImageTransparency = 0.8,
            ZIndex = 0,
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.new(0.5, 0, 1, 0),
            Size = UDim2.new(1, 0, 0.1, 0),
        }, {
            UIGradient = React.createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.5, 0),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
        }),
        DropShadow = React.createElement("ImageLabel", {
            Image = "rbxassetid://129907606498721",
            ImageTransparency = 0.5,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            Size = UDim2.fromScale(1.25, 1.245),
            ImageColor3 = Color3.fromRGB(0, 0, 0),
        }, {
            UIAspectRatioConstraint = React.createElement("UIAspectRatioConstraint", {AspectRatio = 2}),
        }),
        FillFrame = React.createElement("Frame", {
            BackgroundTransparency = 0.85,
            BorderSizePixel = 0,
            ZIndex = -1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(255, 0, 0),
        }, {
            UICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.05, 0)}),
            UIGradient = React.createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0),
                    NumberSequenceKeypoint.new(0.49, 0),
                    NumberSequenceKeypoint.new(0.5, 1),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
                Offset = v1:map(function(a1) -- Line: 216
                    return Vector2.new(a1, 0)
                end),
            }),
        }),
        ButtonsFrame = React.createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, 0.85),
            Size = UDim2.new(0.775, 0, 0.175, 0),
        }, {
            UIListLayout = React.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                Padding = UDim.new(0.12, 0),
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            RejoinButton = React.createElement(GlowButton, {
                LayoutOrder = 1,
                text = "Rejoin",
                AnchorPoint = Vector2.new(0.5, 1),
                Position = UDim2.new(0.5, 0, 1, 0),
                Size = v2.buttonSize,
                textColor = Color3.fromRGB(255, 255, 255),
                color = Color3.fromRGB(43, 255, 149),
                clicked = OnRejoin,
            }),
            PenalizeButton = React.createElement(GlowButton, {
                LayoutOrder = 2,
                text = "Dismiss",
                AnchorPoint = Vector2.new(0.5, 1),
                Position = UDim2.new(0.5, 0, 1, 0),
                Size = v2.buttonSize,
                textColor = Color3.fromRGB(255, 255, 255),
                color = Color3.fromRGB(255, 43, 43),
                clicked = OnClose,
            }),
        }),
        DisclaimerFrame = React.createElement("Frame", {
            BackgroundTransparency = 0.9,
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.new(0.5, 0, 0.145, 0),
            Size = v2.disclaimer1Size,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        }, {
            UICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.15, 0)}),
            DisclaimerText = React.createElement("TextLabel", {
                TextScaled = true,
                Text = "Your last match is still in progress!",
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                Size = UDim2.fromScale(0.95, 0.565),
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextYAlignment = Enum.TextYAlignment.Center,
                TextXAlignment = Enum.TextXAlignment.Center,
            }),
        }),
        DisclaimerFrame2 = React.createElement("Frame", {
            BackgroundTransparency = 0.75,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.new(0.5, 0, 0.37, 0),
            Size = v2.disclaimer2Size,
            BackgroundColor3 = Color3.fromRGB(255, 74, 74),
        }, {
            UIGradient = React.createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.5, 0),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
            DisclaimerText = React.createElement("TextLabel", {
                TextScaled = true,
                RichText = true,
                Text = "Not rejoining will result in a <u>penalty</u>!",
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                Size = UDim2.fromScale(0.6, 0.8),
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Italic),
                TextColor3 = Color3.fromRGB(255, 74, 74),
                TextYAlignment = Enum.TextYAlignment.Center,
                TextXAlignment = Enum.TextXAlignment.Center,
            }),
        }),
    })
end