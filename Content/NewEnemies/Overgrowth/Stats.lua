-- Script path: ReplicatedStorage.Content.NewEnemies.Overgrowth.Stats
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    DisplayName = "Lurker",
    Speed = 4,
    MaxHealth = 400,
    Defense = 50,
    Reward = 350,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Hidden},
}