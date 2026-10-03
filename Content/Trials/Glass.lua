-- Script path: ReplicatedStorage.Content.Trials.Glass
-- Decompile time: 0.16 ms

return {
    title = "Glass",
    description = "Base health is set to 1.",
    trial = true,
    trialMap = "Stained Temple",
    icon = 131044068065382,
    consumablesDisabled = true,
    skillsDisabled = false,
    trialModifiers = {"Glass"},
    challengeRewards = {
        experience = 200,
        coins = 900,
        crates = {{type = "Mid Grade", amount = 2}},
        tickets = {Timescale = 1},
        modifiers = {"Glass"},
    },
}