-- Script path: ReplicatedStorage.Content.Achievement.Gamemodes.Outlaw
-- Decompile time: 0.11 ms

return {
    title = "Outlaw",
    description = "Triumph in Badlands (Solo)",
    objective = {type = "triumphs", mode = "Special", difficulty = "Badlands", playerCount = 1},
    rewards = {
        {type = "stat", stat = "Coins", amount = 1000},
        {type = "stat", stat = "SpinTickets", amount = 2},
        {type = "stat", stat = "TimescaleTickets", amount = 2},
    },
}