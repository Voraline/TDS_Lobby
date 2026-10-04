-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Goon.Stats
-- Decompile time: 0.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    DisplayName = "Null Goon",
    Description = "The Null Goons stumbled forward in formation. Each carried weapons identical to the originals. One Goon spat on the ground and muttered, \"Cheech ain't gonna' like this.\" But as the Null Goons raised their weapons, the originals did the same. “We'll tell 'em we had'ta deliver a pizza.” Said another.",
    Speed = 4.5,
    Scale = 1.1,
    Health = 300,
    Reward = 75,
    HealthPerDifficulty = {
        Act1Easy = 75,
        Act3Easy = 75,
        Act1 = 150,
        Act2 = 750,
        Act3 = 200,
    },
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Hidden},
}