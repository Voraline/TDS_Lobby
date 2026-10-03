-- Script path: ReplicatedStorage.Content.Achievement.Gamemodes.Cursed Soul
-- Decompile time: 0.15 ms

return {
    title = "Cursed Soul",
    description = "Triumph in Pizza Party (Solo)",
    objective = {type = "triumphs", mode = "Special", difficulty = "PizzaParty", playerCount = 1},
    rewards = {
        {type = "stat", stat = "Coins", amount = 800},
        {type = "stat", stat = "SpinTickets", amount = 2},
        {type = "stat", stat = "TimescaleTickets", amount = 2},
    },
}