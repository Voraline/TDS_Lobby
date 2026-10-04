-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Utility.SpinWheelChances.Utils
-- Decompile time: 1.43 ms

local Constants = require(script.Parent.Constants)

local function getGridRowCount(a1) -- Line: 7 -- upvalues: Constants (val) -- types: a1: number
    return (math.max(1, (math.ceil(a1 / Constants.ItemGridColumns))))
end

return {
    GetGridHeight = function(a1) -- Line: 11 -- upvalues: Constants (val) -- types: a1: number
        local v1 = math.max(1, (math.ceil(a1 / Constants.ItemGridColumns)))
        return v1 * Constants.ItemTileHeight + (v1 - 1) * Constants.ItemGridPadding
    end,
    GetRarityGroupHeight = function(a1) -- Line: 17 -- upvalues: Constants (val) -- types: a1: number
        local v1 = Constants.RarityGroupHeaderHeight + Constants.RarityGroupContentPadding
        local v2 = math.max(1, (math.ceil(a1 / Constants.ItemGridColumns)))
        return v1 + (v2 * Constants.ItemTileHeight + (v2 - 1) * Constants.ItemGridPadding)
    end,
    IsRewardCurrent = function(a1, a2) -- Line: 3 -- types: a2: table?
        return not a2 or a2[a1.rewardKey] == true
    end,
}