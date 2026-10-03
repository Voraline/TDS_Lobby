-- Script path: ReplicatedStorage.Content.Achievement.Towers.Weaponsmith
-- Decompile time: 0.15 ms

return {
    title = "Weaponsmith",
    description = "Collect 20 Towers",
    lockedBehind = "Arsenal",
    objective = {type = "tower", amount = 20},
    rewards = {
        {type = "stat", stat = "Coins", amount = 1500},
        {type = "stat", stat = "SpinTickets", amount = 1},
        {type = "stat", stat = "TimescaleTickets", amount = 1},
    },
}