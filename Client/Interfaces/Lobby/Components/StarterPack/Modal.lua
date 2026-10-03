-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.StarterPack.Modal
-- Decompile time: 12.89 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Components = ReplicatedStorage.Client.Interfaces.Components
local React = require(ReplicatedStorage.Shared.UI.React)
local Button = require(Components.Button)
local IconButton = require(Components.IconButton)
local useMouse = require(Hooks.useMouse)
local useProductInfo = require(Hooks.useProductInfo)
local useReactBindings = require(Hooks.useReactBindings)
local useScale = require(Hooks.useScale)
local useSpring = require(Hooks.useSpring)
local useTween = require(Hooks.useTween)
local useViewportSize = require(Hooks.useViewportSize)

local function Reward(a1) -- Line: 24 -- upvalues: React (val)
    local v1 = "rbxassetid://" .. tostring(a1.Icon)
    local Description = a1.Description
    local GuiVisible = a1.GuiVisible
    return React.createElement("Frame", {
        BackgroundColor3 = Color3.fromRGB(124, 124, 124),
        BackgroundTransparency = GuiVisible:map(function(a1) -- Line: 30
            return 0.8 + 0.2 * a1
        end),
        Size = UDim2.fromOffset(128, 144),
    }, {
        React.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Transparency = GuiVisible:map(function(a1) -- Line: 37
                return 0.5 + 0.5 * a1
            end),
        }),
        React.createElement("ImageLabel", {
            Image = v1,
            ImageTransparency = GuiVisible,
            ScaleType = Enum.ScaleType.Fit,
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = Color3.fromRGB(109, 109, 109),
            BackgroundTransparency = GuiVisible:map(function(a1) -- Line: 47
                return 0.5 + 0.5 * a1
            end),
            Position = UDim2.new(0.5, 0, 0, 12),
            Size = UDim2.fromScale(0.8, 0.8),
        }, {
            React.createElement("UIAspectRatioConstraint"),
            React.createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
            (React.createElement("UIStroke", {
                Thickness = 2,
                Color = Color3.fromRGB(255, 255, 255),
                Transparency = GuiVisible:map(function(a1) -- Line: 60
                    return 0.8 + 0.2 * a1
                end),
            })),
        }),
        React.createElement("UICorner"),
        (React.createElement("TextLabel", {
            TextSize = 16,
            BackgroundTransparency = 1,
            ZIndex = 2,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Text = Description,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextTransparency = GuiVisible,
            AnchorPoint = Vector2.new(0.5, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.new(0.5, 0, 1, -2),
            Size = UDim2.new(1, -20, 0, 24),
        }, {React.createElement("UIStroke", {Thickness = 2, Transparency = GuiVisible})})),
    })
end

local function Rewards(a1) -- Line: 90 -- upvalues: React (val), Reward (val)
    local GuiVisible = a1.GuiVisible
    return React.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(0.5, 0, 0, 64),
        Size = UDim2.fromOffset(128, 80),
    }, {
        React.createElement("UIListLayout", {
            Padding = UDim.new(0, 16),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        React.createElement(Reward, {Index = 1, Icon = 16129614723, Description = "Militant", GuiVisible = GuiVisible}),
        React.createElement(Reward, {Index = 2, Icon = 5870325711, Description = "3500 Coins", GuiVisible = GuiVisible}),
        (React.createElement(Reward, {Index = 3, Icon = 5798487154, Description = "x3 Premium Crate", GuiVisible = GuiVisible})),
    })
end

local function Parallax(a1) -- Line: 128
    -- upvalues: useMouse (val), React (val), useSpring (val), useViewportSize (val), useReactBindings (val)
    local u30
    local GuiVisible = a1.GuiVisible
    local v1, v2 = useMouse()
    local v3 = React.joinBindings({x = v1, y = v2}):map(function(a1) -- Line: 134
        return Vector2.new(a1.x, a1.y)
    end)
    local v4, u21 = useSpring(v3:getValue(), 1, 10, true)
    _, u30 = useSpring(v3:getValue(), 1, 15, true)
    local v5 = useViewportSize(true)
    local v6, u47 = useSpring(if not a1.Visible:getValue() then 0 else 1, 0.5, 10, true)
    local v7, u62 = useSpring(if not a1.Visible:getValue() then 0 else 1, 0.5, 9, true)
    local v8 = React.joinBindings({spring1Value = v6, mouseSpringTarget = v4, viewportSize = v5})
    local v9 = React.joinBindings({spring2Value = v7, mouseSpringTarget = v4, viewportSize = v5})
    local v10 = useReactBindings
    local v11 = {a1.Visible}
    v10(function(a1) -- Line: 155 -- upvalues: u47 (val), u62 (val)
        u47(if not a1 then 0 else 1)
        u62(if not a1 then 0 else 1)
    end, v11)
    v11 = {v3}
    useReactBindings(function(a1) -- Line: 159 -- upvalues: u21 (val), u30 (val)
        u21(a1)
        u30(a1)
    end, v11)
    return React.createElement(React.Fragment, {}, {
        React.createElement("ImageLabel", {
            key = "coins",
            Image = "rbxassetid://16455010681",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 2,
            ImageTransparency = GuiVisible,
            ScaleType = Enum.ScaleType.Fit,
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = v8:map(function(a1) -- Line: 174
                local v1 = (a1.mouseSpringTarget - a1.viewportSize * 0.5) * 0.03
                return UDim2.new(0.5, v1.X, 0, -70 - 30 * a1.spring1Value + v1.Y)
            end),
            Size = UDim2.new(0, 409, 0, 100),
        }, {
            React.createElement("UIGradient", {
                Rotation = 90,
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0),
                    NumberSequenceKeypoint.new(0.8, 0),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
        }),
        (React.createElement("ImageLabel", {
            key = "character",
            Image = "rbxassetid://16455010332",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 0,
            ImageTransparency = GuiVisible,
            ScaleType = Enum.ScaleType.Fit,
            AnchorPoint = Vector2.new(0.4, 0),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = v9:map(function(a1) -- Line: 207
                local v1 = (a1.mouseSpringTarget - a1.viewportSize * 0.5) * 0.015
                return UDim2.new(0.5, v1.X, 0, -140 - 60 * a1.spring2Value + v1.Y)
            end),
            Size = UDim2.fromOffset(200, 200),
        })),
    })
end

return {
    Reward = Reward,
    Rewards = Rewards,
    Parallax = Parallax,
    Modal = function(a1) -- Line: 223
        -- upvalues: useScale (val), useTween (val), useProductInfo (val), useReactBindings (val), React (val)
        -- upvalues: Parallax (val), Rewards (val), Button (val), IconButton (val)
        local Visible = a1.Visible
        local u4 = useScale(1.8)
        local v1 = TweenInfo.new(0.3, Enum.EasingStyle.Sine)
        local v2, u21 = useTween(if not a1.Visible:getValue() then 0 else 1, v1, true, true)
        v1 = v2:map(function(a1) -- Line: 232
            return 1 - a1
        end)
        local v3, v4 = useProductInfo(Enum.InfoType.Product, 1759399952)
        local PriceInRobux = if not v3 then v4.PriceInRobux else 0
        local v5 = {Visible}
        useReactBindings(function(a1) -- Line: 240 -- upvalues: u21 (val)
            u21(if not a1 then 0 else 1)
        end, v5)
        return React.createElement("Frame", {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = v1:map(function(a1) -- Line: 246
                return 0.3 + 0.7 * a1
            end),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = v1:map(function(a1) -- Line: 251 -- upvalues: u4 (val)
                return UDim2.new(0.5, 0, 0.5, 64 * a1 + (120 - 120 * u4))
            end),
            Size = UDim2.fromOffset(600, 256),
            Visible = v2:map(function(a1) -- Line: 255
                return a1 > 0
            end),
        }, {
            React.createElement("UIScale", {Scale = u4}),
            React.createElement("UIStroke", {Thickness = 0.5, Transparency = v1}),
            React.createElement("UICorner"),
            React.createElement(Parallax, {GuiVisible = v1, Visible = Visible}),
            React.createElement("ImageLabel", {
                Image = "rbxassetid://9239716855",
                BackgroundTransparency = 1,
                ZIndex = -1,
                ImageTransparency = v1:map(function(a1) -- Line: 273
                    return 0.2 + 0.8 * a1
                end),
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(14, 14, 64, 24),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.new(1, 14, 1, 14),
            }),
            React.createElement(Rewards, {GuiVisible = v1}),
            React.createElement(Button, {
                Position = UDim2.new(0.5, 80, 1, -40),
                Size = UDim2.fromOffset(160, 46),
                Clicked = a1.Purchase,
                TextTransparency = v1,
                TextStrokeTransparency = v1,
                BackgroundTransparency = v1,
                Text = (" %*"):format(PriceInRobux),
            }),
            React.createElement(IconButton, {
                Rotation = 5,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(1, 0),
                Size = UDim2.fromOffset(44, 44),
                Transparency = v1,
                Color = Color3.fromRGB(255, 60, 60),
                Clicked = a1.LeaveModal,
            }),
            React.createElement("TextLabel", {
                Text = "Starter Bundle!",
                TextScaled = true,
                TextSize = 14,
                TextWrapped = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 3,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextTransparency = v1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromScale(0.5, 0),
                Size = UDim2.new(0.5, 0, 0, 48),
            }, {
                React.createElement("UIStroke", {Thickness = 8, Color = Color3.fromRGB(255, 255, 255), Transparency = v1}, {
                    React.createElement("UIGradient", {
                        Rotation = -90,
                        Transparency = v1:map(function(a1) -- Line: 333
                            return NumberSequence.new(a1)
                        end),
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(17, 17, 17)),
                            ColorSequenceKeypoint.new(0.347, Color3.fromRGB(19, 19, 19)),
                            (ColorSequenceKeypoint.new(1, Color3.fromRGB(61, 61, 61))),
                        }),
                    }),
                }),
            }),
            React.createElement("TextLabel", {
                TextScaled = true,
                TextSize = 32,
                TextWrapped = true,
                BackgroundTransparency = 1,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Text = (" %*"):format(740),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextTransparency = v1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.new(0.5, -80, 1, -28),
                Size = UDim2.fromOffset(160, 28),
            }, {
                React.createElement("UIStroke", {Thickness = 2, Transparency = v1}),
                React.createElement("Frame", {
                    BorderSizePixel = 0,
                    Rotation = -8,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = v1,
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.new(0.85, 0, 0, 4),
                }, {
                    React.createElement("UIGradient", {
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 39, 39)),
                            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 39, 39))),
                        }),
                        Transparency = v1:map(function(a1) -- Line: 382
                            return NumberSequence.new({
                                NumberSequenceKeypoint.new(0, 1 * a1),
                                NumberSequenceKeypoint.new(0.2, 0),
                                NumberSequenceKeypoint.new(0.8, 0),
                                (NumberSequenceKeypoint.new(1, 1 * a1)),
                            })
                        end),
                    }),
                }),
                (React.createElement("TextLabel", {
                    TextScaled = true,
                    TextSize = 14,
                    TextWrapped = true,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                    Text = if not PriceInRobux then "??% OFFF" else ("%*%% OFF!"):format((math.round(PriceInRobux / 740 * 100))),
                    TextColor3 = Color3.fromRGB(232, 66, 66),
                    TextTransparency = v1,
                    AnchorPoint = Vector2.new(0.5, 0),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Position = UDim2.new(0.5, 0, 0, -20),
                    Size = UDim2.new(1, 0, 0, 16),
                }, {React.createElement("UIStroke", {Transparency = v1})})),
            }),
            (React.createElement("TextLabel", {
                key = "timer",
                TextScaled = true,
                TextSize = 14,
                TextWrapped = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 4,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                Text = a1.Duration,
                TextColor3 = Color3.fromRGB(255, 192, 103),
                TextTransparency = v1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.new(0.5, 0, 0, 32),
                Size = UDim2.new(0.5, 0, 0, 32),
            }, {
                React.createElement("UIStroke", {Thickness = 6, Color = Color3.fromRGB(17, 17, 17), Transparency = v1}),
            })),
        })
    end,
}