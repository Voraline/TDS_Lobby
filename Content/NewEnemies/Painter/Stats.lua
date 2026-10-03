-- Script path: ReplicatedStorage.Content.NewEnemies.Painter.Stats
-- Decompile time: 0.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    MaxHealth = 20000,
    RewardThreshold = 0.2,
    Speed = 3,
    Description = "The Painters are known for being the actual legends in their field. When they are around, things just become cooler. The Producer would run to Narrator and tell him, 'Honey, we have guests. Bring out the fine paintings.'",
    HealthPerDifficulty = {Easy = 10000, Hard = 30000},
    Reward = {Easy = 25000, Hard = 20000},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
    Abilities = {
        PaintSplatter = {
            AttackTime = 1,
            Cooldown = 30,
            AttackCooldown = 3,
            Range = 25,
            RangeDebuff = 33,
            DebuffDuration = 8,
            UnitDamage = 1600,
            SpreadCount = 4,
            ThrowPower = 50,
            SpreadPower = 35,
            SpreadRadius = 15,
            HitscanRadius = 2,
        },
        Summon = {
            Cooldown = 9,
            AttackCooldown = 5,
            SummonTime = 3,
            Spawns = {
                {Name = "Actor1", Chance = 60},
                {Name = "Actor2", Chance = 30},
                {Name = "Actor3", Chance = 10},
            },
            Modifiers = {{Chance = 40}},
        },
    },
}