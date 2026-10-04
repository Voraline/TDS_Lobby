-- Script path: ReplicatedStorage.Content.NewEnemies.Exo Follower.Stats
-- Decompile time: 0.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 6.5,
    Health = 140,
    Defense = 0,
    Description = "Once given a soul by Lefty, the Exo Follower becomes bonded to the Exo Guard. While created to perform a role, when it's not acting it will happily follow around almost anyone it finds interesting. Sometimes the Exo Follower will antagonize Narrator, but it only reminds him of the Old World days.",
    HealthPerDifficulty = {Hard = 140, Easy = 100},
    Reward = {Easy = 250, Hard = 300},
    Attributes = {},
}