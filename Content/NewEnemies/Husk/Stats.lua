-- Script path: ReplicatedStorage.Content.NewEnemies.Husk.Stats
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 6,
    MaxHealth = 200,
    Reward = 400,
    Archived = true,
    Attributes = {
        (require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.MoltenCorpse,
    },
}