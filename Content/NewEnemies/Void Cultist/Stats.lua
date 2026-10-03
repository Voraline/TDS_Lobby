-- Script path: ReplicatedStorage.Content.NewEnemies.Void Cultist.Stats
-- Decompile time: 0.43 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "The Void Cultist is a specialized Odd who found purpose in the Void. When their realms were being destroyed, they welcomed the end with open arms. For that, the Void rewarded them and Void Caster turned them into the Void Cultist. They preach the whispers of the Void and hold ceremonies for the army to partake in. Where others in the army were taken by the Void, the Cultists chose it, and they carry that distinction with quiet pride. Their devotion is expressed not through combat but through care, mending their fellow followers so that the army may march on. They are pacifists by conviction, and they chose to keep it that way.",
    Scale = 1.45,
    Speed = 2,
    Health = 20000,
    UnitDamage = 250,
    AttackIntervalMin = 6,
    AttackIntervalMax = 6,
    AttackInitialCooldown = 6,
    HealthPerDifficulty = {Hard = 20000, Easy = 15000},
    Reward = {Hard = 10000, Easy = 7500},
    StunData = {Percent = -35, Radius = 15, Duration = 5},
    Beacon = {
        SummonRange = 25,
        Lifetime = 10,
        MoveSpeed = 3,
        HealRate = 150,
        HealRadius = 25,
        SpawnDistance = 10,
    },
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}