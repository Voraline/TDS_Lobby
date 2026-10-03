-- Script path: ReplicatedStorage.Content.NewEnemies.Conserver.Stats
-- Decompile time: 0.49 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 1.25,
    Health = 400000,
    Reward = 800000,
    RewardThreshold = 0.05,
    SuperComputerMultiplier = 7.5,
    ScaleWithComputerParts = false,
    HealthPerDifficulty = {Act2Easy = 80000, Act2 = 400000, Act3Easy = 150000, Act3 = 475000},
    Attributes = {Enum.Modifier.Boss},
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
                {Name = "Forsaken Skull", Delay = 0.3, Amount = 10},
                {
                    Name = "Hex Revenant",
                    Delay = 0.8,
                    Amount = 7,
                    Modifiers = {[Enum.Modifier.Bloated] = true},
                },
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