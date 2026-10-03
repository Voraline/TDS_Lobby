-- Script path: ReplicatedStorage.Content.NewEnemies.Nulling.Stats
-- Decompile time: 0.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "A Nulling lurks in the depths of the Nil Zone, concealed within its vast emptiness, surviving by hunting other creatures that dwell there. These weak, unremarkable enemies instinctively follow more powerful beings. They also like to decorate themselves with whatever scraps they can find.",
    Speed = 3.25,
    Health = 15,
    HealthPerDifficulty = {
        Act1Easy = 10,
        Act2Easy = 5,
        Act3Easy = 10,
        Act1 = 15,
        Act2 = 10,
        Act3 = 40,
        NilZone = 20,
    },
    Reward = {
        Act1Easy = 15,
        Act2Easy = 15,
        Act3Easy = 20,
        Act1 = 20,
        Act2 = 40,
        Act3 = 20,
    },
    Attributes = {},
}