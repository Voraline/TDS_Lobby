-- Script path: ReplicatedStorage.Content.Achievement.Triumph.Mastermind
-- Decompile time: 0.43 ms

return {
    title = "Mastermind",
    description = "500 Triumphs in any map or gamemode",
    objective = {type = "triumphs", amount = 500},
    rewards = {
        {type = "stat", stat = "Coins", amount = 10000},
        {type = "stat", stat = "TimescaleTickets", amount = 2},
        {type = "stat", stat = "SpinTickets", amount = 2},
        {type = "crate", name = "Mid Grade", amount = 2},
    },
}