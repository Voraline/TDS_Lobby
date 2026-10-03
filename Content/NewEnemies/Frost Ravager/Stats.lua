-- Script path: ReplicatedStorage.Content.NewEnemies.Frost Ravager.Stats
-- Decompile time: 0.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Health = 12500,
    Shield = 10000,
    Speed = 3,
    Scale = 1.25,
    RewardThreshold = 0.1,
    Defense = 40,
    BrokenShieldDefense = 0,
    TimeUntilDash = 3,
    DashTime = 5,
    DashSpeed = 5.75,
    Description = "Guardians of the Frost Realm and Frost Spirit, Frost Ravagers are deadly foes transformed into the most fearsome defensive entities. Carrying the light of the Frost Spirit, they wield thick, heavy shields made of Umbrite. As their shields are depleted, Frost Ravagers speed up toward their targets.",
    HealthPerDifficulty = {Easy = 3500, Hard = 10000, Frost = 12500},
    Reward = {Easy = 6000, Hard = 12000, Frost = 9375},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}