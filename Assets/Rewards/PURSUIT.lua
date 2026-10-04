-- Script path: ReplicatedStorage.Assets.Rewards.PURSUIT
-- Decompile time: 0.21 ms

return {
    Reward = "Pursuit Tower",
    Badge = 2124477838,
    Check = function(a1) -- Line: 6
        local Data = a1.Data
        if Data then
            local Inventory = Data.Inventory
            if Inventory then
                local Troops = Inventory.Troops
                if Troops then
                    return not Troops.Pursuit
                end
            end
        end
    end,
    Claim = function(a1) end,
}