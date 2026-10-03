-- Script path: ReplicatedStorage.Content.Achievement.Winter2025.Show Stopper
-- Decompile time: 0.18 ms

return {
    title = "Show Stopper",
    description = "Triumph on Hard Mode Duos",
    objective = {type = "triumphs", mode = "Christmas2025", difficulty = "Hard", playerCount = 2},
    rewards = {
        {type = "stat", stat = "Coins", amount = 600},
        {type = "stat", stat = "SpinTickets", amount = 2},
        {type = "stat", stat = "TimescaleTickets", amount = 2},
        {type = "consumable", name = "Holy Hand Grenade", amount = 2},
        {type = "crate", name = "Showtime", amount = 1},
    },
}