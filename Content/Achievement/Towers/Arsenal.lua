-- Script path: ReplicatedStorage.Content.Achievement.Towers.Arsenal
-- Decompile time: 0.09 ms

return {
    title = "Arsenal",
    description = "Collect 10 Towers",
    lockedBehind = "Fully Loaded",
    objective = {type = "tower", amount = 10},
    rewards = {
        {type = "stat", stat = "Coins", amount = 750},
        {type = "stat", stat = "TimescaleTickets", amount = 1},
    },
}