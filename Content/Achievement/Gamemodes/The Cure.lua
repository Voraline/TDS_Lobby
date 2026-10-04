-- Script path: ReplicatedStorage.Content.Achievement.Gamemodes.The Cure
-- Decompile time: 0.17 ms

return {
    title = "The Cure",
    description = "Triumph Polluted Wastelands 2 (Solo)",
    hidden = true,
    objective = {type = "triumphs", mode = "Special", difficulty = "PollutedWasteland", playerCount = 1},
    rewards = {
        {type = "stat", stat = "Coins", amount = 1250},
        {type = "stat", stat = "Gems", amount = 100},
        {type = "stat", stat = "SpinTickets", amount = 2},
        {type = "stat", stat = "TimescaleTickets", amount = 2},
    },
}