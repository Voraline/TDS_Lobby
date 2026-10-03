-- Script path: ReplicatedStorage.Content.NewEnemies.Elite Phantom.Stats
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Description = "The Elite Phantom has existed long enough to draw in and crush countless others within its core that it has enhanced its natural abilities. The pull around them is stronger, to the point that standing next to one is a sure-fire way to be dragged into an unfortunate end. The sound around them also seems to distort, but it is still not known why.",
    Speed = 5,
    Health = 2000,
    Scale = 1.4,
    HealthPerDifficulty = {Hard = 3500, Easy = 3250, NilZone2 = 300},
    Reward = {Hard = 500, Easy = 1600, NilZone2 = 300},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Hidden},
}