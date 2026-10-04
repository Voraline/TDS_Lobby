-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.FanArtUser
-- Decompile time: 4.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useFontScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useFontScale)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 18
    -- upvalues: useFontScale (val), ReactFlow (val), React (val), useTransparencyModifier (val), createElement (val)
    local u3 = useFontScale({scale = 0.08})
    local v1, u13 = ReactFlow.useTween({
        start = 0,
        target = 0,
        info = TweenInfo.new(0.85, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
    })
    local v2, u23 = ReactFlow.useTween({
        start = 1,
        target = 1,
        info = TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    })
    local v3, u28 = React.useState("")
    local useEffect = React.useEffect
    local v4 = {a1.userName}
    useEffect(function() -- Line: 35 -- upvalues: a1 (val), u28 (val)
        if a1.userName ~= "" then
            u28(a1.userName)
        end
    end, v4)
    local v5 = useTransparencyModifier(v2)
    local useEffect_2 = React.useEffect
    local v6 = {a1.enabled}
    useEffect_2(function() -- Line: 43 -- upvalues: a1 (val), u13 (val), u23 (val)
        if a1.enabled then
            u13({
                target = 1,
                info = TweenInfo.new(0.45, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            })
            u23({
                target = 0,
                info = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            })
            return
        end
        u13({
            target = 0.5,
            info = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
        })
        u23({
            target = 1,
            info = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
        })
    end, v6)
    return createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = Color3.new(),
        BackgroundTransparency = v5(0.5),
        Position = a1.position,
    }, {
        textLabel = React.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextSize = 20,
            AnchorPoint = Vector2.new(0, 0.5),
            AutomaticSize = Enum.AutomaticSize.XY,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0, 0.5),
            Text = ("🎨 @%*"):format(v3),
            TextColor3 = Color3.new(1, 1, 1),
            TextTransparency = v5(0),
        }),
        uIStroke = React.createElement("UIStroke", {
            Thickness = 0.05,
            BorderOffset = UDim.new(0.05, 0),
            Color = Color3.new(1, 1, 1),
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
            Transparency = v5(0),
        }),
        uICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.2, 0)}),
        uIPadding = React.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 15),
            PaddingLeft = UDim.new(0, 12),
            PaddingRight = UDim.new(0, 12),
            PaddingTop = UDim.new(0, 15),
        }),
        uIScale = React.createElement("UIScale", {
            Scale = v1:map(function(a1) -- Line: 108 -- upvalues: u3 (val)
                return u3 * a1
            end),
        }),
    })
end)