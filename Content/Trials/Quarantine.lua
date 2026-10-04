-- Script path: ReplicatedStorage.Content.Trials.Quarantine
-- Decompile time: 0.12 ms

return {
    title = "Quarantine",
    description = "Towers cannot be placed 10 studs next to each other.",
    trial = true,
    trialMap = "Dusty Bridges",
    icon = 84005317290977,
    consumablesDisabled = true,
    skillsDisabled = false,
    trialModifiers = {"Quarantine"},
    challengeRewards = {
        experience = 185,
        coins = 1000,
        crates = {{type = "High Grade", amount = 2}},
        tickets = {Timescale = 3, Spin = 2},
        modifiers = {"Quarantine"},
    },
}