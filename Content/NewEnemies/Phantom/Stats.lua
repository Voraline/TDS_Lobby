-- Script path: ReplicatedStorage.Content.NewEnemies.Phantom.Stats
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Description = "Phantoms exist as those who died within the Void. Typically, one would have to turn and accept the Void’s whispers and peacefully lay their head in the flora after the shock of losing their realm subsides and dread sets in. There are some who resent and fight the Void, but others who chose to be cradled by it. Those who surrender themselves are then turned into Phantoms and are either returned to their bodies, becoming an Odd, or stay as a spirit. When a Phantom is around, the Void Energy within them acts like a black hole by drawing in anything that’s around them. It’s not powerful, but many Odds unfortunately wander into one and are subsequently crushed to the size of a baseball.",
    Speed = 4.5,
    Health = 100,
    Hidden = true,
    HealthPerDifficulty = {Hard = 100, Easy = 70},
    Reward = {Hard = 35, Easy = 35},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Hidden},
}