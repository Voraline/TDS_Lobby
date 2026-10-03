-- Script path: ReplicatedStorage.Content.NewEnemies.Flying Ducky.Stats
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Description = "Flying Ducky joined the duck Air Force shortly after discovering he could fly. That desire for speed and weaponry in his veins set his sights on the next best thing — engineered flight. When he was young, he would gaze upon the stars at night, wishing he could eat the glistening lights above.",
    Speed = 3,
    Health = 125,
    Defense = 20,
    HealthPerDifficulty = {Hard = 75, Easy = 37, Act2 = 180},
    Reward = {Hard = 150, Easy = 150, Act2 = 150},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Flying},
}