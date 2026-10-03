-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.DisconnectionPenalty.RestrictedPopup
-- Decompile time: 5.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
require(ReplicatedStorage.Client.Interfaces.Game.Components.Radio.RadioCloseButton)
local GlowButton = require(ReplicatedStorage.Client.Interfaces.Components.GlowButton)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local useGroupAnimation = ReactFlow.useGroupAnimation
local useSequenceAnimation = ReactFlow.useSequenceAnimation
local useAnimation = ReactFlow.useAnimation
local Spring = ReactFlow.Spring
return function(a1) -- Line: 18
    -- upvalues: useGroupAnimation (val), useSequenceAnimation (val), Spring (val), useAnimation (val)
    -- upvalues: useReactBindings (val), React (val), GlowButton (val)
    local Visible = a1.Visible
    local OnClose = a1.OnClose
    local TimeLeft = a1.TimeLeft
    local v1, u177 = useGroupAnimation({
        enable = useSequenceAnimation({
            {
                timestamp = 0,
                framePosition = Spring({speed = 15, damper = 0.6, target = UDim2.new(0.5, 0, 0.5, 0)}),
                frameSize = Spring({speed = 30, damper = 0.4, target = UDim2.new(0.2, 200, 0.2, 200)}),
                rotation = Spring({target = 0, speed = 35, damper = 0.1}),
            },
            {
                timestamp = 0.1,
                warningSignSize = Spring({speed = 20, damper = 0.4, target = UDim2.fromScale(0.6, 0.6)}),
                warningSignRotation = Spring({target = 0, speed = 25, damper = 0.1}),
                warningSignTransparency = Spring({target = 0, speed = 15, damper = 1}),
            },
            {
                timestamp = 0.2,
                textFrameT1 = Spring({target = 0, speed = 25, damper = 1}),
                textFrameT2 = Spring({target = 0.9, speed = 25, damper = 1}),
                disclaimerFrameSize = Spring({speed = 20, damper = 0.5, target = UDim2.fromScale(0.7, 0.2)}),
            },
            {
                timestamp = 0.3,
                clockFrameSize = Spring({speed = 20, damper = 0.45, target = UDim2.new(0.175, 0, 0.12, 0)}),
            },
            {
                timestamp = 0.4,
                buttonSize = Spring({speed = 20, damper = 0.45, target = UDim2.new(0.3, 0, 0.15, 0)}),
            },
        }),
        disable = useAnimation({
            framePosition = Spring({speed = 14, damper = 0.5, target = UDim2.new(0.5, 0, 2, 0)}),
            frameSize = Spring({speed = 15, damper = 0.5, target = UDim2.new(1, 200, 1, 200)}),
            rotation = Spring({target = -45, speed = 25, damper = 0.3}),
            warningSignSize = Spring({speed = 15, damper = 0.5, target = UDim2.fromScale(2, 2)}),
            warningSignRotation = Spring({target = -90, speed = 20, damper = 0.4}),
            warningSignTransparency = Spring({target = 1, speed = 15, damper = 1}),
            textFrameT1 = Spring({target = 1, speed = 15, damper = 1}),
            textFrameT2 = Spring({target = 1, speed = 15, damper = 1}),
            disclaimerFrameSize = Spring({speed = 20, damper = 0.4, target = UDim2.fromScale(0, 0)}),
            clockFrameSize = Spring({speed = 25, damper = 0.3, target = UDim2.new(0, 0, 0, 0)}),
            buttonSize = Spring({speed = 15, damper = 0.4, target = UDim2.fromScale(0, 0)}),
        }),
    }, {
        rotation = -45,
        warningSignRotation = -90,
        warningSignTransparency = 1,
        textFrameT1 = 1,
        textFrameT2 = 1,
        framePosition = UDim2.new(0.5, 0, 2, 0),
        frameSize = UDim2.new(1, 200, 1, 200),
        warningSignSize = UDim2.fromScale(2, 2),
        clockFrameSize = UDim2.new(0, 0, 0, 0),
        buttonSize = UDim2.fromScale(0, 0),
        disclaimerFrameSize = UDim2.fromScale(0, 0),
    })
    local v2 = {Visible}
    useReactBindings(function(a1) -- Line: 167 -- upvalues: u177 (val)
        if a1 then
            u177("enable")
            return
        end
        u177("disable")
    end, v2)
    return React.createElement("Frame", {
        BackgroundTransparency = 0.25,
        BorderSizePixel = 0,
        Visible = a1.Visible,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v1.framePosition,
        Rotation = v1.rotation,
        Size = v1.frameSize,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    }, {
        UIAspectRatioConstraint = React.createElement("UIAspectRatioConstraint", {AspectRatio = 2}),
        UICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.05, 0)}),
        UIStroke = React.createElement("UIStroke", {Thickness = 3, Transparency = 0.75, Color = Color3.fromRGB(255, 255, 255)}),
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
        WarningSign = React.createElement("ImageLabel", {
            Image = "rbxassetid://130313514632637",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, -0.3),
            Position = UDim2.new(0.5, 0, -0.25, 0),
            Size = v1.warningSignSize,
            Rotation = v1.warningSignRotation,
            ImageTransparency = v1.warningSignTransparency,
        }, {
            UIAspectRatioConstraint = React.createElement("UIAspectRatioConstraint", {AspectRatio = 1}),
        }),
        TopStripe = React.createElement("ImageLabel", {
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
        DisclaimerFrame = React.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.5, 0, 0.4, 0),
            Size = v1.disclaimerFrameSize,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = v1.textFrameT2,
        }, {
            UICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.15, 0)}),
            DisclaimerText = React.createElement("TextLabel", {
                TextScaled = true,
                RichText = true,
                Text = "You are currently <i>restricted</i> from matchmaking for leaving the match!",
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                Size = UDim2.fromScale(0.94, 0.675),
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextTransparency = v1.textFrameT1,
                TextYAlignment = Enum.TextYAlignment.Center,
                TextXAlignment = Enum.TextXAlignment.Center,
            }),
        }),
        TimerFrame = React.createElement("Frame", {
            BackgroundTransparency = 0.8,
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.new(0.5, 0, 0.575, 0),
            Size = v1.clockFrameSize,
            BackgroundColor3 = Color3.fromRGB(255, 74, 74),
        }, {
            UICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.1, 0)}),
            UIStroke = React.createElement("UIStroke", {Thickness = 2, Transparency = 0.5, Color = Color3.fromRGB(255, 74, 74)}),
            TimerText = React.createElement("TextLabel", {
                TextScaled = true,
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.45, 0),
                Size = UDim2.fromScale(1, 0.8),
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
                TextColor3 = Color3.fromRGB(255, 74, 74),
                Text = TimeLeft:map(function(a1) -- Line: 315
                    if a1 < 0 then
                        a1 = 0
                    end
                    return string.format("%02d:%02d", math.floor(a1 / 60), a1 % 60)
                end),
                TextYAlignment = Enum.TextYAlignment.Center,
                TextXAlignment = Enum.TextXAlignment.Center,
            }),
        }),
        DismissButton = React.createElement(GlowButton, {
            LayoutOrder = 1,
            text = "I Understand",
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.new(0.5, 0, 0.93, 0),
            Size = v1.buttonSize,
            textColor = Color3.fromRGB(255, 255, 255),
            color = Color3.fromRGB(255, 43, 43),
            clicked = OnClose,
        }),
    })
end