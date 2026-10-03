-- Script path: ReplicatedStorage.Content.NewEnemies.Drakobloxxer.Stats
-- Decompile time: 0.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 1,
    DisplayName = "Primordial Drakobloxxer",
    Defense = 10,
    GlobalAttackCooldown = 12,
    HealthPhase2 = 0.5,
    LaneSwitchOffset = 2,
    HealthPerDifficulty = {Act3Easy = 250000, Act3 = 1250000},
    Reward = {Act3 = 5000000, Act3Easy = 500000},
    RewardThreshold = {Act3 = 0.025, Act3Easy = 0.05},
    Attributes = {
        Enum.Modifier.Boss,
        Enum.Modifier.StunImmune,
        Enum.Modifier.FreezeImmune,
    },
    Phase2Stats = {Speed = 1.5, GlobalAttackCooldown = 8},
    LaneSwitch = {65, 120, 160},
    AttackData = {
        ["Nightmare Tear"] = {
            PathDistanceDevide = 2,
            AmountSpawns = 5,
            DistanceSpawnAhead = 15,
            Cooldown = 40,
            StartCooldown = 30,
            PhaseAllowed = 2,
            Spawns = {
                {
                    Name = "Unknown Boss",
                    Chance = 20,
                    Amount = 1,
                    RandomModifiers = {
                        [Enum.Modifier.Nimble] = true,
                        [Enum.Modifier.HealthRegen] = true,
                    },
                    Modifiers = {
                        [Enum.Modifier.Aggro] = true,
                        [Enum.Modifier.Bloated] = true,
                    },
                    Stats = {Health = 2000},
                },
                {
                    Name = "Unknown Small",
                    Chance = 40,
                    Amount = 1,
                    RandomModifiers = {},
                    Modifiers = {
                        [Enum.Modifier.Aggro] = true,
                        [Enum.Modifier.Bloated] = true,
                    },
                    Stats = {Health = 2000},
                },
                {
                    Name = "Unknown Small",
                    Chance = 20,
                    Amount = 1,
                    RandomModifiers = {},
                    Modifiers = {
                        [Enum.Modifier.Aggro] = true,
                        [Enum.Modifier.Bloated] = true,
                    },
                    Stats = {Health = 2000},
                },
            },
        },
        ["Enemy Summon"] = {
            Cooldown = 30,
            StartCooldown = 10,
            PhaseAllowed = 1,
            Spawns = {{Name = "Unknown Boss", Amount = 2, Delay = 0.5, Modifiers = {}}},
        },
        ["Nightmare Blast"] = {
            Cooldown = 50,
            StartCooldown = 40,
            TowerStunDuration = 5,
            UnitDamage = 2100,
            Radius = 50,
            PhaseAllowed = 1,
        },
        ["Super Dupa Laser"] = {
            Cooldown = 30,
            StartCooldown = 20,
            Y = 20,
            LifeTime = 4,
            RotationSpeed = 180,
            Range = 90,
            UnitDamage = 300,
            TowerStunDuration = 6,
            Size = 10,
            PhaseAllowed = 2,
        },
        ["Nightmare Storm"] = {
            Cooldown = 35,
            StartCooldown = 10,
            CoolDownDuration = 10,
            Amount = 60,
            PhaseAllowed = 1,
        },
    },
}