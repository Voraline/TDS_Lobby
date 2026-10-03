-- Script path: ReplicatedStorage.Content.Enemies.Headless Jaxe.Stats
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 2,
    MaxHealth = 9999,
    Archived = true,
    Attributes = {Enum.Modifier.FreezeImmune, Enum.Modifier.Boss},
}