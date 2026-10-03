-- Script path: ReplicatedStorage.Assets.Rewards.DOUBLE_THE_LANES_DOUBLE_THE_POWER
-- Decompile time: 0.34 ms

return {
    Reward = "x1 Basic Crate",
    Badge = 2124572828,
    Claim = function(a1) -- Line: 6
        local Data = a1.Session.Data
        if Data then
            local Inventory = Data.Inventory
            if Inventory then
                local Skins = Inventory.Skins
                local Troops = Inventory.Troops
                if Skins and Troops and not Troops["Crook Boss"] then
                    Troops["Crook Boss"] = {Skin = "Default", Equipped = false}
                    Skins["Crook Boss"] = {{Name = "Default"}}
                end
            end
        end
    end,
}