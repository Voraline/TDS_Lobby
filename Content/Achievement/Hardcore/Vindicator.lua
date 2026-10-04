-- Script path: ReplicatedStorage.Content.Achievement.Hardcore.Vindicator
-- Decompile time: 0.12 ms

return {
    title = "Vindicator",
    description = "Defeat the Vindicator (Voidcore Mode)",
    objective = {type = "enemykill", enemy = "Vindicator", mode = "Hardcore", difficulty = "Hard"},
    rewards = {
        {type = "stat", stat = "Coins", amount = 675},
        {type = "stat", stat = "SpinTickets", amount = 2},
        {type = "stat", stat = "TimescaleTickets", amount = 2},
        {type = "stat", stat = "Gems", amount = 25},
    },
}