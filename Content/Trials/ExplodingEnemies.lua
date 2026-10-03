-- Script path: ReplicatedStorage.Content.Trials.ExplodingEnemies
-- Decompile time: 0.17 ms

return {
    title = "Exploding Enemies",
    description = "All enemies explode!",
    trial = true,
    trialMap = "Wrecked Battlefield II",
    icon = 93424071036499,
    consumablesDisabled = true,
    skillsDisabled = false,
    trialModifiers = {"ExplodingEnemies"},
    challengeRewards = {
        experience = 185,
        coins = 1000,
        crates = {{type = "High Grade", amount = 2}},
        tickets = {Timescale = 3, Spin = 2},
        modifiers = {"ExplodingEnemies"},
    },
}