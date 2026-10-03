-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.SpinWheelChances.RarityGroup
-- Decompile time: 1.53 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u7 = require("../../Utility/SpinWheelChances/Constants")
local RarityGroupHeader = require(script.Parent.RarityGroupHeader)
local React = require(ReplicatedStorage.Shared.UI.React)
local RewardTile = require(script.Parent.RewardTile)
local u25 = require("../../Utility/SpinWheelChances/Utils")
local createElement = React.createElement
return React.memo(function(a1) -- Line: 12
    -- upvalues: u25 (val), createElement (val), u7 (val), RewardTile (val), RarityGroupHeader (val)
    local v1
    local entries = a1.entries
    local displayBasisPoints = a1.displayBasisPoints
    local layoutOrder = a1.layoutOrder
    local rarity = a1.rarity
    local shownRewardKeys = a1.shownRewardKeys
    local v2 = 0
    for i, j in entries do
        if u25.IsRewardCurrent(j, shownRewardKeys) then
            v2 = v2 + 1
        end
    end
    local v3 = if not (v2 > 0) then 0 else displayBasisPoints / v2
    local v4 = {
        layout = createElement("UIGridLayout", {
            CellPadding = UDim2.fromOffset(u7.ItemGridPadding, u7.ItemGridPadding),
            CellSize = UDim2.new(1 / u7.ItemGridColumns, -6, 0, u7.ItemTileHeight),
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
    }
    for k, n in entries do
        v1 = ("Reward_%*"):format(k)
        v4[v1] = (createElement(RewardTile, {
            entry = n,
            itemDisplayBasisPoints = v3,
            layoutOrder = k,
            shownRewardKeys = shownRewardKeys,
        }))
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        LayoutOrder = layoutOrder,
        Size = UDim2.new(1, -6, 0, u25.GetRarityGroupHeight(#entries)),
    }, {
        header = createElement(RarityGroupHeader, {layoutOrder = 1, displayBasisPoints = displayBasisPoints, rarity = rarity}),
        grid = createElement("Frame", {
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 0, 0, u7.RarityGroupHeaderHeight + u7.RarityGroupContentPadding),
            Size = UDim2.new(1, 0, 0, u25.GetGridHeight(#entries)),
        }, v4),
    })
end)