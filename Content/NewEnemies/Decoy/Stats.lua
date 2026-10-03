-- Script path: ReplicatedStorage.Content.NewEnemies.Decoy.Stats
-- Decompile time: 0.23 ms

game:GetService("ReplicatedStorage")
return {
    Description = "",
    Price = 1000,
    Speed = 3,
    MaxHealth = 3000,
    HealthScale = 50,
    UnitDamage = 400,
    TowerRangeDecrease = 15,
    TowerCooldownDecrease = 50,
    StunDuration = 10,
    ExplosionRadius = 9,
    HealthPerDifficulty = {Map2AdidasEasy = 3000, Map2AdidasHard = 4500, Map3AdidasEasy = 3000, Map3AdidasHard = 4500},
    Reward = {Map2AdidasEasy = 3750, Map2AdidasHard = 3750, Map3AdidasEasy = 2800, Map3AdidasHard = 3750},
    HealthPerGamemode = {Map2Adidas = {Easy = 3000, Hard = 4500}, Map3Adidas = {Easy = 3000, Hard = 4500}},
    RewardPerGamemode = {Map2Adidas = {Easy = 3750, Hard = 3750}, Map3Adidas = {Easy = 2800, Hard = 3750}},
    Attributes = {},
}