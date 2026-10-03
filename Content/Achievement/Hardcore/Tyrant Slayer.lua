-- Script path: ReplicatedStorage.Content.Achievement.Hardcore.Tyrant Slayer
-- Decompile time: 0.16 ms

return {
    title = "Tyrant Slayer",
    description = "Defeat the Void Brute (Voidcore Mode)",
    objective = {type = "enemykill", enemy = "Void Brute", mode = "Hardcore", difficulty = "Hard"},
    rewards = {
        {type = "stat", stat = "Coins", amount = 300},
        {type = "stat", stat = "SpinTickets", amount = 1},
        {type = "stat", stat = "TimescaleTickets", amount = 1},
        {type = "consumable", name = "Nuke", amount = 1},
    },
}