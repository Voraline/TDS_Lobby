-- Script path: ReplicatedStorage.Content.Achievement.Hardcore.Ronin
-- Decompile time: 0.16 ms

return {
    title = "Ronin",
    description = "Defeat the Void Swordmaster (Hardcore Mode)",
    objective = {type = "enemykill", enemy = "Void Swordmaster", mode = "Hardcore", difficulty = "Easy"},
    rewards = {
        {type = "stat", stat = "Coins", amount = 675},
        {type = "crate", name = "Mid Grade", amount = 2},
        {type = "stat", stat = "TimescaleTickets", amount = 1},
    },
}