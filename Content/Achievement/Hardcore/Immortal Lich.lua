-- Script path: ReplicatedStorage.Content.Achievement.Hardcore.Immortal Lich
-- Decompile time: 0.19 ms

return {
    title = "Immortal Lich",
    description = "Defeat the Void Caster (Voidcore Mode)",
    objective = {type = "enemykill", enemy = "Void Caster", mode = "Hardcore", difficulty = "Hard"},
    rewards = {
        {type = "stat", stat = "Coins", amount = 1000},
        {type = "stat", stat = "SpinTickets", amount = 4},
        {type = "stat", stat = "TimescaleTickets", amount = 4},
        {type = "stat", stat = "Gems", amount = 100},
        {type = "badge", badgeId = 2895606253207273},
    },
}