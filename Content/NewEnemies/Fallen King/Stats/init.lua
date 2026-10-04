-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen King.Stats
-- Decompile time: 1.04 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
return {
    Health = 250000,
    MaxHealth = 250000,
    Speed = 1.4,
    RageSpeed = 2.3,
    Reward = 200000,
    RewardThreshold = 0.05,
    RageModePercentage = 0.5,
    BoneArmorPercentage = 20,
    MaxIncreasedDefense = 60,
    DefenseIncrease = 15,
    RageStunRadius = 30,
    CashReward = 50000,
    FakeWaveTime = 60,
    Description = "The Fallen King once ruled his kingdom with wisdom and compassion. When magic began to fade, he searched everywhere for salvation, but failed. When he returned, it was too late. As a last resort, the Queen used her life to cast an ancient spell, believing it would bring magic back to their kingdom. Instead, it released a curse that consumed everything. Now, he rules an empty kingdom with an insatiable army that only hungers for battle. They raid endlessly, fighting because war is the only outlet they have left. Deep within, despite him not recognizing it, the King searches for someone strong enough to end his torment and finally grant him the peace he failed to give his people.",
    HealthPerDifficulty = {Fallen = 250000, PVP_highRanks = 75000, SummerExperimental = 125000},
    PhaseInfo = {
        SmashStunTime = 5,
        SmashStunRadius = 70,
        Defense = 50,
        Speed = 1.3,
        RageSpeed = 2.3,
        MaxHealth = 1000000,
        Health = 1000000,
        UnitDamage = 200,
    },
    RestrictedGameModes = {"Hardcore"},
    CanTriggerPhase2 = function(a1) -- Line: 43 -- upvalues: GameState (val)
        if GameState.HiddenWaveBypass then
            return true
        end
        if GameState.ConsumableUsed
            or GameState.ChallengeTimestamp
            or not GameState.ChatHiddenWave
            or 60 < a1.TimeToKill
            or GameState.Health ~= 1 then
            return false
        end
        return true
    end,
    FakeWave = require(script.FakeWave),
    HiddenDialog = {
        {
            Msg = "GREETINGS PLAYER.",
            Speaker = "Unknown",
            Duration = 5,
            RichText = true,
            Glitch = true,
            Blip = "Blip3",
            Emotion = "Neutral",
        },
        {
            Msg = "YOU HAVE PROVED YOURSELF QUITE SKILLFUL SO FAR...",
            Speaker = "Unknown",
            Duration = 7,
            Glitch = true,
            Blip = "Blip3",
            Emotion = "Neutral",
        },
        {
            Msg = "BUT HOW SKILLFUL DO YOU THINK YOU ACTUALLY ARE?",
            Speaker = "Unknown",
            Duration = 7,
            Glitch = true,
            Blip = "Blip3",
            Emotion = "Neutral",
        },
        {
            Msg = "Wh. What is happening???",
            Speaker = "Commander",
            Emotion = "Aggressive",
            Duration = 4,
            Blip = "Blip",
            Flipped = true,
            DelayDuration = 3,
        },
    },
    Attacks = {
        UndeadCharge = {PhaseAllowed = 1, Cooldown = 45, Spawns = {["Necrotic Skeleton"] = {Amount = 5, Delay = 0.25}}},
        SwordSwing = {
            PhaseAllowed = 1,
            Cooldown = 25,
            Radius = 15,
            Angle = 180,
            FullAngle = 360,
            UnitDamage = 100,
        },
        FallenComet = {PhaseAllowed = 1, Cooldown = 45, StunDuration = 5, UnitDamage = 50},
        Summon = {
            PhaseAllowed = 1,
            OnlyRunOnce = true,
            Cooldown = 15,
            Spawns = {
                {Enemy = "Possessed Armor", Chance = 20},
                {Enemy = "Corrupted Fallen", Chance = 20},
                {Enemy = "Fallen Hero", Chance = 20},
                {Enemy = "Fallen Giant", Chance = 20},
                {Enemy = "Fallen Necromancer", Chance = 20},
            },
            AwakenedSpawns = {
                {Enemy = "Fallen Hero", Chance = 40},
                {Enemy = "Fallen Giant", Chance = 40},
                {Enemy = "Fallen Shield", Chance = 20},
            },
        },
    },
    Attributes = {Enum.Modifier.Boss, Enum.Modifier.StunImmune},
}