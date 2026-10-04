-- Script path: ReplicatedStorage.Content.Achievement.Hardcore.Void Splitter
-- Decompile time: 0.13 ms

return {
    title = "Void Splitter",
    description = "Complete one solo match of Hardcore Mode",
    objective = {type = "triumphs", mode = "Hardcore", difficulty = "Easy", playerCount = 1},
    rewards = {
        {type = "stat", stat = "Coins", amount = 1000},
        {type = "stat", stat = "SpinTickets", amount = 5},
        {type = "stat", stat = "TimescaleTickets", amount = 5},
        {type = "stat", stat = "Gems", amount = 250},
        {type = "consumable", name = "Molten Monster", amount = 1},
    },
}