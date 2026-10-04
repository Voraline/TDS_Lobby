-- Script path: ReplicatedStorage.Content.NewEnemies.Frost Hero.Stats
-- Decompile time: 0.31 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Health = 20000,
    Speed = 3,
    Defense = 0,
    RewardThreshold = 0.1,
    Scale = 1.2,
    AttackCD = 13.5,
    StunTime = 5,
    Damage = 250,
    DefenseGain = 10,
    Description = "Frost Heroes are the champions of their craft, the most fearless fighters in the Frost Spirit's army. Adorned with the finest crystallized armor and woven Crystalline Frost Spinner silk, their decorated appearance matches their weapon—forged by The Maker himself. As the most devoted members of the Frost Army, Frost Heroes are capable enough to strike and stun towers.",
    HealthPerDifficulty = {Easy = 2500, Hard = 30000, Frost = 60000},
    Reward = {Easy = 5000, Hard = 30000, Frost = 36000},
    AttackData = {{Angle = 10, Radius = 10}, {Angle = 10, Radius = 15}, {Radius = 6}},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}