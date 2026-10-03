-- Script path: ReplicatedStorage.Content.NewEnemies.Evil Ducky.Stats
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Evil Ducky is the culmination of negative emotions after the portal was deactivated. Duckies burdened with malice and hatred slowly transformed into devilish ducks that cause mayhem wherever they waddle. Evil Duckies enjoy harassing the young ducklings, at least until Grandma Duck hits them with her cane.",
    Speed = 3,
    MaxHealth = 200,
    HealthPerDifficulty = {Easy = 200, Hard = 400},
    Reward = {Hard = 125, Easy = 125},
    Attributes = {Enum.Modifier.Aggro, Enum.Modifier.ExplosionImmune},
}