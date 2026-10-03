-- Script path: ReplicatedStorage.Content.NewEnemies.Boomer.Stats
-- Decompile time: 0.16 ms

game:GetService("ReplicatedStorage")
return {
    Price = 1000,
    Speed = 4.5,
    MaxHealth = 3000,
    HealthScale = 50,
    UnitDamage = 400,
    TowerRangeDecrease = 15,
    TowerCooldownDecrease = 50,
    StunDuration = 10,
    ExplosionRadius = 9,
    HealthPerDifficulty = {Molten = 1500, Fallen = 3000, Intermediate = 850},
    Reward = {Molten = 2500, Fallen = 3000, Intermediate = 2000},
    Attributes = {},
}