-- Script path: ReplicatedStorage.Content.Trials.FlyingEnemies
-- Decompile time: 0.17 ms

return {
    title = "Flying Enemies",
    description = "All enemies are flying after wave 5.",
    trial = true,
    trialMap = "Sacred Mountains",
    icon = 122227082729039,
    consumablesDisabled = true,
    skillsDisabled = false,
    trialModifiers = {"FlyingEnemies"},
    challengeRewards = {
        experience = 200,
        coins = 1000,
        crates = {{type = "High Grade", amount = 1}},
        tickets = {Timescale = 2, Spin = 1},
        modifiers = {"FlyingEnemies"},
    },
}