-- Script path: ReplicatedStorage.Content.NewEnemies.Korblox Soul.Stats
-- Decompile time: 0.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 5,
    MaxHealth = 6,
    Description = "Korblox Souls are Serveabelum's slaves who perished while working in the Bubbling Pits. The chains they carry are remnants of the shackles that bound them in life, and the helmets they wear come from the ruins of the White Blind fortress. Even in death, they will serve The Korblox Empire. ",
    HealthPerDifficulty = {Easy = 40, Mega = 60, Impossible = 80},
    Reward = {Easy = 40, Mega = 80, Impossible = 80},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Hidden},
}