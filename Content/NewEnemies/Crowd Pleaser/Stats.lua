-- Script path: ReplicatedStorage.Content.NewEnemies.Crowd Pleaser.Stats
-- Decompile time: 0.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Description = "",
    Speed = 4,
    Health = 600,
    Defense = 0,
    Scale = 1.25,
    Range = 20,
    AttackDelay = 0.8,
    AttackRecharge = 4,
    FreezeDuration = 2,
    UnitDamage = 400,
    HealthPerDifficulty = {Map2AdidasEasy = 600, Map2AdidasHard = 800, Map3AdidasEasy = 600, Map3AdidasHard = 1000},
    HealthPerGamemode = {Map2Adidas = {Easy = 600, Hard = 800}, Map3Adidas = {Easy = 600, Hard = 1000}},
    ShieldPerDifficulty = {Act2Easy = 200, Act3Easy = 75, Act2 = 500, Act3 = 150},
    Reward = {Map2AdidasEasy = 750, Map2AdidasHard = 750, Map3AdidasEasy = 750, Map3AdidasHard = 750},
    RewardPerGamemode = {Map2Adidas = {Easy = 750, Hard = 750}, Map3Adidas = {Easy = 750, Hard = 750}},
    Attributes = {
        (require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.FreezeImmune,
    },
    ProjectileData = {Speed = 4, Gravity = -1, DeltaTime = 4.6},
}