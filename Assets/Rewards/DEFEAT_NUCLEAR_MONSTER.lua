-- Script path: ReplicatedStorage.Assets.Rewards.DEFEAT_NUCLEAR_MONSTER
-- Decompile time: 0.43 ms

return {
    Reward = "x1 Premium Crate",
    Badge = 2127670181,
    Claim = function(a1) -- Line: 6
        local Data = a1.Session.Data
        if Data then
            local Inventory = Data.Inventory
            if Inventory then
                local Crates = Inventory.Crates
                if Crates then
                    if not Crates.Premium then
                        Crates.Premium = 0
                    end
                    Crates.Premium = Crates.Premium + 1
                    a1.Channel:FireClient(a1.Session.Player, "Update", "Inventory.Crates", Crates)
                end
            end
        end
    end,
}