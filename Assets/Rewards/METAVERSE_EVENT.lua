-- Script path: ReplicatedStorage.Assets.Rewards.METAVERSE_EVENT
-- Decompile time: 0.40 ms

return {
    Reward = "x1 Basic Crate",
    Badge = 2124634239,
    Claim = function(a1) -- Line: 6
        local Data = a1.Session.Data
        if Data then
            local Inventory = Data.Inventory
            if Inventory then
                local Crates = Inventory.Crates
                if Crates then
                    if not Crates.Basic then
                        Crates.Basic = 0
                    end
                    Crates.Basic = Crates.Basic + 1
                    a1.Channel:FireClient(a1.Session.Player, "Update", "Inventory.Crates", Crates)
                end
            end
        end
    end,
}