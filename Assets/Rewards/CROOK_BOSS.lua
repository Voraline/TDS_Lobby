-- Script path: ReplicatedStorage.Assets.Rewards.CROOK_BOSS
-- Decompile time: 0.55 ms

return {
    Reward = "Crook Boss Tower",
    Badge = 2124475816,
    Check = function(a1) -- Line: 6
        local Data = a1.Data
        if Data then
            local Inventory = Data.Inventory
            if Inventory then
                local Troops = Inventory.Troops
                if Troops then
                    return not Troops["Crook Boss"]
                end
            end
        end
    end,
    Claim = function(a1) -- Line: 24
        local Data = a1.Session.Data
        if Data then
            local Inventory = Data.Inventory
            if Inventory then
                local Skins = Inventory.Skins
                local Troops = Inventory.Troops
                if Skins and Troops and not Troops["Crook Boss"] then
                    Troops["Crook Boss"] = {Skin = "Default", Equipped = false}
                    Skins["Crook Boss"] = {{Name = "Default"}}
                    a1.Channel:FireClient(a1.Session.Player, "Update", "Inventory.Skins", Skins)
                    a1.Channel:FireClient(a1.Session.Player, "Update", "Inventory.Troops", Troops)
                end
            end
        end
    end,
}