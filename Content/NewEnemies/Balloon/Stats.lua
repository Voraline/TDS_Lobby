-- Script path: ReplicatedStorage.Content.NewEnemies.Balloon.Stats
-- Decompile time: 0.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Description = "It’s not entirely clear why they are tied to the balloon. Perhaps it was a cruel joke by the Mandrakes, but the Balloon is left stranded regardless. The Void army is organized for what its needs are and, as it turns out, the Balloons are incredibly useful in battle. At first the Void Caster simply stared at the hundreds bumping against one another in the Vault, but then praised the little bush Mandrakes for their ingenuity.",
    Shield = 50,
    Speed = 6,
    Health = 50,
    ShieldBrokenSpeed = 1.5,
    ShieldPerDifficulty = {Hard = 50, Easy = 40},
    HealthPerDifficulty = {Hard = 50, Easy = 40},
    Reward = {Hard = 25, Easy = 30},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Flying},
}