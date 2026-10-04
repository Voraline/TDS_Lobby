-- Script path: ReplicatedStorage.Content.Achievement.Hardcore.Inquisitor
-- Decompile time: 0.14 ms

return {
    title = "Inquisitor",
    description = "Defeat the Void Keeper (Voidcore Mode)",
    objective = {type = "enemykill", enemy = "Void Grave Digger", mode = "Hardcore", difficulty = "Hard"},
    rewards = {
        {type = "stat", stat = "Coins", amount = 300},
        {type = "stat", stat = "SpinTickets", amount = 1},
        {type = "stat", stat = "TimescaleTickets", amount = 1},
        {type = "consumable", name = "Holy Hand Grenade", amount = 2},
    },
}