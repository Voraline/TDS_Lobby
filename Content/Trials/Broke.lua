-- Script path: ReplicatedStorage.Content.Trials.Broke
-- Decompile time: 0.19 ms

return {
    title = "Broke",
    description = "All income sources are reduced by 33%.",
    trial = true,
    trialMap = "Medieval Times",
    icon = 121100755621424,
    consumablesDisabled = true,
    skillsDisabled = false,
    trialModifiers = {"Broke"},
    challengeRewards = {
        experience = 200,
        coins = 1000,
        crates = {{type = "High Grade", amount = 1}},
        tickets = {Timescale = 2, Spin = 1},
        modifiers = {"Broke"},
    },
}