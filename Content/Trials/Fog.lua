-- Script path: ReplicatedStorage.Content.Trials.Fog
-- Decompile time: 0.18 ms

return {
    title = "Fog",
    description = "Tower range is reduced by 35%.",
    trial = true,
    trialMap = "Winter Abyss",
    icon = 84744520127830,
    consumablesDisabled = true,
    skillsDisabled = false,
    trialModifiers = {"Fog"},
    challengeRewards = {
        experience = 185,
        coins = 1000,
        crates = {{type = "High Grade", amount = 2}},
        tickets = {Timescale = 3, Spin = 2},
        modifiers = {"Fog"},
    },
}