-- Script path: ReplicatedStorage.Content.NewEnemies.Void Knight.Stats
-- Decompile time: 0.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "Void Knights are the trusted warriors of Void Caster. They follow her everywhere and were the first to be woken from their slumber when the time came to march again. These Knights serve the Void Caster’s will absolutely, commanded by the Void Sword Master, her lead knight and the only one permitted to give them orders in her absence. They train without rest, sparring against one another and whatever unfortunate creatures stumble too close in the Void. They are known hunters, relentless in pursuit, and will chase a target across the nothing for as long as it takes. They do not stop. They do not tire. And they have never once failed to complete a mission, which is something the Void Sword Master makes sure everyone in the army is aware of.",
    Health = 45000,
    Speed = 2.5,
    Damage = 132,
    StunTime = 5,
    AttackCD = 12,
    SwingFOV = 20,
    HitRadius = 8,
    HealTime = 6,
    Scale = 1.2,
    HealthPerDifficulty = {Hard = 90000, Easy = 75000},
    Reward = {Fallen = 45000, Hard = 35000, Easy = 37500},
    Attributes = {Enum.Modifier.StunImmune, Enum.Modifier.FreezeImmune},
}