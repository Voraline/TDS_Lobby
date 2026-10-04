-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Pyromancer.Stats
-- Decompile time: 0.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    DisplayName = "Null Pyromancer",
    Description = "As the Null Pyro emerged from the Nil Zone's depths, purple sludge dripped from its gaping mouth. Pyro watched with a mixture of fascination and disgust, flames burning in his eyes as a creepy grin crossed his face. The creature rose to its feet, and as it stood, Pyro's flamethrower ignited.",
    Speed = 3.75,
    Health = 4000,
    Defense = 40,
    Scale = 1.5,
    RewardThreshold = 0.25,
    AttackDelay = 2.1,
    AttackRecharge = 10,
    Range = 6,
    Angle = 60,
    FireRange = 20,
    ScaredDebuff = 15,
    ScaredDuration = 6,
    CooldownDebuff = -30,
    CooldownDuration = 6,
    UnitDamage = 1000,
    HealthPerDifficulty = {
        Act1Easy = 1750,
        Act2Easy = 15000,
        Act3Easy = 1500,
        Act1 = 2000,
        Act2 = 50000,
        Act3 = 2500,
    },
    ShieldPerDifficulty = {Act1 = 1500, Act3 = 1500, Act3Easy = 750},
    Reward = {
        Act1Easy = 4000,
        Act2Easy = 25000,
        Act3Easy = 3200,
        Act1 = 5000,
        Act2 = 35000,
        Act3 = 3200,
    },
    Attributes = {
        Enum.Modifier.StunImmune,
        Enum.Modifier.FireImmune,
        Enum.Modifier.FreezeImmune,
    },
}