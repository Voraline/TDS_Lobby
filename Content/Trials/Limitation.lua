-- Script path: ReplicatedStorage.Content.Trials.Limitation
-- Decompile time: 0.15 ms

return {
    title = "Limitation",
    description = "Limitation creates creativity. Total tower limit is reduced by half",
    trial = true,
    trialMap = "Coral Deep",
    icon = 94678131230832,
    consumablesDisabled = true,
    skillsDisabled = false,
    trialModifiers = {"Limitation"},
    challengeRewards = {
        experience = 200,
        coins = 900,
        crates = {{type = "Mid Grade", amount = 2}},
        tickets = {Timescale = 1},
        modifiers = {"Limitation"},
    },
}