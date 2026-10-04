-- Script path: ReplicatedStorage.Content.NewEnemies.Crying Angel.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 4.5,
    MaxHealth = 350,
    Archived = true,
    Description = "The Crying Angel is a follower of the Frost Spirit. It is created when devoted members of the Frost Army undergoes handpicked transformation. Through the Frost Spirit's will, any creature can become one of these aerial beings adorned with chains, wings, and the Follower’s Halo. These transformed creatures now circle above the Frost Spirit's cathedral-like castle, tirelessly waiting for their next orders.",
    HealthPerDifficulty = {Easy = 125, Hard = 250, Frost = 350},
    Reward = {Easy = 125, Hard = 250, Frost = 350},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Flying},
}