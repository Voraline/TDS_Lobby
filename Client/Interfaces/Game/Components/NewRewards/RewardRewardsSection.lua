-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewRewards.RewardRewardsSection
-- Decompile time: 1.04 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local RewardIcon = require(script.Parent.RewardIcon)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 17
    -- upvalues: createElement (val), RewardIcon (val), useTransparencyModifier (val)
    local v1 = {}
    local rewards = a1.rewards or {}
    a1.rewards = rewards
    for i, j in a1.rewards do
        j.index = i
        v1[i] = (createElement(RewardIcon, j))
    end
    local v2 = useTransparencyModifier(a1.transparency)
    return createElement("ScrollingFrame", {
        Active = true,
        BorderSizePixel = 0,
        ScrollBarThickness = 6,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(9, 9, 9),
        BackgroundTransparency = v2(0),
        BorderColor3 = Color3.new(),
        CanvasSize = UDim2.new(),
        Position = UDim2.fromScale(0.0197133, 0.392982),
        ScrollBarImageColor3 = Color3.new(),
        Size = UDim2.fromScale(0.549283, 0.566667),
    }, {
        uIListLayout = createElement("UIListLayout", {
            Wraps = true,
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            Padding = UDim.new(0, 20),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        uIPadding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 15),
            PaddingLeft = UDim.new(0, 15),
            PaddingRight = UDim.new(0, 15),
            PaddingTop = UDim.new(0, 15),
        }),
        uIStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.new(1, 1, 1), Transparency = v2(0.8)}),
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.0137694, 0)}),
    }, v1)
end)