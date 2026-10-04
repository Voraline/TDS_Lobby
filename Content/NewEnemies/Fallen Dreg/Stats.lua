-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen Dreg.Stats
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 4.5,
    Health = 50,
    Reward = 120,
    Defense = 20,
    Description = "Fallen Dregs were laborers who once lived in Paradise. When the Queen's curse took hold, their bodies were engulfed with flames that burn eternally. They wear the traditional armor of their society, which once featured a bright white gem at its center. Even in death, their corpses continue to burn as a reminder of the Queen's sacrifice.",
    HealthPerDifficulty = {Fallen = 80, PVP_highRanks = 40},
    Attributes = {
        (require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.MoltenCorpse,
    },
}