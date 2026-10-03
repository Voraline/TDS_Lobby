-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.SpinWheelChances.RarityGroupHeader
-- Decompile time: 1.43 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u7 = require("../../Utility/SpinWheelChances/Constants")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local React = require(ReplicatedStorage.Shared.UI.React)
local SharedDailyRewards = require(ReplicatedStorage.Shared.Modules.SharedDailyRewards)
local u25 = require("../../Utility/SpinWheelChances/SpinWheelRewardData")
local createElement = React.createElement
return React.memo(function(a1) -- Line: 12 -- upvalues: Enum (val), u25 (val), SharedDailyRewards (val), createElement (val), u7 (val)
    local rarity = a1.rarity
    return createElement("Frame", {
        BackgroundTransparency = 1,
        LayoutOrder = a1.layoutOrder,
        Size = UDim2.new(1, -6, 0, u7.RarityGroupHeaderHeight),
    }, {
        list = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalFlex = Enum.UIFlexAlignment.Fill,
            Padding = UDim.new(0, u7.RarityGroupHeaderPadding),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        label = createElement("TextLabel", {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            AutomaticSize = Enum.AutomaticSize.X,
            Font = Enum.Font.GothamBold,
            Size = UDim2.fromOffset(0, u7.RarityGroupHeaderHeight),
            Text = Enum.CrateItemRarity.ToString(rarity),
            TextColor3 = SharedDailyRewards.CrateItemRarityColors[rarity] or Color3.fromRGB(255, 255, 255),
            TextSize = u7.RarityGroupHeaderTextSize,
            TextXAlignment = Enum.TextXAlignment.Left,
        }, {
            flex = createElement("UIFlexItem", {FlexMode = Enum.UIFlexMode.None}),
            padding = createElement("UIPadding", {PaddingRight = UDim.new(0, 10)}),
        }),
        divider = createElement("Frame", {
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            LayoutOrder = 2,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromOffset(0, 1),
        }, {
            flex = createElement("UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Grow,
                ItemLineAlignment = Enum.ItemLineAlignment.Center,
            }),
        }),
        chance = createElement("TextLabel", {
            BackgroundTransparency = 1,
            LayoutOrder = 3,
            AutomaticSize = Enum.AutomaticSize.X,
            Font = Enum.Font.GothamBlack,
            Size = UDim2.fromOffset(0, u7.RarityGroupHeaderHeight),
            Text = u25.FormatChance(a1.displayBasisPoints),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = u7.RarityGroupPercentTextSize,
            TextXAlignment = Enum.TextXAlignment.Right,
        }, {
            flex = createElement("UIFlexItem", {FlexMode = Enum.UIFlexMode.None}),
            padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 10)}),
        }),
    })
end)