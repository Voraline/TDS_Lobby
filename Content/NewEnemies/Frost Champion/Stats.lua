-- Script path: ReplicatedStorage.Content.NewEnemies.Frost Champion.Stats
-- Decompile time: 0.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Speed = 2.15,
    Scale = 1.25,
    Health = 100000,
    AttackCD = 5,
    InitialMoveCooldown = 10,
    RewardThreshold = 0.1,
    Damage = 5000,
    BuffLifetime = 2,
    SpdBuff = 10,
    HealthPerDifficulty = {Frost = 100000},
    Moveset = {
        SpearThrust = {
            Cooldown = 20,
            Radius = 25,
            IntroTime = 0.5,
            OutroTime = 0.5,
            MoveDuration = 3,
            StabDuration = 1,
            HitboxSize = Vector3.new(8, 8, 20),
            GrowTime = 0.5,
            StunDuration = 4,
            UnitDamage = 1000,
        },
        FrozenBanner = {
            Cooldown = 30,
            Radius = 30,
            BannerRadius = 15,
            BannerWindupTime = 1,
            BannerThrowDelay = 0.1,
            BannerLifetime = 30,
            CooldownDebuffTime = 30,
            CooldownDebuffAmount = -10,
            ThrowPower = 50,
        },
        Summon = {
            Cooldown = 30,
            AttackDuration = 3,
            Amount = 5,
            Delay = 0.75,
            Spawns = {{Name = "Frost Invader", Weight = 60}, {Name = "Unstable Ice", Weight = 40}},
            Modifiers = {{Chance = 100}},
        },
    },
    Reward = {
        Insane = 100000,
        Fallen = 100000,
        PVP_highRanks = 100000,
        SummerExperimental = 50000,
        Frost = 51000,
    },
    Attributes = {Enum.Modifier.FreezeImmune, Enum.Modifier.StunImmune},
}