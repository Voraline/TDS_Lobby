-- Script path: ReplicatedStorage.Content.NewEnemies.Snow Minion.Stats
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Health = 600,
    Speed = 1,
    RewardThreshold = 0.5,
    Defense = 0,
    Scale = 1.25,
    ThrowDebounce = 0.4,
    DebuffValue = -70,
    DebuffDuration = 5,
    WindUpTime = 1.25,
    UnitDamage = 10,
    ThrowRange = 20,
    dtMulitplier = 3,
    Velocity = 2,
    Description = "Snow Minions are rascals who enjoy terrorizing other frost creatures with snowballs. It’s believed the Snowmen learned this habit from watching the Snow Minions. While universally despised among the frost army as pests, their cunning nature makes them valuable distractions. They will throw snowballs at towers and units to freeze or slow.",
    HealthPerDifficulty = {Easy = 75, Hard = 200, Frost = 135},
    Reward = {Easy = 100, Hard = 200, Frost = 800},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}