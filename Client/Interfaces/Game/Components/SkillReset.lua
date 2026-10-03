-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.SkillReset
-- Decompile time: 5.89 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Comma = require(ReplicatedStorage.Shared.UI.Comma)
local GlowButton = require(ReplicatedStorage.Client.Interfaces.Components.GlowButton)
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useSequenceAnimation = ReactFlow.useSequenceAnimation
local useGroupAnimation = ReactFlow.useGroupAnimation
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local useAnimation = ReactFlow.useAnimation
local Spring = ReactFlow.Spring
local u45 = Color3.fromRGB(255, 42, 42)
local u50 = Color3.fromRGB(255, 243, 68)
return function(a1) -- Line: 18
    -- upvalues: useGroupAnimation (val), useSequenceAnimation (val), Spring (val), useAnimation (val)
    -- upvalues: useReactBindings (val), React (val), Icons (val), Comma (val), GlowButton (val), u45 (val), u50 (val)
    local Visible = a1.Visible
    local ExitCallback = a1.ExitCallback
    local PurchaseCallback = a1.PurchaseCallback
    local refundCost = a1.refundCost
    local refundSkillPoints = a1.refundSkillPoints
    local v1, u207 = useGroupAnimation({
        enable = useSequenceAnimation({
            {
                timestamp = 0,
                backgroundPosition = Spring({speed = 9, damper = 0.55, target = UDim2.fromScale(0.5, 0.5)}),
                backgroundSize = Spring({speed = 10, damper = 0.45, target = UDim2.new(0.4, 150, 0.15, 150)}),
                rotation = Spring({target = 0, speed = 12, damper = 0.5}),
                backgroundTransparency = Spring({target = 0.1, speed = 12, damper = 1}),
            },
            {
                timestamp = 0.01,
                titlePosition = Spring({speed = 11, damper = 0.5, target = UDim2.fromScale(0, 0.065)}),
                titleTransparency = Spring({target = 0, speed = 10, damper = 1}),
            },
            {
                timestamp = 0.1,
                imagePosition = Spring({speed = 11, damper = 0.5, target = UDim2.fromScale(0.49, 0.4)}),
                imageTransparency = Spring({target = 0, speed = 10, damper = 1}),
            },
            {
                timestamp = 0.2,
                costPosition = Spring({speed = 12, damper = 0.5, target = UDim2.fromScale(0.5, 0.695)}),
                costTransparency = Spring({target = 0, speed = 10, damper = 1}),
                returnPosition = Spring({speed = 11, damper = 0.55, target = UDim2.fromScale(0.5, 0.805)}),
                returnTransparency = Spring({target = 0, speed = 10, damper = 1}),
            },
            {
                timestamp = 0.275,
                buttonsPosition = Spring({speed = 11, damper = 0.4, target = UDim2.fromScale(0.5, 0.94)}),
                buttonsSize = Spring({speed = 12, damper = 0.45, target = UDim2.fromScale(0.8, 0.11)}),
            },
        }),
        disable = useAnimation({
            backgroundPosition = Spring({speed = 12, target = UDim2.fromScale(0.5, 0.75)}),
            backgroundSize = Spring({speed = 12, target = UDim2.new(0, 0, 0, 0)}),
            rotation = Spring({target = 0, speed = 10}),
            titlePosition = Spring({speed = 13, damper = 0.6, target = UDim2.fromScale(0, 1)}),
            titleTransparency = Spring({target = 1, speed = 12, damper = 1}),
            imagePosition = Spring({speed = 12, damper = 0.6, target = UDim2.fromScale(0.49, 1)}),
            imageTransparency = Spring({target = 1, speed = 12, damper = 1}),
            costPosition = Spring({speed = 11, damper = 0.5, target = UDim2.fromScale(0.5, 1)}),
            costTransparency = Spring({target = 1, speed = 12, damper = 1}),
            returnPosition = Spring({speed = 11, damper = 0.5, target = UDim2.fromScale(0.5, 1.2)}),
            returnTransparency = Spring({target = 1, speed = 12, damper = 1}),
            backgroundTransparency = Spring({target = 1, speed = 12, damper = 1}),
            buttonsSize = Spring({speed = 11, damper = 0.25, target = UDim2.fromScale(0, 0)}),
            buttonsPosition = Spring({speed = 11, damper = 0.4, target = UDim2.fromScale(0.5, 1.1)}),
        }),
    }, {
        rotation = 0,
        titleTransparency = 1,
        imageTransparency = 1,
        costTransparency = 1,
        returnTransparency = 1,
        backgroundTransparency = 1,
        backgroundPosition = UDim2.fromScale(0.5, 0.75),
        backgroundSize = UDim2.new(0, 0, 0, 0),
        titlePosition = UDim2.fromScale(0, 1),
        imagePosition = UDim2.fromScale(0.49, 1),
        costPosition = UDim2.fromScale(0.5, 1),
        returnPosition = UDim2.fromScale(0.5, 1.2),
        buttonsPosition = UDim2.fromScale(0.5, 1.1),
        buttonsSize = UDim2.fromScale(0, 0),
    })
    local v2 = {Visible}
    useReactBindings(function(a1) -- Line: 197 -- upvalues: u207 (val)
        if a1 then
            u207("enable")
            return
        end
        u207("disable")
    end, v2)
    return React.createElement("Frame", {
        ZIndex = 1000,
        Size = UDim2.fromScale(1, 2),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = v1.backgroundTransparency,
        Visible = Visible,
    }, {
        PromptBackground = React.createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundTransparency = 0.1,
            ZIndex = 100,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = v1.backgroundPosition,
            Size = v1.backgroundSize,
            BackgroundColor3 = Color3.fromRGB(25, 25, 25),
            Rotation = v1.rotation,
        }, {
            UIAspectRatio = React.createElement("UIAspectRatioConstraint", {AspectRatio = 0.875, AspectType = Enum.AspectType.FitWithinMaxSize}),
            UIStroke = React.createElement("UIStroke", {
                Thickness = 2,
                Transparency = 0.8,
                Color = Color3.fromRGB(255, 255, 255),
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                LineJoinMode = Enum.LineJoinMode.Round,
            }),
            UICornerRadius = React.createElement("UICorner", {CornerRadius = UDim.new(0.02, 0)}),
            Title = React.createElement("TextLabel", {
                Text = "Reset Skills?",
                TextScaled = true,
                BackgroundTransparency = 1,
                ZIndex = 1,
                Size = UDim2.fromScale(1, 0.09),
                Position = v1.titlePosition,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextTransparency = v1.titleTransparency,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            }),
            SkillImage = React.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                ZIndex = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.fromScale(0.7, 0.45),
                Position = v1.imagePosition,
                ImageTransparency = v1.imageTransparency,
                Image = Icons.Skills,
            }),
            Cost = React.createElement("TextLabel", {
                TextScaled = true,
                RichText = true,
                BackgroundTransparency = 1,
                ZIndex = 1,
                AnchorPoint = Vector2.new(0.5, 1),
                Size = UDim2.fromScale(0.8, 0.045),
                Position = v1.costPosition,
                TextTransparency = v1.costTransparency,
                Text = ("This will cost you <font color = \"#FFF344\">%*</font> coins!"):format((Comma((math.floor(refundCost))))),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            }),
            Return = React.createElement("TextLabel", {
                TextScaled = true,
                RichText = true,
                BackgroundTransparency = 1,
                ZIndex = 1,
                AnchorPoint = Vector2.new(0.5, 1),
                Size = UDim2.fromScale(0.675, 0.09),
                Position = v1.returnPosition,
                TextTransparency = v1.returnTransparency,
                Text = ("You will receive <font color = \"#4dff44\">%*</font> skill credits back"):format((Comma((math.floor(refundSkillPoints))))),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                TextYAlignment = Enum.TextYAlignment.Top,
            }),
            ButtonFrame = React.createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 100,
                AnchorPoint = Vector2.new(0.5, 1),
                Position = v1.buttonsPosition,
                Size = v1.buttonsSize,
            }, {
                UIListLayout = React.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0.1, 0),
                }),
                Purchase = React.createElement(GlowButton, {
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0.35, 0.7),
                    AnchorPoint = Vector2.new(0.5, 1),
                    Position = UDim2.fromScale(0.5, 0.95),
                    color = u45,
                    textColor = u50,
                    text = ("%*"):format((Comma(refundCost))),
                    icon = Icons.Coins,
                    clicked = PurchaseCallback,
                }),
                Exit = React.createElement(GlowButton, {
                    LayoutOrder = 2,
                    text = "Exit",
                    Size = UDim2.fromScale(0.35, 0.7),
                    AnchorPoint = Vector2.new(0.5, 1),
                    Position = UDim2.fromScale(0.5, 0.95),
                    clicked = ExitCallback,
                    textColor = Color3.fromRGB(50, 50, 50),
                }),
            }),
        }),
    })
end