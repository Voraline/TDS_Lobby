-- Script path: ReplicatedStorage.Content.Trials.Jailed
-- Decompile time: 0.12 ms

return {
    title = "Jailed",
    description = "Every wave 1 tower is disabled after wave 5.",
    trial = true,
    trialMap = "Night Station",
    icon = 108282173055832,
    consumablesDisabled = true,
    skillsDisabled = false,
    trialModifiers = {"JailedTowers"},
    challengeRewards = {
        experience = 200,
        coins = 1000,
        crates = {{type = "High Grade", amount = 1}},
        tickets = {Timescale = 2, Spin = 1},
        modifiers = {"JailedTowers"},
    },
}