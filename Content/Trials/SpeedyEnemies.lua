-- Script path: ReplicatedStorage.Content.Trials.SpeedyEnemies
-- Decompile time: 0.15 ms

return {
    title = "Speedy Enemies",
    description = "All enemies have nimble.",
    trial = true,
    trialMap = "Wrecked Battlefield",
    icon = 120242518964452,
    consumablesDisabled = true,
    skillsDisabled = false,
    trialModifiers = {"SpeedyEnemies"},
    challengeRewards = {
        experience = 200,
        coins = 1000,
        crates = {{type = "High Grade", amount = 1}},
        tickets = {Timescale = 2, Spin = 1},
        modifiers = {"SpeedyEnemies"},
    },
}