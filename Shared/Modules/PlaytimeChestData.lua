-- Script path: ReplicatedStorage.Shared.Modules.PlaytimeChestData
-- Decompile time: 0.68 ms

return {
    LowTierChest = {
        {weight = 0.4, value = {type = "stat", stat = "Coins", amount = 50}},
        {weight = 0.2, value = {type = "stat", stat = "TimescaleTickets", amount = 1}},
        {weight = 0.2, value = {type = "stat", stat = "SpinTickets", amount = 1}},
        {weight = 0.15, value = {type = "crate", name = "Low Grade", amount = 1}},
        {weight = 0.04, value = {type = "crate", name = "Mid Grade", amount = 1}},
        {weight = 0.01, value = {type = "consumable", name = "Blizzard Bomb", amount = 1}},
    },
    MidTierChest = {
        {weight = 0.4, value = {type = "stat", stat = "Coins", amount = 100}},
        {weight = 0.2, value = {type = "stat", stat = "TimescaleTickets", amount = 2}},
        {weight = 0.2, value = {type = "stat", stat = "SpinTickets", amount = 2}},
        {weight = 0.15, value = {type = "crate", name = "Mid Grade", amount = 1}},
        {weight = 0.04, value = {type = "crate", name = "High Grade", amount = 1}},
        {weight = 0.01, value = {type = "consumable", name = "Nuke", amount = 1}},
    },
    HighTierChest = {
        {weight = 0.4, value = {type = "stat", stat = "Coins", amount = 200}},
        {weight = 0.2, value = {type = "stat", stat = "TimescaleTickets", amount = 3}},
        {weight = 0.2, value = {type = "stat", stat = "SpinTickets", amount = 3}},
        {weight = 0.18, value = {type = "crate", name = "High Grade", amount = 1}},
        {weight = 0.01, value = {type = "consumable", name = "Nuke", amount = 1}},
        {weight = 0.01, value = {type = "consumable", name = "Molten Monster", amount = 1}},
    },
}