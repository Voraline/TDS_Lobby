-- Script path: ReplicatedStorage.Content.Achievement.Hardcore.Paragon
-- Decompile time: 0.17 ms

return {
    title = "Paragon",
    description = "Defeat the Void Reaver (Hardcore Mode)",
    objective = {type = "enemykill", enemy = "Void Reaver", mode = "Hardcore", difficulty = "Easy"},
    rewards = {
        {type = "stat", stat = "Coins", amount = 750},
        {type = "crate", name = "High Grade", amount = 1},
        {type = "stat", stat = "TimescaleTickets", amount = 2},
        {type = "stat", stat = "Gems", amount = 100},
    },
}