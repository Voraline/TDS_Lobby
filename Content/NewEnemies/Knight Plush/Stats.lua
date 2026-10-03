-- Script path: ReplicatedStorage.Content.NewEnemies.Knight Plush.Stats
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 7,
    Health = 300,
    Shield = 150,
    Reward = 700,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Lead},
}