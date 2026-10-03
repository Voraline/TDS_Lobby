-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Titus.Stats
-- Decompile time: 0.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Scale = 2,
    Speed = 0.55,
    Health = 40000,
    RewardThreshold = 0.005,
    Defense = 15,
    HealthPerDifficulty = {
        Act1Easy = 15000,
        Act1 = 40000,
        Act3 = 80000,
        Act3Easy = 30000,
        NilZone2 = 1000000,
    },
    Reward = {NilZone2 = 2500000},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Boss},
    DifficultyIntro = {
        NilZone2 = {
            DisplayName = "Big Titus",
            GrowDelay = 1,
            GrowDuration = 1.5,
            DialogDelay = 2.75,
            Dialog = {
                Speaker = "CorruptedTitus",
                DisplayName = "Big Titus",
                Emotion = "Neutral",
                Text = "Haha! I’m big Titus!",
                Voice = 70992425533068,
                OverrideSetting = true,
            },
            FootstepShake = {Intensity = 3, Radius = 50, StepPhases = {0, 0.5}},
        },
    },
    GlobalCoolDown = {5, 10},
    Attacks = {
        voidStream = {
            CoolDown = 30,
            StartCoolDown = 10,
            Range = 45,
            Debuff = 120,
            Length = 5,
            HealingAmount = 300,
        },
        darkDecoy = {
            CoolDown = 45,
            StartCoolDown = 20,
            DefenseGain = 5,
            Spawns = {
                {Name = "Void Portal", Delay = 1, Amount = 1},
                {Name = "Corrupted Accelerator", Delay = 1, Amount = 1},
                {Name = "Void Brute", Delay = 0.05, Amount = 1},
            },
        },
    },
}