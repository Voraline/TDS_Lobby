-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.LogBook.Sidebars.MapSidebar
-- Decompile time: 3.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local MapSidebarModes = require(script.MapSidebarModes)
local MapSidebarScores = require(script.MapSidebarScores)
local useSpring = ReactFlow.useSpring
local useTween = ReactFlow.useTween
local memo = React.memo
local useMemo = React.useMemo
local useEffect = React.useEffect
local createElement = React.createElement
Content("Maps")
local u46 = {}
u46[Enum.Difficulty.VeryEasy] = (Color3.fromRGB(0, 255, 127))
u46[Enum.Difficulty.Easy] = (Color3.fromRGB(0, 255, 127))
u46[Enum.Difficulty.Medium] = (Color3.fromRGB(0, 170, 255))
u46[Enum.Difficulty.Normal] = (Color3.fromRGB(0, 170, 255))
u46[Enum.Difficulty.Hard] = (Color3.fromRGB(255, 56, 56))
u46[Enum.Difficulty.Insane] = (Color3.fromRGB(170, 0, 255))
u46[Enum.Difficulty.Event] = (Color3.fromRGB(255, 242, 90))
u46[Enum.Difficulty.Special] = (Color3.fromRGB(255, 242, 90))
local u105 = memo(function(a1) -- Line: 61
    -- upvalues: u46 (val), Enum (val), useSpring (val), useTween (val), useEffect (val), createElement (val)
    local u8 = u46[a1.difficulty]
    if not u8 then
        u8 = u46[Enum.Difficulty.Special]
    end
    local v1, u12 = useSpring({start = 0, target = 0, damper = 0.6, speed = 15})
    local v2, u16 = useSpring({start = 0, target = 0, damper = 0.6, speed = 15})
    local v3, u25 = useTween({
        start = u8,
        target = u8,
        info = TweenInfo.new(0.5, Enum.EasingStyle.Exponential),
    })
    local v4 = useEffect
    local v5 = {a1.name}
    v4(function() -- Line: 83 -- upvalues: u12 (val), u16 (val)
        u12({force = 2})
        u16({force = 2})
    end, v5)
    v5 = {u8}
    useEffect(function() -- Line: 91 -- upvalues: u25 (val), u8 (val)
        u25({target = u8})
    end, v5)
    return createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.fromScale(1, 0.457),
    }, {
        aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1.25, AspectType = Enum.AspectType.ScaleWithParentSize}),
        stroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.8, LineJoinMode = Enum.LineJoinMode.Miter}),
        icon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            ZIndex = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Image = ("rbxassetid://%*"):format(a1.icon or 5080134628),
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Crop,
            Size = v1:map(function(a1) -- Line: 125
                return UDim2.fromScale(1 + a1, 1 + a1)
            end),
        }, {
            innerGlow = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Image = "rbxassetid://85104292402513",
                ImageTransparency = 0.2,
                ZIndex = 2,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                ImageColor3 = v3,
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
            }),
        }),
        title = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            TextSize = 16,
            TextStrokeTransparency = 0.7,
            TextWrapped = true,
            ZIndex = 4,
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = Color3.fromRGB(139, 139, 139),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = v2:map(function(a1) -- Line: 156
                return UDim2.fromScale(0.5, 0.0139 - a1)
            end),
            Size = UDim2.fromScale(1, 0.139),
            Text = a1.name,
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }, {uIStroke = createElement("UIStroke", {Thickness = 3, Transparency = 0.25})}),
    })
end)
return (memo(function(a1) -- Line: 176
    -- upvalues: createElement (val), u105 (val), MapSidebarScores (val), MapSidebarModes (val)
    local transparency = a1.transparency
    local setIsLoading = a1.setIsLoading
    local selectedMap = a1.selectedMap
    if not selectedMap then
        return nil
    end
    return createElement("Frame", {
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        ZIndex = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(5, 9, 12),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {
        uICorner = createElement("UICorner"),
        scrollingFrame = createElement("ScrollingFrame", {
            Active = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            BottomImage = "",
            ScrollBarThickness = 8,
            TopImage = "",
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(12, 12, 12),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.new(1, -8, 1, 0),
            CanvasSize = UDim2.fromScale(0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
        }, {
            uIPadding = createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 16),
                PaddingLeft = UDim.new(0, 16),
                PaddingRight = UDim.new(0, 24),
                PaddingTop = UDim.new(0, 16),
            }),
            uIListLayout = createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                Padding = UDim.new(0, 16),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            map = createElement(u105, {
                name = selectedMap.name,
                icon = selectedMap.icon,
                difficulty = selectedMap.difficulty,
            }),
            scores = createElement(MapSidebarScores, {map = selectedMap.name, scores = selectedMap.scores}),
            modes = createElement(MapSidebarModes, {map = selectedMap.name, modes = selectedMap.modes}),
        }),
    })
end))