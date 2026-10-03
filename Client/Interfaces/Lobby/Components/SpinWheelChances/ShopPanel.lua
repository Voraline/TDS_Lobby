-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.SpinWheelChances.ShopPanel
-- Decompile time: 2.72 ms

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local IconButton = require(ReplicatedStorage.Client.Interfaces.Components.IconButton)
local React = require(ReplicatedStorage.Shared.UI.React)
local RewardList = require(script.Parent.RewardList)
local createElement = React.createElement
local Change = React.Change
local memo = React.memo
local LocalPlayer = Players.LocalPlayer

local function getShownRewardKeys() -- Line: 18 -- upvalues: LocalPlayer (val), HttpService (val)
    local Attribute = LocalPlayer:GetAttribute("DailySpinShownRewardKeys")
    if typeof(Attribute) ~= "string" then
        return nil
    end
    local success, result = pcall(function() -- Line: 24 -- upvalues: HttpService (upval), Attribute (val)
        return HttpService:JSONDecode(Attribute)
    end)
    if success and typeof(result) == "table" then
        return result
    end
    return nil
end

return memo(function(a1) -- Line: 35
    -- upvalues: React (val), getShownRewardKeys (val), LocalPlayer (val), createElement (val), Change (val)
    -- upvalues: IconButton (val), RewardList (val)
    local v1, u5 = React.useState(getShownRewardKeys)
    local v2, u10 = React.useState(1)
    React.useEffect(function() -- Line: 39 -- upvalues: LocalPlayer (upval), u5 (val), getShownRewardKeys (upval)
        local u8 = (LocalPlayer:GetAttributeChangedSignal("DailySpinShownRewardKeys")):Connect(function() -- Line: 42 -- upvalues: u5 (upval), getShownRewardKeys (upval)
            u5((getShownRewardKeys()))
        end)
        u5((getShownRewardKeys()))
        return function() -- Line: 48 -- upvalues: u8 (val)
            u8:Disconnect()
        end
    end, {})
    local v3 = createElement
    local v4 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.new(),
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(2, 0.86),
        ZIndex = 100,
    }

    v4[Change.AbsoluteSize] = function(a1) -- Line: 63 -- upvalues: u10 (val) -- types: a1: userdata
        if 0 < a1.AbsoluteSize.Y then
            u10(a1.AbsoluteSize.Y / 800)
        end
    end

    return v3("Frame", v4, {
        uIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 2.83}),
        shopPanel = createElement("Frame", {
            BackgroundTransparency = 0.15,
            BorderSizePixel = 0,
            ZIndex = 101,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.new(),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(560, 933),
        }, {
            corner = createElement("UICorner", {CornerRadius = UDim.new(0, 8)}),
            stroke = createElement("UIStroke", {Thickness = 3.5, Transparency = 0.05, Color = Color3.fromRGB(244, 244, 244)}),
            title = createElement("TextLabel", {
                BackgroundTransparency = 1,
                Text = "Spin Wheel Odds",
                TextSize = 28,
                ZIndex = 102,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                Size = UDim2.new(1, -118, 0, 34),
                TextColor3 = Color3.new(1, 1, 1),
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            close = createElement(IconButton, {
                ZIndex = 103,
                AnchorPoint = Vector2.new(1, 0),
                Color = Color3.fromRGB(255, 60, 60),
                Clicked = a1.OnClose,
                Position = UDim2.fromScale(0.985, 0.025),
                Size = UDim2.fromOffset(44, 44),
            }),
            padding = createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 18),
                PaddingLeft = UDim.new(0, 18),
                PaddingRight = UDim.new(0, 18),
                PaddingTop = UDim.new(0, 18),
            }),
            uIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 0.7}),
            uIScale = createElement("UIScale", {Scale = v2}),
            subtitle = createElement("TextLabel", {
                BackgroundTransparency = 1,
                Text = "Darkened items are not on the wheel. They change every spin.",
                TextSize = 15,
                ZIndex = 102,
                Font = Enum.Font.GothamMedium,
                Position = UDim2.new(0, 0, 0, 42),
                Size = UDim2.new(1, 0, 0, 28),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            list = createElement("ScrollingFrame", {
                Active = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ClipsDescendants = true,
                ScrollBarImageTransparency = 0.2,
                ScrollBarThickness = 5,
                Selectable = true,
                SelectionGroup = true,
                ZIndex = 102,
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                CanvasSize = UDim2.fromScale(0, 0),
                ElasticBehavior = Enum.ElasticBehavior.WhenScrollable,
                Position = UDim2.new(0, 0, 0, 82),
                ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
                ScrollingDirection = Enum.ScrollingDirection.Y,
                Size = UDim2.new(1, 0, 1, -82),
            }, {rows = createElement(RewardList, {shownRewardKeys = v1})}),
        }),
    })
end)