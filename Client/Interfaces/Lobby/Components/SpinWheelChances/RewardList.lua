-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.SpinWheelChances.RewardList
-- Decompile time: 2.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RarityGroup = require(script.Parent.RarityGroup)
local React = require(ReplicatedStorage.Shared.UI.React)
local u17 = require("../../Utility/SpinWheelChances/SpinWheelRewardData")
local u20 = require("../../Utility/SpinWheelChances/Utils")
local createElement = React.createElement

local function compareRewardEntries(a1, a2) -- Line: 11
    if a1.rarity ~= a2.rarity then
        return a1.rarity < a2.rarity
    end
    if a1.exactBasisPoints == a2.exactBasisPoints then
        return a1.layoutOrder < a2.layoutOrder
    end
    return a2.exactBasisPoints < a1.exactBasisPoints
end

local function sortEntries(a1) -- Line: 23 -- upvalues: u17 (val), u20 (val) -- types: a1: table?
    local v1 = {}
    for i, j in u17.Entries do
        v1[i] = j
    end
    table.sort(v1, function(a1_2, a2) -- Line: 29 -- upvalues: a1 (val), u20 (upval)
        if a1_2.rarity ~= a2.rarity then
            return a1_2.rarity < a2.rarity
        end
        if a1 then
            local v1 = u20.IsRewardCurrent(a1_2, a1)
            if v1 ~= u20.IsRewardCurrent(a2, a1) then
                return v1
            end
        end
        if a1_2.rarity ~= a2.rarity then
            return a1_2.rarity < a2.rarity
        end
        if a1_2.exactBasisPoints == a2.exactBasisPoints then
            return a1_2.layoutOrder < a2.layoutOrder
        end
        return a2.exactBasisPoints < a1_2.exactBasisPoints
    end)
    return v1
end

return React.memo(function(a1) -- Line: 49 -- upvalues: sortEntries (val), createElement (val), RarityGroup (val), React (val)
    local v1
    local shownRewardKeys = a1.shownRewardKeys
    local v2 = sortEntries(shownRewardKeys)
    local u76 = {}
    u76.layout = createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        Padding = UDim.new(0, 8),
        SortOrder = Enum.SortOrder.LayoutOrder,
    })
    u76.padding = createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 30),
        PaddingLeft = UDim.new(0, 6),
        PaddingRight = UDim.new(0, 2),
        PaddingTop = UDim.new(0, 3),
    })
    local u36 = 1
    local u67 = nil
    local rarity = nil
    local u39 = {}

    local function flushActiveGroup() -- Line: 71
        -- upvalues: u67 (ref), rarity (ref), u76 (val), createElement (upval), RarityGroup (upval), u39 (ref)
        -- upvalues: u36 (ref), shownRewardKeys (val)
        if u67 and rarity then
            local v1 = u76
            local v2 = ("RarityGroup_%*"):format(u67)
            v1[v2] = (createElement(RarityGroup, {
                displayBasisPoints = u39[1].rarityBasisPoints,
                entries = u39,
                layoutOrder = u36,
                rarity = rarity,
                shownRewardKeys = shownRewardKeys,
            }))
            u36 = u36 + 1
            u67 = nil
            rarity = nil
            u39 = {}
            return
        end
    end

    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        v1 = tostring(j.rarity)
        if u67 ~= v1 then
            flushActiveGroup()
            u67 = v1
            rarity = j.rarity
        end
        table.insert(u39, j)
    end
    flushActiveGroup()
    return (createElement(React.Fragment, {}, u76))
end)