-- Script path: ReplicatedStorage.Content.NewEnemies.Lead Balloon.Stats
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    DisplayName = "SUPER MEGA LEAD BALLOON",
    Shield = 1,
    Speed = 0.5,
    MaxHealth = 99999999999999,
    Reward = 1000,
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Flying},
}