-- Script path: ReplicatedStorage.Content.Achievement.Towers.Master of Arms
-- Decompile time: 0.11 ms

return {
    title = "Master of Arms",
    description = "Collect 30 Towers",
    lockedBehind = "Weaponsmith",
    objective = {type = "tower", amount = 30},
    rewards = {
        {type = "stat", stat = "Coins", amount = 5000},
        {type = "stat", stat = "SpinTickets", amount = 2},
        {type = "stat", stat = "TimescaleTickets", amount = 2},
    },
}