-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Freezer.Stats
-- Decompile time: 0.43 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    DisplayName = "Null Freezer",
    Description = "The Nil Zone's creatures defy all logic. When the God Shard experiment failed, the fabric that separated the Nil Zone tore, allowing it to replicate the Overworld. Creatures morphed into Freezers with the ability to stun any tower they fired upon. For the original Freezer, it was like staring into a corrupted mirror.",
    Speed = 5.5,
    Health = 600,
    Defense = 0,
    Scale = 1.25,
    Range = 20,
    AttackDelay = 0.8,
    AttackRecharge = 4,
    FreezeDuration = 2,
    UnitDamage = 400,
    HealthPerDifficulty = {
        Act1Easy = 400,
        Act2Easy = 600,
        Act3Easy = 225,
        Act1 = 725,
        Act2 = 1000,
        Act3 = 450,
    },
    ShieldPerDifficulty = {Act2Easy = 200, Act3Easy = 75, Act2 = 500, Act3 = 150},
    Reward = {
        Act1Easy = 700,
        Act2Easy = 1000,
        Act3Easy = 300,
        Act1 = 850,
        Act2 = 1800,
        Act3 = 300,
    },
    Attributes = {
        (require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.FreezeImmune,
    },
    ProjectileData = {Speed = 1, Gravity = -1, DeltaTime = 4.6},
}