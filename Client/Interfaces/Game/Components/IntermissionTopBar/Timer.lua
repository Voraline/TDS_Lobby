-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.IntermissionTopBar.Timer
-- Decompile time: 2.48 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useState = React.useState
local useBinding = React.useBinding
local useEffect = React.useEffect
local joinBindings = React.joinBindings
local useBindings = require(ReplicatedStorage.Packages.ReactFlow).useBindings
local useFlashingColor = require(ReplicatedStorage.Client.Interfaces.Hooks.useFlashingColor)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local u38 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
local u43 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
return function(a1) -- Line: 18
    -- upvalues: useTween (val), u43 (val), useBinding (val), useFlashingColor (val), u38 (val), useBindings (val)
    -- upvalues: createElement (val), joinBindings (val)
    local v1, u12 = useTween(UDim2.new(0.5, 0, 1, -5), u43, nil, true)
    local u15, u16 = useBinding(0)
    local v2, u30 = useFlashingColor(Color3.new(1, 1, 1), Color3.new(1, 0, 0), u38)
    local v3 = useBindings
    local v4 = {a1.TimeLeft}
    v3(function(a1) -- Line: 26 -- upvalues: u15 (val), u16 (val), u30 (val), u12 (val)
        if u15:getValue() ~= a1 and a1 then
            u16(a1)
            if a1 > 5940 then
                u30(true)
                return
            end
            if a1 <= 10 then
                u30(true)
                u12(UDim2.new(0.5, 0, 1, 0), true)
                return
            end
            u30(false)
        end
    end, v4, {})
    return createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(22, 22, 22),
        Position = joinBindings({a1.TimeLeft, v1}):map(function(a1) -- Line: 48
            if a1[1] and a1[1] <= 10 then
                return a1[2]
            end
            return (UDim2.fromScale(0.5, 1))
        end),
        Size = UDim2.fromOffset(100, 60),
    }, {
        timerTitle = createElement("Frame", {
            BackgroundTransparency = 1,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 0),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0),
            Size = UDim2.fromOffset(60, 20),
        }, {
            icon = createElement("ImageLabel", {
                Image = "rbxassetid://5577896365",
                BackgroundTransparency = 1,
                ScaleType = Enum.ScaleType.Fit,
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromScale(0, 0.5),
                Size = UDim2.fromOffset(24, 24),
            }),
            title = createElement("TextLabel", {
                Text = "Time Left:",
                TextSize = 20,
                BackgroundTransparency = 1,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Size = UDim2.fromOffset(0, 20),
            }, {
                stroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.5}),
                padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 26)}),
            }),
        }),
        time = createElement("TextLabel", {
            LineHeight = 1.1,
            TextScaled = true,
            TextSize = 36,
            TextWrapped = true,
            BackgroundTransparency = 1,
            ZIndex = 2,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Text = a1.TimeLeftConverted,
            TextColor3 = v2,
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.new(0.5, 0, 0, 20),
            Size = UDim2.new(8, 0, 0, 40),
        }, {
            stroke = createElement("UIStroke", {Thickness = 2.5, Transparency = 0.5}),
            gradient = createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    ColorSequenceKeypoint.new(0.6, Color3.fromRGB(255, 255, 255)),
                    ColorSequenceKeypoint.new(0.601, Color3.fromRGB(235, 235, 235)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(235, 235, 235))),
                }),
            }),
        }),
    })
end