-- Script path: ReplicatedStorage.Content.Achievement.Hardcore.Exorcist
-- Decompile time: 0.18 ms

return {
    title = "Exorcist",
    description = "Defeat the Soul Stealer (Voidcore Mode)",
    objective = {type = "enemykill", enemy = "Soul Stealer", mode = "Hardcore", difficulty = "Hard"},
    rewards = {
        {type = "stat", stat = "Coins", amount = 800},
        {type = "stat", stat = "SpinTickets", amount = 2},
        {type = "stat", stat = "TimescaleTickets", amount = 2},
        {type = "stat", stat = "Gems", amount = 50},
    },
}