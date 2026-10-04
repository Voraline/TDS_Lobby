-- Script path: ReplicatedStorage.Content.Trials.Inflation
-- Decompile time: 0.12 ms

return {
    title = "Inflation",
    description = "All prices are increased by 50%.",
    trial = true,
    trialMap = "Cyber City",
    icon = 79686102216274,
    consumablesDisabled = true,
    skillsDisabled = false,
    trialModifiers = {"Inflation"},
    challengeRewards = {
        experience = 200,
        coins = 1000,
        crates = {{type = "High Grade", amount = 1}},
        tickets = {Timescale = 2, Spin = 1},
        modifiers = {"Inflation"},
    },
}