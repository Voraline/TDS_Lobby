-- Script path: ReplicatedStorage.Content.Achievement.Damage.Living Weapon
-- Decompile time: 0.16 ms

return {
    title = "Living Weapon",
    description = "Deal 10,000,000,000 Damage",
    lockedBehind = "Scorched Earth",
    objective = {type = "damage", amount = 10000000000},
    rewards = {
        {type = "stat", stat = "Coins", amount = 10000},
        {type = "crate", name = "Mid Grade", amount = 3},
        {type = "stat", stat = "TimescaleTickets", amount = 2},
    },
}