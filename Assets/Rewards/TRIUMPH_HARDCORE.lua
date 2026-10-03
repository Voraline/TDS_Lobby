-- Script path: ReplicatedStorage.Assets.Rewards.TRIUMPH_HARDCORE
-- Decompile time: 0.44 ms

return {
    Reward = "x1 Deluxe Crate",
    Badge = 2124629158,
    Claim = function(a1) -- Line: 6
        local Data = a1.Session.Data
        if Data then
            local Inventory = Data.Inventory
            if Inventory then
                local Crates = Inventory.Crates
                if Crates then
                    if not Crates.Deluxe then
                        Crates.Deluxe = 0
                    end
                    Crates.Deluxe = Crates.Deluxe + 1
                    a1.Channel:FireClient(a1.Session.Player, "Update", "Inventory.Crates", Crates)
                end
            end
        end
    end,
}