-- Script path: ReplicatedStorage.Content.NewEnemies.Mandrake.Stats
-- Decompile time: 0.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Description = "The Mandrake enjoys being a bush. After the flowers have consumed an Odd, if they are too weak they will oftentimes not have enough strength to turn into a Mandragora. So, these little guys do the next best thing. They have formed a clique of their own and will often run in groups to nowhere in particular. Hundreds of them would gather and march. The ones who hate them the most are the Void Pikes, who have to deal with the constant traffic blockage.",
    Speed = 4.5,
    Health = 650,
    Defense = 0,
    HealthPerDifficulty = {Hard = 750, Easy = 100},
    Reward = {Hard = 150, Easy = 50},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
    SpawnPools = {{{enemy = "Hefty", amount = 1}, {enemy = "Swift", amount = 2}, {enemy = "Odd", amount = 2}}},
}