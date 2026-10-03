-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.VoteGame
-- Decompile time: 3.91 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local Sift = require(ReplicatedStorage.Packages.Sift)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local ReadyUpButton = require(ReplicatedStorage.Client.Interfaces.Universal.Components.ReadyUpButton)
local useSpring = ReactFlow.useSpring
local useAnimation = ReactFlow.useAnimation
local useGroupAnimation = ReactFlow.useGroupAnimation
local Tween = ReactFlow.Tween
local Spring = ReactFlow.Spring
local memo = React.memo
local useMemo = React.useMemo
local useEffect = React.useEffect
local useRef = React.useRef
local createElement = React.createElement
return memo(function(a1) -- Line: 24
    -- upvalues: useRef (val), useMemo (val), Sift (val), useSpring (val), useGroupAnimation (val), useAnimation (val)
    -- upvalues: Spring (val), Tween (val), useTransparencyModifier (val), useEffect (val), createElement (val)
    -- upvalues: ReadyUpButton (val)
    local players = a1.players or {}
    local votedPlayers = a1.votedPlayers
    if not votedPlayers then
        votedPlayers = {}
    end
    local u8 = a1.maxVotes or 3
    local v1 = a1.title or "Start Game?"
    local u13 = a1.visible ~= false
    local v2 = a1.hasVoted == true
    local u20 = useRef(true)
    local v3 = {votedPlayers, u8}
    local v4 = useMemo(function() -- Line: 33 -- upvalues: Sift (upval), votedPlayers (val), u8 (val)
        return (math.clamp(Sift.Dictionary.count(votedPlayers), 0, u8))
    end, v3)
    local v5, u35 = useSpring({start = 0, target = 0, speed = 10, damper = 0.7})
    local v6, u84 = useGroupAnimation({
        enable = useAnimation({
            position = Spring({target = 0, speed = 20, damper = 1}),
            transparency = Tween({
                start = 1,
                target = 0,
                info = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
            }),
            bgTransparency = Tween({
                start = 1,
                target = 0,
                info = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            }),
        }),
        disable = useAnimation({
            position = Spring({target = 1, speed = 20, damper = 1}),
            transparency = Tween({
                start = 0,
                target = 1,
                info = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
            }),
            bgTransparency = Tween({
                start = 0,
                target = 1,
                info = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            }),
        }),
    }, {position = 1, transparency = 1, bgTransparency = 1})
    local v7 = useTransparencyModifier(v6.transparency)
    local v8 = useTransparencyModifier(v6.bgTransparency)
    local v9 = {u13}
    useEffect(function() -- Line: 86 -- upvalues: u84 (val), u13 (val)
        u84(if not u13 then "disable" else "enable")
    end, v9)
    v9 = {v4, u8}
    useEffect(function() -- Line: 90 -- upvalues: u20 (val), u35 (val)
        if not u20.current then
            u35({force = 200})
        end
        u20.current = false
    end, v9)
    v9 = {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.144),
    }
    local size = a1.size or UDim2.fromScale(0.173547, 0.120201)
    v9.Size = size
    return createElement("Frame", v9, {
        uIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 3}),
        background = createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = -1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.new(),
            BackgroundTransparency = v8(0.5),
            BorderColor3 = Color3.new(),
            Position = UDim2.fromScale(0.5, 0.38),
            Size = UDim2.fromScale(1.15, 0.7),
        }, {
            uIGradient = createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.5, 0.3),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
            uIStroke = createElement("UIStroke", {Thickness = 2}, {
                uIGradient = createElement("UIGradient", {
                    Transparency = v8(NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1),
                        NumberSequenceKeypoint.new(0.5, 0.3),
                        (NumberSequenceKeypoint.new(1, 1)),
                    })),
                }),
            }),
        }),
        container = createElement("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            Position = v6.position:map(function(a1) -- Line: 144
                return UDim2.fromScale(0, a1)
            end),
        }, {
            prompt = createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                AnchorPoint = Vector2.new(0, 0.5),
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                Position = UDim2.fromScale(0.0385554, 0.264902),
                Size = UDim2.fromScale(0.412987, 0.265327),
                Text = v1,
                TextTransparency = v7(0),
                TextColor3 = Color3.new(1, 1, 1),
            }, {uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = v7(0)})}),
            count = createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                AnchorPoint = Vector2.new(0, 0.5),
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
                Position = v5:map(function(a1) -- Line: 178
                    return UDim2.new(0.0385554, 0, 0.530229, -a1)
                end),
                Size = UDim2.fromScale(0.412987, 0.198995),
                Text = ("%*/%* Required"):format(v4, u8),
                TextColor3 = Color3.new(1, 1, 1),
                TextTransparency = v7(0),
            }, {uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = v7(0)})}),
            ready = createElement(ReadyUpButton, {
                votedPlayers = votedPlayers,
                hasVoted = v2,
                players = players,
                clicked = a1.clicked,
                text = a1.text,
                visible = u13,
                transparency = v6.transparency,
            }),
        }),
    }, a1.children)
end)