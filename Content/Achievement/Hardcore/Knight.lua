-- Script path: ReplicatedStorage.Content.Achievement.Hardcore.Knight
-- Decompile time: 0.11 ms

return {
    title = "Knight",
    description = "Defeat the Void Brute (Hardcore Mode)",
    objective = {type = "enemykill", enemy = "Void Brute", mode = "Hardcore", difficulty = "Easy"},
    rewards = {
        {type = "stat", stat = "Coins", amount = 225},
        {type = "crate", name = "Mid Grade", amount = 1},
        {type = "stat", stat = "TimescaleTickets", amount = 1},
    },
}