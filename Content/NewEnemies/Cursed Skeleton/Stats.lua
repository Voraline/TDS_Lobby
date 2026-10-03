-- Script path: ReplicatedStorage.Content.NewEnemies.Cursed Skeleton.Stats
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Description = "Even in death one shall serve the Void. Corpses of those whose realms were devoured decompose in the peaceful quiet and are scavenged by Odds or Swifts. They are then brought back to the Void Caster as an offering, as she then attaches a Phantom or an Odd’s soul directly into it. Many of the Swifts, Heftys and Odds don’t like interacting with the Cursed Skeleton, as they fear what it would be like not having flesh.",
    Speed = 5.5,
    MaxHealth = 1250,
    Scale = 1,
    HealthPerDifficulty = {PollutedWasteland = 1250, Trial = 450, Hard = 150, Easy = 400},
    Reward = {Hard = 50, Easy = 150},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.HealthRegen},
}