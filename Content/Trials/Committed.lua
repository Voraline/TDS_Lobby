-- Script path: ReplicatedStorage.Content.Trials.Committed
-- Decompile time: 0.18 ms

return {
    title = "Committed",
    description = "Every tower placement is final. Towers cannot be sold!",
    trial = true,
    trialMap = "Retro Zone",
    icon = 117561617617200,
    consumablesDisabled = true,
    skillsDisabled = false,
    trialModifiers = {"Committed"},
    challengeRewards = {
        experience = 200,
        coins = 900,
        crates = {{type = "Mid Grade", amount = 2}},
        tickets = {Timescale = 1},
        modifiers = {"Committed"},
    },
}