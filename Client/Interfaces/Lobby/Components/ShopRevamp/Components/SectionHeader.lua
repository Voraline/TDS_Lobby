-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Components.SectionHeader
-- Decompile time: 1.08 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local Client = ReplicatedStorage.Client
local React = require(Packages.React)
local TextLabel = require(Client.Interfaces.Components.TextLabel)
local Timer = require(Client.Interfaces.Universal.Components.Timer)
local createElement = React.createElement
return function(a1) -- Line: 22 -- upvalues: createElement (val), TextLabel (val), Timer (val) -- types: a1: table
    local v1 = {}
    local v2 = {BackgroundTransparency = 1, LayoutOrder = 1, Size = UDim2.fromScale(1, 0.7)}
    local v3 = {
        Title = createElement(TextLabel, {
            BackgroundTransparency = 1,
            FontWeight = "Bold",
            StrokeThickness = 0.125,
            Text = a1.title,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.new(1, 0, 1, 0),
            TextXAlignment = Enum.TextXAlignment.Left,
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        }),
    }
    local v4 = a1.timeLeft and createElement(Timer, {
        TimerTemplate = "Refreshes in %s",
        IconScale = 0.65,
        TextSize = 16,
        MaxTextSize = 16,
        HasNoStroke = false,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.fromScale(1, 0.5),
        TimeLeft = a1.timeLeft,
        CornerRadius = UDim.new(1, 0),
    }) or nil
    v3.Timer = v4
    v1.HeaderRow = createElement("Frame", v2, v3)
    v1.HorizontalFrame = createElement("Frame", {
        BackgroundTransparency = 0.75,
        BorderSizePixel = 0,
        LayoutOrder = 3,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.new(1, 0, 0, 2),
    })
    v2 = {BackgroundTransparency = 1, LayoutOrder = a1.layoutOrder}
    local size = a1.size or UDim2.fromScale(0.975, 0.04)
    v2.Size = size
    return createElement("Frame", v2, {
        UIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.2, 0),
        }),
    }, v1)
end