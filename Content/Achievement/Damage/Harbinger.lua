-- Script path: ReplicatedStorage.Content.Achievement.Damage.Harbinger
-- Decompile time: 0.23 ms

return {
    title = "Harbinger",
    description = "Deal 100,000,000 Damage",
    lockedBehind = "Doom-bringer",
    objective = {type = "damage", amount = 100000000},
    rewards = {
        {type = "stat", stat = "Coins", amount = 1000},
        {type = "crate", name = "Mid Grade", amount = 1},
        {type = "stat", stat = "TimescaleTickets", amount = 1},
    },
}