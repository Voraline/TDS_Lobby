-- Script path: ReplicatedStorage.Content.Achievement.Damage.Scorched Earth
-- Decompile time: 0.17 ms

return {
    title = "Scorched Earth",
    description = "Deal 1,000,000,000 Damage",
    lockedBehind = "Harbinger",
    objective = {type = "damage", amount = 1000000000},
    rewards = {
        {type = "stat", stat = "Coins", amount = 3000},
        {type = "crate", name = "Mid Grade", amount = 2},
        {type = "stat", stat = "TimescaleTickets", amount = 1},
    },
}