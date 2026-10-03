-- Script path: ReplicatedStorage.Content.Achievement.Hardcore.Blade Master
-- Decompile time: 0.17 ms

return {
    title = "Blade Master",
    description = "Defeat the Void Swordmaster (Voidcore Mode)",
    objective = {type = "enemykill", enemy = "Void Swordmaster", mode = "Hardcore", difficulty = "Hard"},
    rewards = {
        {type = "stat", stat = "Coins", amount = 900},
        {type = "stat", stat = "SpinTickets", amount = 3},
        {type = "stat", stat = "TimescaleTickets", amount = 3},
        {type = "stat", stat = "Gems", amount = 50},
    },
}