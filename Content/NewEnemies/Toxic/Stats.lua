-- Script path: ReplicatedStorage.Content.NewEnemies.Toxic.Stats
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    MaxHealth = 1000,
    Speed = 6,
    Reward = 750,
    Archived = true,
    Attributes = {
        (require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.MoltenCorpse,
    },
}