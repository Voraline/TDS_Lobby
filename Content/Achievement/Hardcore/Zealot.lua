-- Script path: ReplicatedStorage.Content.Achievement.Hardcore.Zealot
-- Decompile time: 0.13 ms

return {
    title = "Zealot",
    description = "Defeat the Void Keeper (Hardcore Mode)",
    objective = {type = "enemykill", enemy = "Void Grave Digger", mode = "Hardcore", difficulty = "Easy"},
    rewards = {
        {type = "stat", stat = "Coins", amount = 225},
        {type = "crate", name = "Mid Grade", amount = 1},
        {type = "stat", stat = "TimescaleTickets", amount = 1},
    },
}