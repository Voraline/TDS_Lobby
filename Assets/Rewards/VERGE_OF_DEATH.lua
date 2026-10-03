-- Script path: ReplicatedStorage.Assets.Rewards.VERGE_OF_DEATH
-- Decompile time: 0.39 ms

return {
    Reward = "x1 Premium Crate",
    Badge = 2124582922,
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