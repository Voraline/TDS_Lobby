-- Script path: ReplicatedStorage.Content.Trials.HealthyEnemies
-- Decompile time: 0.17 ms

return {
    title = "Healthy Enemies",
    description = "All enemies have bloated.",
    trial = true,
    trialMap = "Four Seasons",
    icon = 81512230903222,
    consumablesDisabled = true,
    skillsDisabled = false,
    trialModifiers = {"HealthyEnemies"},
    challengeRewards = {
        experience = 200,
        coins = 1000,
        crates = {{type = "High Grade", amount = 1}},
        tickets = {Timescale = 2, Spin = 1},
        modifiers = {"HealthyEnemies"},
    },
}