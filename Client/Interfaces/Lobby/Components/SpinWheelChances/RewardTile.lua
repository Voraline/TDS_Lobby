-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.SpinWheelChances.RewardTile
-- Decompile time: 2.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u7 = require("../../Utility/SpinWheelChances/Constants")
local React = require(ReplicatedStorage.Shared.UI.React)
local SharedDailyRewards = require(ReplicatedStorage.Shared.Modules.SharedDailyRewards)
local u20 = require("../../Utility/SpinWheelChances/SpinWheelRewardData")
local TextMarquee = require(ReplicatedStorage.Client.Interfaces.Universal.Components.TextMarquee)
local u30 = require("../../Utility/SpinWheelChances/Utils")
local createElement = React.createElement
return React.memo(function(a1) -- Line: 13
    -- upvalues: SharedDailyRewards (val), u30 (val), u20 (val), createElement (val), u7 (val), TextMarquee (val)
    local v1
    local entry = a1.entry
    local shownRewardKeys = a1.shownRewardKeys
    local layoutOrder = a1.layoutOrder
    local itemDisplayBasisPoints = a1.itemDisplayBasisPoints
    local v2 = SharedDailyRewards.CrateItemRarityColors[entry.rarity] or Color3.fromRGB(255, 255, 255)
    local v3 = u30.IsRewardCurrent(entry, shownRewardKeys)
    local v4 = if not v3 then nil else u20.FormatChance(itemDisplayBasisPoints)
    return createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundColor3 = u7.RowBackground,
        BackgroundTransparency = if not v3 then 0.26 else 0,
        LayoutOrder = layoutOrder,
        Size = UDim2.fromScale(1, 1),
    }, {
        corner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
        stroke = createElement("UIStroke", {Thickness = 1, Transparency = 0.2, Color = u7.RowStroke}),
        rarityStrip = createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundColor3 = v2,
            BackgroundTransparency = if not v3 then 0.25 else 0,
            Size = UDim2.new(1, 0, 0, 5),
        }, {corner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)})}),
        iconBackground = createElement("Frame", {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = Color3.fromRGB(12, 14, 17),
            BackgroundTransparency = if not v3 then 0.08 else 0,
            Position = UDim2.new(0.5, 0, 0, 14),
            Size = UDim2.fromOffset(48, 48),
        }, {
            corner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
            icon = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Image = entry.icon,
                ImageTransparency = v1,
                Position = UDim2.fromScale(0.5, 0.5),
                ScaleType = Enum.ScaleType.Fit,
                Size = UDim2.fromScale(0.78, 0.78),
            }),
        }),
        name = createElement(TextMarquee, {
            alwaysMarquee = true,
            BackgroundTransparency = 1,
            TextSize = 13,
            AnchorPoint = Vector2.new(0.5, 0),
            Font = Enum.Font.GothamBold,
            padding = UDim.new(0, 3),
            Position = UDim2.new(0.5, 0, 0, 64),
            Size = UDim2.new(1, -10, 0, 20),
            Text = entry.name,
            TextColor3 = u7.HeaderText,
            TextTransparency = v1,
            TextXAlignment = Enum.TextXAlignment.Center,
        }),
        rarity = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextSize = 11,
            Font = Enum.Font.GothamMedium,
            Position = UDim2.new(0, 5, 0, 82),
            Size = UDim2.new(1, -10, 0, 14),
            Text = entry.rarityName,
            TextColor3 = v2,
            TextTransparency = v1,
            TextTruncate = Enum.TextTruncate.AtEnd,
            TextXAlignment = Enum.TextXAlignment.Center,
        }),
        chance = if not v4 then nil else createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextSize = 13,
            Font = Enum.Font.GothamBlack,
            Position = UDim2.new(0, 5, 0, 96),
            Size = UDim2.new(1, -10, 0, 15),
            Text = v4,
            TextColor3 = u7.HeaderText,
            TextXAlignment = Enum.TextXAlignment.Center,
        }),
        shade = if not v3 then createElement("Frame", {
            BackgroundTransparency = 0.58,
            BorderSizePixel = 0,
            ZIndex = 10,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.fromScale(1, 1),
        }, {corner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)})}) else nil,
    })
end)