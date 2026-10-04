-- Script path: ReplicatedStorage.Content.Trials.HiddenEnemies
-- Decompile time: 0.13 ms

return {
    title = "Hidden Enemies",
    description = "All enemies are hidden after wave 5.",
    trial = true,
    trialMap = "Forgetten Docks",
    icon = 116053659618976,
    consumablesDisabled = true,
    skillsDisabled = false,
    trialModifiers = {"HiddenEnemies"},
    challengeRewards = {
        experience = 200,
        coins = 1000,
        crates = {{type = "High Grade", amount = 1}},
        tickets = {Timescale = 2, Spin = 1},
        modifiers = {"HiddenEnemies"},
    },
}