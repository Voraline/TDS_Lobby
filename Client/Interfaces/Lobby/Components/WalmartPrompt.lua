-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.WalmartPrompt
-- Decompile time: 6.67 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local RadioCloseButton = require(ReplicatedStorage.Client.Interfaces.Game.Components.Radio.RadioCloseButton)
local GlowButton = require(ReplicatedStorage.Client.Interfaces.Components.GlowButton)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local useGroupAnimation = ReactFlow.useGroupAnimation
local useSequenceAnimation = ReactFlow.useSequenceAnimation
local useAnimation = ReactFlow.useAnimation
local Spring = ReactFlow.Spring
return function(a1) -- Line: 25
    -- upvalues: useGroupAnimation (val), useSequenceAnimation (val), Spring (val), useAnimation (val)
    -- upvalues: useReactBindings (val), React (val), GlowButton (val), RadioCloseButton (val)
    local Visible = a1.Visible
    local v1, u168 = useGroupAnimation({
        enable = useSequenceAnimation({
            {
                timestamp = 0,
                backgroundPosition = Spring({speed = 14, damper = 0.5, target = UDim2.new(0.5, 0, 0.5, 0)}),
                backgroundSize = Spring({speed = 13, damper = 0.475, target = UDim2.new(1, 0, 1, 0)}),
                backgroundRotation = Spring({target = 0, speed = 13, damper = 0.475}),
            },
            {
                timestamp = 0.05,
                passImagePosition = Spring({speed = 12, damper = 0.5, target = UDim2.fromScale(0, 0.256)}),
                perkImagePosition = Spring({speed = 13, damper = 0.5, target = UDim2.fromScale(0.733, 0.232)}),
                purchaseButtonPosition = Spring({speed = 10, damper = 0.475, target = UDim2.fromScale(0.178, 0.579)}),
            },
            {
                timestamp = 0.1,
                passLogoPosition = Spring({speed = 11, damper = 0.5, target = UDim2.fromScale(0.5, -0.05)}),
            },
            {timestamp = 0.2, perkTextTransparency = Spring({target = 0, speed = 15})},
            {timestamp = 0.3, descriptionTextTransparency = Spring({target = 0, speed = 10})},
            {
                timestamp = 0.5,
                scrollingFrameTransparency = Spring({target = 0.9, speed = 5}),
                disclaimerTextTransparency = Spring({target = 0, speed = 5}),
            },
        }),
        disable = useAnimation({
            backgroundPosition = Spring({speed = 14, target = UDim2.new(0.5, 0, 0.75, 0)}),
            backgroundSize = Spring({speed = 14, target = UDim2.new(0, 0, 0, 0)}),
            backgroundRotation = Spring({target = 25, speed = 13}),
            passLogoPosition = Spring({speed = 12, target = UDim2.fromScale(0.5, 0.75)}),
            passImagePosition = Spring({speed = 12, target = UDim2.fromScale(0, 0.75)}),
            perkImagePosition = Spring({speed = 13, target = UDim2.fromScale(0.733, 0.75)}),
            scrollingFrameTransparency = Spring({target = 1, speed = 10}),
            descriptionTextTransparency = Spring({target = 1, speed = 10}),
            perkTextTransparency = Spring({target = 1, speed = 10}),
            disclaimerTextTransparency = Spring({target = 1, speed = 10}),
            purchaseButtonPosition = Spring({speed = 12, target = UDim2.fromScale(0.178, 1)}),
        }),
    }, {
        backgroundRotation = 25,
        descriptionTextTransparency = 1,
        scrollingFrameTransparency = 1,
        perkTextTransparency = 1,
        disclaimerTextTransparency = 1,
        backgroundPosition = UDim2.new(0.75, 0, 0.75, 0),
        backgroundSize = UDim2.new(0, 0, 0, 0),
        passLogoPosition = UDim2.fromScale(0.5, 0.1),
        passImagePosition = UDim2.fromScale(0.5, 0.6),
        perkImagePosition = UDim2.fromScale(0.733, 0.45),
        purchaseButtonPosition = UDim2.fromScale(0.178, 1),
    })
    local v2 = {Visible}
    useReactBindings(function(a1) -- Line: 162 -- upvalues: u168 (val)
        if a1 then
            u168("enable")
            return
        end
        u168("disable")
    end, v2)
    return React.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Visible = a1.Visible,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0.5, 50, 0.5, 50),
    }, {
        ContainerFrame = React.createElement("Frame", {
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            Visible = a1.Visible,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = v1.backgroundPosition,
            Size = v1.backgroundSize,
            BackgroundColor3 = Color3.fromRGB(93, 108, 236),
            Rotation = v1.backgroundRotation,
        }, {
            UICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.02, 0)}),
        }, {
            UIStroke = React.createElement("UIStroke", {
                Thickness = 4,
                Transparency = 0,
                Color = Color3.fromRGB(255, 255, 255),
                ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
            }, {
                UIGradient = React.createElement("UIGradient", {
                    Rotation = 90,
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(224, 222, 255)),
                        (ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 55, 255))),
                    }),
                }),
            }),
        }, {
            DiscoveredPassLogo = React.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "http://www.roblox.com/asset/?id=108409633085759",
                ZIndex = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = v1.passLogoPosition,
                Size = UDim2.fromScale(0.826, 0.211),
                ScaleType = Enum.ScaleType.Fit,
            }),
        }, {
            DiscoveredPassImage = React.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "http://www.roblox.com/asset/?id=101272047083800",
                ZIndex = 1,
                AnchorPoint = Vector2.new(0, 0),
                Position = v1.passImagePosition,
                Size = UDim2.fromScale(0.565, 0.459),
                ScaleType = Enum.ScaleType.Fit,
            }),
        }, {
            PerkImage = React.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "rbxassetid://103415189994638",
                ZIndex = 1,
                AnchorPoint = Vector2.new(0.5, 0),
                Position = v1.perkImagePosition,
                Size = UDim2.fromScale(0.345, 0.47),
                ScaleType = Enum.ScaleType.Fit,
            }, {AspectRatio = React.createElement("UIAspectRatioConstraint", {AspectRatio = 1})}, {
                UIGradient = React.createElement("UIGradient", {
                    Rotation = 90,
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0),
                        NumberSequenceKeypoint.new(0.396, 0),
                        NumberSequenceKeypoint.new(0.667, 0.581),
                        (NumberSequenceKeypoint.new(1, 1)),
                    }),
                }),
            }),
        }, {
            PerkText = React.createElement("TextLabel", {
                BackgroundTransparency = 1,
                Text = "Unlock The Discovered Farm Skin",
                TextScaled = true,
                TextWrapped = true,
                ZIndex = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.732, 0.684),
                Size = UDim2.fromScale(0.385, 0.164),
                FontFace = Font.fromId(11702779517, Enum.FontWeight.Bold),
                TextColor3 = Color3.fromRGB(44, 90, 237),
                TextTransparency = v1.perkTextTransparency,
            }, {
                UIStroke = React.createElement("UIStroke", {
                    Thickness = 2,
                    Color = Color3.fromRGB(255, 255, 255),
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                    Transparency = v1.perkTextTransparency,
                }),
            }),
        }, {
            DescriptionText = React.createElement("TextLabel", {
                BackgroundTransparency = 1,
                Text = "The Walmart Discovered Pass unlocks exclusive perks in games like Jailbreak & more!",
                TextScaled = true,
                TextWrapped = true,
                ZIndex = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.141),
                Size = UDim2.fromScale(0.85, 0.135),
                FontFace = Font.fromId(11702779517, Enum.FontWeight.SemiBold),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextTransparency = v1.descriptionTextTransparency,
            }),
        }, {
            GlowButton = not a1.hasGamepass and React.createElement(GlowButton, {
                text = "199",
                AnchorPoint = Vector2.new(0, 0),
                Position = v1.purchaseButtonPosition,
                Size = UDim2.fromScale(0.205, 0.135),
                clicked = a1.onPurchase,
                color = Color3.fromRGB(255, 208, 69),
            }),
        }, {
            CloseButton = React.createElement(RadioCloseButton, {
                AnchorPoint = Vector2.new(1, 0),
                Position = UDim2.fromScale(1.029, -0.051),
                onActivated = a1.onClose,
            }),
        }),
    }, {
        ScrollingFrame = React.createElement("ScrollingFrame", {
            BorderSizePixel = 0,
            ZIndex = 1,
            ScrollBarThickness = 5,
            ScrollingEnabled = true,
            BottomImage = "",
            TopImage = "",
            BackgroundColor3 = Color3.fromRGB(),
            BackgroundTransparency = v1.scrollingFrameTransparency,
            Position = UDim2.fromScale(0.039, 0.801),
            Size = UDim2.fromScale(0.922, 0.165),
            AutomaticCanvasSize = Enum.AutomaticSize.None,
            CanvasPosition = Vector2.new(0, 0),
            CanvasSize = UDim2.fromScale(0, 0.6),
            ElasticBehavior = Enum.ElasticBehavior.Never,
            ScrollingDirection = Enum.ScrollingDirection.Y,
        }, {
            UICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.05, 0)}),
        }, {
            UIPadding = React.createElement("UIPadding", {
                PaddingLeft = UDim.new(0.05, 0),
                PaddingRight = UDim.new(0.05, 0),
                PaddingTop = UDim.new(0.05, 0),
                PaddingBottom = UDim.new(0.05, 0),
            }),
        }, {
            DisclaimerText = React.createElement("TextLabel", {
                BackgroundTransparency = 1,
                Text = "Walmart Discovered Pass (\"WDP\") is a Roblox pass that provides benefits (also called perks) in select Roblox games. By purchasing WDP, you acknowledge that it will only give you a limited license to the virtual pass as detailed in the Roblox Terms of Use (roblox.com/info/terms), subject to the additional restrictions below. \n\nPurchasing a WDP will provide you with the benefits listed on the WDP purchase screen in Walmart Discovered (click on the game to see the benefits for that game). Benefits may change at any time. \nAdditional benefits may be added in the future and will be listed on the WDP purchase screen. \n\nAny additional benefit added to WDP may be provided to you as a free bonus benefit. WALMART IS NOT OBLIGATED TO ADD ANY ADDITIONAL BENEFITS TO WDP. The addition of benefit(s) in the future does not guarantee that benefits) will continue to be added. WALMART MAY DISCONTINUE WDP AT ANY TIME, IN PART OR IN WHOLE, FOR ANY REASON, AND WITHOUT NOTICE.",
                TextScaled = true,
                Position = UDim2.fromScale(0, 0),
                Size = UDim2.fromScale(1, 1),
                FontFace = Font.fromId(11702779517, Enum.FontWeight.Medium),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextTransparency = v1.disclaimerTextTransparency,
            }),
        }),
    }, {
        AspectRatio = React.createElement("UIAspectRatioConstraint", {AspectRatio = 1.4065934065934067}),
    })
end