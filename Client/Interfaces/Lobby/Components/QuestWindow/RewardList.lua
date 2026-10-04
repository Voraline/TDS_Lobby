-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.QuestWindow.RewardList
-- Decompile time: 2.61 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local RewardItem = require(script.Parent.RewardItem)
local createElement = React.createElement
return function(a1) -- Line: 26 -- upvalues: createElement (val), RewardItem (val) -- types: a1: table
    local v1
    local PreviewScale = a1.PreviewScale or (if not a1.IsMobile then nil else 1.15)
    local v2 = {}
    local v3 = {}
    local CellPadding = a1.CellPadding or UDim2.new(0.005, 0, 0.0936, 0)
    v3.CellPadding = CellPadding
    local CellSize = a1.CellSize or UDim2.new(0.2452, 0, 1.4473, 0)
    v3.CellSize = CellSize
    v3.FillDirection = Enum.FillDirection.Horizontal
    v3.FillDirectionMaxCells = a1.FillDirectionMaxCells or 0
    local HorizontalAlignment = a1.HorizontalAlignment or Enum.HorizontalAlignment.Right
    v3.HorizontalAlignment = HorizontalAlignment
    v3.SortOrder = Enum.SortOrder.LayoutOrder
    v3.VerticalAlignment = Enum.VerticalAlignment.Center
    v2.GridLayout = createElement("UIGridLayout", v3, {AspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1})})
    local Rewards = a1.Rewards or {}
    local v4 = nil
    v3 = nil
    local v5 = a1
    for i, j in Rewards, v4, v3 do
        v1 = ("RewardSlot_%*"):format(i)
        v2[v1] = (createElement(RewardItem, {
            LayoutOrder = i,
            PreviewScale = PreviewScale,
            Reward = j,
            ShowQuantity = v5.ShowQuantity,
            TooltipKey = if not v5.TooltipKeyPrefix then nil else ("%*_%*"):format(v5.TooltipKeyPrefix, i),
        }))
    end
    v3 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = v5.AnchorPoint,
        LayoutOrder = v5.LayoutOrder,
        Position = v5.Position,
    }
    local Size = v5.Size or UDim2.new(0.3101, 0, 0.6684, 0)
    v3.Size = Size
    v3.ZIndex = v5.ZIndex
    return createElement("Frame", v3, v2)
end