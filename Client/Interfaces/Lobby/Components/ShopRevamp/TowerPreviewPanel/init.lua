-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.TowerPreviewPanel
-- Decompile time: 3.96 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared
local Packages = ReplicatedStorage.Packages
local Client = ReplicatedStorage.Client
local Modules = Shared.Modules
local UI = Shared.UI
local Interfaces = Client.Interfaces
local Inventory = Interfaces.Universal.Components.Inventory
local Handlers = Modules.Asset.Handlers
local Hooks = Interfaces.Hooks
local React = require(UI.React)
local ReactFlow = require(Packages.ReactFlow)
require(UI.ReactTypes)
local TowerStats = require(Inventory.TowerStats)
local Troops = require(Handlers.Troops)
local Stats = require(script.Stats)
local useMediaQuery = require(Hooks.useMediaQuery)
local createElement = React.createElement
local memo = React.memo
local useEffect = React.useEffect
local useMemo = React.useMemo
local useGroupAnimation = ReactFlow.useGroupAnimation
local useSequenceAnimation = ReactFlow.useSequenceAnimation
local useAnimation = ReactFlow.useAnimation
local useBindings = ReactFlow.useBindings
local useSpring = ReactFlow.useSpring
local Spring = ReactFlow.Spring

local function getPanelPosition(a1) -- Line: 56 -- types: a1: number
    return UDim2.fromScale(math.lerp(0.7, 0.975, (math.clamp(a1, 0, 1))), 0.5)
end

local function createSpacerFrame(a1) -- Line: 64 -- upvalues: createElement (val) -- types: a1: number
    return createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 0.025), LayoutOrder = a1})
end

return memo(function(a1) -- Line: 73
    -- upvalues: useMemo (val), Troops (val), Stats (val), useMediaQuery (val), useSpring (val), useBindings (val)
    -- upvalues: useGroupAnimation (val), useSequenceAnimation (val), Spring (val), useAnimation (val), useEffect (val)
    -- upvalues: createElement (val), React (val), TowerStats (val)
    local u22, u46
    local v1 = useMemo
    local v2 = {a1.level, a1.path or 0, a1.skinName or "", a1.towerName}
    v1 = v1(function() -- Line: 74 -- upvalues: Troops (upval), a1 (val), Stats (upval)
        local v1 = Troops(a1.towerName)
        local Stats_2 = v1 and v1.Stats
        return Stats.createDisplayStats(Stats_2 and (a1.skinName and Stats_2[a1.skinName] or Stats_2.Default), a1.level, a1.path)
    end, v2)
    local v3 = not useMediaQuery("large")
    v2, u22 = useSpring({speed = 50, damper = 1, start = UDim2.fromScale(1.25, 0.25)})
    local v4 = useBindings
    local v5 = {a1.zoomInScalar}
    v4(function(a1) -- Line: 90 -- upvalues: u22 (val)
        u22({
            target = UDim2.fromScale(math.lerp(0.7, 0.975, (math.clamp(a1, 0, 1))), 0.5),
        })
    end, v5, {})
    v4, u46 = useGroupAnimation({
        enabled = useSequenceAnimation({
            {
                timestamp = 0.05,
                panelScale = Spring({target = 1, speed = 15, damper = 0.5}),
                panelRotation = Spring({target = 0, speed = 15, damper = 0.5}),
            },
        }),
        disabled = useAnimation({}),
    }, {panelRotation = 0, panelScale = 0.5})
    useEffect(function() -- Line: 118 -- upvalues: u46 (val)
        u46("enabled")
    end, {})
    if #v1 == 0 then
        return createElement(React.Fragment, nil)
    end
    local v6 = {
        BackgroundTransparency = 0.3,
        BorderSizePixel = 0,
        ZIndex = 2,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(20, 20, 20),
        Position = v2,
    }
    local v7 = v3 and UDim2.new(0.025, 75, 0, 0) or UDim2.new(0, 175, 0.1, 0)
    v6.Size = v7
    v6.Rotation = v4.panelRotation
    v6.AutomaticSize = Enum.AutomaticSize.Y
    return createElement("Frame", v6, {
        UIScale = createElement("UIScale", {Scale = v4.panelScale}),
        UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.04, 0)}),
        UIGradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(27, 31, 57)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 10, 20))),
            }),
        }),
        UIStroke = createElement("UIStroke", {Thickness = 1.5, Transparency = 0.72, Color = Color3.fromRGB(255, 255, 255)}),
        UIListLayout = createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10),
        }),
        UIShadow = createElement("UIShadow", {Transparency = 0.5, BlurRadius = UDim.new(0.05, 0)}),
        TopSpacerFrame = createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = -1, Size = UDim2.fromScale(1, 0.025)}),
        Header = createElement("TextLabel", {
            BackgroundTransparency = 1,
            Text = "Tower Stats",
            TextScaled = true,
            ZIndex = 3,
            LayoutOrder = 1,
            FontFace = Font.fromName("Montserrat", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, 0.025),
            Size = UDim2.fromScale(0.8, 0.09),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Center,
        }, {
            UIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.35, Color = Color3.fromRGB(0, 0, 0)}),
        }),
        Divider = createElement("Frame", {
            BackgroundTransparency = 0.75,
            BorderSizePixel = 0,
            LayoutOrder = 4,
            ZIndex = 3,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.1, 0.125),
            Size = UDim2.new(0.8, 0, 0, 1),
        }),
        StatWrapper = createElement("Frame", {
            BackgroundTransparency = 1,
            LayoutOrder = 5,
            Size = UDim2.fromScale(0.8, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
        }, {
            Stats = createElement(TowerStats, {
                scale = 0.6,
                native = {Size = UDim2.fromScale(1, 0), Position = UDim2.fromScale(0, 0)},
                stats = v1,
            }),
        }),
    })
end)