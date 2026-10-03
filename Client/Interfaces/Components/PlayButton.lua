-- Script path: ReplicatedStorage.Client.Interfaces.Components.PlayButton
-- Decompile time: 4.05 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local useBinding = React.useBinding
local Event = React.Event
return function(a1) -- Line: 26
    -- upvalues: useBinding (val), useScale (val), useSound (val), useSpring (val), createElement (val), Event (val)
    local Clicked = a1.Clicked
    if not Clicked then
        function Clicked() end
    end
    local u6 = a1.Disabled == true
    local u9, u10 = useBinding(false)
    local u13, u14 = useBinding(false)
    local u17 = useScale(1)
    local Click = useSound("Click")
    local v1, u27 = useSpring(1, 0.6, 40, true)
    local v2, u34 = useSpring(1, 1, 9, true)
    local v3 = {
        Text = "",
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        LayoutOrder = a1.LayoutOrder,
        Selectable = false,
    }
    local Size = a1.Size or UDim2.fromScale(1, 1)
    v3.Size = Size
    v3.AnchorPoint = a1.AnchorPoint
    v3.Position = a1.Position

    v3[Event.MouseButton1Down] = function() -- Line: 50 -- upvalues: u27 (val), u17 (val), u14 (val)
        u27(1 - 0.1 * u17)
        u14(true)
    end

    v3[Event.MouseButton1Up] = function() -- Line: 56
        -- upvalues: u13 (val), u27 (val), u9 (val), u17 (val), u14 (val), Click (val), u6 (val), Clicked (val)
        local v1 = u13:getValue()
        u27(u9:getValue() and 1 + 0.1 * u17 or 1)
        u14(false)
        Click()
        if not u6 and v1 then
            Clicked()
        end
    end

    v3[Event.MouseEnter] = function() -- Line: 68 -- upvalues: u27 (val), u17 (val), u34 (val), u10 (val)
        u27(1 + 0.1 * u17)
        u34(0)
        u10(true)
    end

    v3[Event.MouseLeave] = function() -- Line: 74 -- upvalues: u27 (val), u34 (val), u10 (val)
        u27(1)
        u34(1)
        u10(false)
    end

    return createElement("TextButton", v3, {
        aspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 3}),
        glow = createElement("ImageLabel", {
            Image = "rbxassetid://5948620849",
            BackgroundTransparency = 1,
            ZIndex = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            ImageColor3 = Color3.fromRGB(15, 250, 54),
            ImageTransparency = v2,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(2.5, 2.5),
        }, {}),
        content = createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        }, {
            scale = createElement("UIScale", {Scale = v1}),
            icon = createElement("ImageLabel", {
                Image = "rbxassetid://6319111989",
                BackgroundTransparency = 1,
                ScaleType = Enum.ScaleType.Fit,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(27, 42, 53),
                Position = UDim2.fromScale(0.2, 0.475),
                Size = UDim2.fromScale(0.4, 0.8),
            }, {uIAspectRatioConstraint = createElement("UIAspectRatioConstraint")}),
            layout = createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
            padding = createElement("UIPadding", {PaddingBottom = UDim.new(0, 3)}),
            uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 15)}),
            uIStroke = createElement("UIStroke", {
                Thickness = 2,
                Transparency = 0.2,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                Color = Color3.fromRGB(40, 120, 0),
            }),
            uIGradient = createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(235, 255, 143)),
                    ColorSequenceKeypoint.new(0.19, Color3.fromRGB(33, 255, 103)),
                    ColorSequenceKeypoint.new(0.401, Color3.fromRGB(17, 251, 60)),
                    ColorSequenceKeypoint.new(0.764, Color3.fromRGB(15, 250, 54)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 0))),
                }),
            }),
            textLabel = createElement("TextLabel", {
                TextScaled = true,
                TextSize = 14,
                TextWrapped = true,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                Text = a1.Text,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                AnchorPoint = Vector2.new(1, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(27, 42, 53),
                Position = UDim2.fromScale(0.9, 0.5),
                Size = UDim2.fromScale(0.55, 0.8),
            }, {uIStroke1 = createElement("UIStroke", {Thickness = 2, Transparency = 0.5})}),
        }),
        hint = createElement("Frame", {
            BackgroundTransparency = 1,
            Visible = false,
            ZIndex = 0,
            AnchorPoint = Vector2.new(0.5, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Position = UDim2.new(0.5, 0, 0, -16),
            Size = UDim2.fromOffset(40, 40),
        }, {
            arrow = createElement("ImageLabel", {
                Image = "http://www.roblox.com/asset/?id=6143968813",
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 1),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(27, 42, 53),
                Position = UDim2.fromScale(0.5, 1),
                Size = UDim2.fromOffset(16, 10),
            }),
            content1 = createElement("ImageLabel", {
                Image = "rbxassetid://2790389767",
                BackgroundTransparency = 1,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(8, 8, 248, 248),
                AnchorPoint = Vector2.new(0.5, 0),
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(27, 42, 53),
                Position = UDim2.fromScale(0.5, 0),
                Size = UDim2.new(1, 0, 1, -10),
            }, {
                textLabel1 = createElement("TextLabel", {
                    Text = "Click to join a match!",
                    TextSize = 14,
                    BackgroundTransparency = 1,
                    FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
                    TextColor3 = Color3.fromRGB(68, 68, 68),
                    AnchorPoint = Vector2.new(0, 0.5),
                    AutomaticSize = Enum.AutomaticSize.X,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderColor3 = Color3.fromRGB(27, 42, 53),
                    Position = UDim2.fromScale(0, 0.5),
                    Size = UDim2.fromScale(0.95, 0.85),
                }),
                uIPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5)}),
            }),
        }),
    })
end