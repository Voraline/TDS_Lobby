-- Script path: ReplicatedStorage.Content.Achievement.Hardcore.Void Pioneer
-- Decompile time: 0.21 ms

return {
    title = "Void Pioneer",
    description = "Complete Voidcore Mode on 3 different maps",
    objective = {type = "triumphs", mode = "Hardcore", difficulty = "Hard", amount = 3},
    rewards = {
        {type = "stat", stat = "Coins", amount = 1000},
        {type = "stat", stat = "SpinTickets", amount = 6},
        {type = "stat", stat = "TimescaleTickets", amount = 4},
        {type = "stat", stat = "ReviveTickets", amount = 2},
        {type = "stat", stat = "Gems", amount = 300},
        {type = "consumable", name = "Holy Hand Grenade", amount = 2},
    },
}