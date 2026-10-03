-- Script path: ReplicatedStorage.Content.NewEnemies.Crystalian.Stats
-- Decompile time: 0.42 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "The Void Gems, if given enough time, will strengthen whatever they touch — provided it manages to survive long enough not to be cut through. Eventually, crystals will sprout from their bodies and solidify into a large solid mass while keeping their soul core intact. They are almost entirely immune to damage except in specific circumstances, and are widely feared among the army. Even so, they keep a careful watch over the wandering Souls, and will actively check to make sure none stray a bit too far.",
    Speed = 2.6,
    Health = 10000,
    Scale = 1.35,
    AttackInterval = 9,
    AttackTime = 2,
    AttackRange = 20,
    Windup = 1,
    RecoveryTime = 1,
    HealthPerDifficulty = {
        PollutedWasteland = 50000,
        PVP_highRanks = 6000,
        Trial = 25000,
        Hard = 40000,
        Easy = 50000,
    },
    Reward = {
        Fallen = 10000,
        PollutedWasteland = 150000,
        Trial = 8000,
        Hard = 20000,
        Easy = 50000,
    },
    BeamInfo = {TowerStunRadius = 3, CooldownDebuff = 25, CooldownDebuffDuration = 22, UnitDamage = 250},
    Attributes = {
        Enum.Modifier.StunImmune,
        Enum.Modifier.FreezeImmune,
        Enum.Modifier.Tank,
    },
}