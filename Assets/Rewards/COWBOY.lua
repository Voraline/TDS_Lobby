-- Script path: ReplicatedStorage.Assets.Rewards.COWBOY
-- Decompile time: 0.59 ms

return {
    Reward = "Cowboy Tower",
    Badge = 2124474327,
    Check = function(a1) -- Line: 6
        local Data = a1.Data
        if Data then
            local Inventory = Data.Inventory
            if Inventory then
                local Troops = Inventory.Troops
                if Troops then
                    return not Troops.Cowboy
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
                if Skins and Troops and not Troops.Cowboy then
                    Troops.Cowboy = {Skin = "Default", Equipped = false}
                    Skins.Cowboy = {{Name = "Default"}}
                    a1.Channel:FireClient(a1.Session.Player, "Update", "Inventory.Skins", Skins)
                    a1.Channel:FireClient(a1.Session.Player, "Update", "Inventory.Troops", Troops)
                end
            end
        end
    end,
}