-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Components.SubsectionBreak
-- Decompile time: 4.50 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local Client = ReplicatedStorage.Client
local React = require(Packages.React)
local ReactFlow = require(Packages.ReactFlow)
local TextLabel = require(Client.Interfaces.Components.TextLabel)
local Timer = require(Client.Interfaces.Universal.Components.Timer)
local useGroupAnimation = ReactFlow.useGroupAnimation
local useAnimation = ReactFlow.useAnimation
local createElement = React.createElement
local useBindings = ReactFlow.useBindings
local useBinding = React.useBinding
local Spring = ReactFlow.Spring
return function(a1) -- Line: 33
    -- upvalues: useBinding (val), useGroupAnimation (val), useAnimation (val), Spring (val), useBindings (val)
    -- upvalues: createElement (val), TextLabel (val), Timer (val)
    local v1 = a1.visible ~= false
    local v2 = useBinding(false)
    local v3 = useBinding(false)
    local v4, u52 = useGroupAnimation({
        onSelected = useAnimation({
            highlightTransparency = Spring({target = 0.8, damper = 1, speed = 40}),
            textTransparency = Spring({target = 0, damper = 1, speed = 40}),
            sectionScale = Spring({target = 0.985, damper = 1, speed = 40}),
        }),
        onHovered = useAnimation({
            highlightTransparency = Spring({target = 0.95, damper = 1, speed = 40}),
            textTransparency = Spring({target = 0, damper = 1, speed = 40}),
            sectionScale = Spring({target = 1.02, damper = 1, speed = 40}),
        }),
        onDefault = useAnimation({
            highlightTransparency = Spring({target = 1, damper = 1, speed = 40}),
            textTransparency = Spring({target = 0.4, damper = 1, speed = 40}),
            sectionScale = Spring({target = 1, damper = 1, speed = 40}),
        }),
    }, {highlightTransparency = 1, textTransparency = 0, sectionScale = 1})
    local v5 = {v2, v3}
    useBindings(function(a1, a2) -- Line: 87 -- upvalues: u52 (val)
        if a2 then
            u52("onSelected")
            return
        end
        if a1 then
            u52("onHovered")
            return
        end
        u52("onDefault")
    end, v5, {})
    v5 = {
        AutoButtonColor = false,
        BackgroundTransparency = 1,
        Text = "",
        Interactable = false,
        LayoutOrder = a1.layoutOrder,
    }
    local size = a1.size or UDim2.fromScale(0.975, 0.035)
    v5.Size = size
    v5.Visible = v1
    local v6 = {UIScale = createElement("UIScale", {Scale = v4.sectionScale})}
    v6.Title = createElement(TextLabel, {
        BackgroundTransparency = 1,
        FontWeight = "Bold",
        StrokeThickness = 0.1,
        Text = a1.title,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.fromScale(0.92, 0.7),
        Position = UDim2.fromScale(0, 0.6),
        AnchorPoint = Vector2.new(0, 0.5),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTransparency = v4.textTransparency,
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
    })
    local v7 = a1.timeLeft and createElement(Timer, {
        TimerTemplate = "Refreshes in %s",
        IconScale = 0.65,
        TextSize = 16,
        MaxTextSize = 16,
        HasNoStroke = false,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.fromScale(1, 0.6),
        TimeLeft = a1.timeLeft,
        CornerRadius = UDim.new(1, 0),
        Size = UDim2.fromScale(0, 0.8),
    }) or nil
    v6.Timer = v7
    v6.HighlightFrame = createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = v4.highlightTransparency,
        Position = UDim2.fromScale(0.5, 0.6),
        Size = UDim2.fromScale(1.025, 0.825),
    }, {UICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})
    return createElement("TextButton", v5, v6)
end