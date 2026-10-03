-- Script path: ReplicatedStorage.Content.NewEnemies.Champion Templar.Stats
-- Decompile time: 0.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    RedTeamSkin = "Champion Templar Silver",
    BlueTeamSkin = "Champion Templar Gold",
    Description = "Champion Templars were the Fallen King's most legendary warriors. Only a handful of these fighters existed, and they were equipped with the most prestigious weaponry the kingdom could offer. When the Queen's curse swept through the kingdom, the sacred grounds protected the Templars from corruption. When the curse tainted their people into seeking out endless war, the Templars had to make a choice. They left their kingdom to join Two X, even if it meant fighting against the people they once swore to protect. In the Old World, they stood with Two X against Lord Exo's forces and were thought to be slain in the war. Although, one Templar had survived. The Fallen attempted to resurrect the others, hoping to restore the glory they once represented, but failed. The lone survivor searches to avenge what their kingdom once was, and slay their fallen King.",
    Speed = 1.5,
    Health = 10000,
    ModeTransitionTime = 2.5,
    ModeSwapCooldown = 40,
    ModeSwapAttackCD = 5,
    MaxAttacksPerMode = 3,
    DeathTime = 5,
    RewardThreshold = 0.01,
    HealthPerDifficulty = {PVP_lowRanks = 30000, PVP_midRanks = 50000, PVP_highRanks = 75000, Trial = 400000},
    Attributes = {Enum.Modifier.Boss, Enum.Modifier.StunImmune},
    Reward = {Trial = 100000},
    Moveset = {
        FocusedFire = {
            Cooldown = 6,
            AttackCooldown = 6,
            Range = 20,
            FireIntroTime = 1,
            FireDuration = 4,
            FireOutroTime = 1,
            TotalDuration = 5,
            HitboxSize = Vector3.new(8, 8, 20),
            GrowTime = 0.5,
            RateOfFire = 0.05,
            StunDuration = 4,
            UnitDamage = 600,
        },
        HammerThrow = {
            Cooldown = 10,
            AttackCooldown = 6,
            Range = 25,
            ExplosionRadius = 10,
            Velocity = 55,
            TotalDuration = 3,
            StunDuration = 4,
            UnitDamage = 600,
            RangeDecrease = -25,
        },
        FieryBoon = {
            Cooldown = 20,
            AttackCooldown = 6,
            Range = 15,
            ImpactTime = 1.2,
            TotalDuration = 2.79,
            StunDuration = 4,
            UnitDamage = 600,
            EnemyDefenseBoost = 100,
            DefenseDuration = 30,
        },
    },
}