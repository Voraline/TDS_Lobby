-- Script path: ReplicatedStorage.Content.NewEnemies.Frost Necromancer.Stats
-- Decompile time: 0.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    MaxHealth = 20000,
    HealthPerDifficulty = {Easy = 5500, Mega = 25000, Impossible = 30000, Frost = 17500},
    Reward = {Easy = 10000, Mega = 30000, Impossible = 30000, Frost = 10500},
    RewardThreshold = 0.1,
    Shield = 0,
    Speed = 3.1,
    Scale = 1.1,
    Defense = 0,
    AddedShield = 3500,
    DisplayName = "Frost Necromancer",
    Summon = {
        Amount = 9,
        Cooldown = 17.5,
        Spawns = {{Name = "Frost Undead", Chance = 60, Delay = 0.15}},
        Modifiers = {{Chance = 100}},
    },
    Attributes = {Enum.Modifier.FreezeImmune, Enum.Modifier.StunImmune},
    Description = "Frost Necromancers are artists, rejuvenating life into the corpses of the fallen and employing them to do their bidding. With staffs filled with energized ice, they willfully control their minions and grant them unique modifiers. Though shunned by the Frost Realm as tainted beings, Frost Necromancers remain beloved by the Frost Spirit to raise the dead.",
}