-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Conserver.Stats
-- Decompile time: 0.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Speed = 1,
    Health = 400000,
    RewardThreshold = 0.1,
    SuperComputerMultiplier = 7.5,
    ScaleWithComputerParts = false,
    HealthPerDifficulty = {
        Act2Easy = 80000,
        Act2 = 400000,
        Act3Easy = 150000,
        Act3 = 475000,
        NilZone = 462500,
    },
    Reward = {
        Act2Easy = 150000,
        Act2 = 150000,
        Act3Easy = 150000,
        Act3 = 150000,
        NilZone = 600000,
    },
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Boss},
    GlobalCoolDown = {5, 10},
    Attacks = {
        voidSmash = {
            CoolDown = 38,
            StartCoolDown = 5,
            ThornStunDuration = 4,
            ThornRange = 40,
            ThornSize = 10,
            ThornDuration = 2,
        },
        summon = {
            CoolDown = 35,
            StartCoolDown = 20,
            HealthGain = 1000,
            Spawns = {
                {Name = "Enigma", Delay = 0.3, Amount = 5},
                {Name = "Actor2", Delay = 0.8, Amount = 10},
                {Name = "Unknown Boss", Delay = 0.8, Amount = 5},
            },
        },
        spiritRelease = {
            CoolDown = 45,
            StartCoolDown = 5,
            ScaredDuration = 10,
            ScaredDebuff = 40,
            Speed = 1.25,
            MaxAmount = 20,
            Range = 1000,
            StunTime = 3,
        },
    },
}