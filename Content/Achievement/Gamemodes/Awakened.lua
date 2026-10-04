-- Script path: ReplicatedStorage.Content.Achievement.Gamemodes.Awakened
-- Decompile time: 0.12 ms

return {
    title = "Awakened",
    description = "Complete the Fallen Hidden wave",
    flair = "tH3 GL1tcH",
    hidden = true,
    objective = {type = "triumphs", hiddenWave = true},
    rewards = {
        {type = "stat", stat = "Coins", amount = 2000},
        {type = "stat", stat = "Gems", amount = 150},
        {type = "crate", name = "High Grade", amount = 1},
    },
}