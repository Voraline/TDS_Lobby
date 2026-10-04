-- Script path: ReplicatedStorage.Content.Achievement.Triumph.Commander in Chief
-- Decompile time: 0.12 ms

return {
    title = "Commander in Chief",
    description = "1000 Triumphs in any map or gamemode",
    objective = {type = "triumphs", amount = 1000},
    rewards = {
        {type = "stat", stat = "Coins", amount = 20000},
        {type = "consumable", name = "Molten Monster", amount = 2},
        {type = "stat", stat = "SpinTickets", amount = 2},
        {type = "crate", name = "High Grade", amount = 2},
    },
}