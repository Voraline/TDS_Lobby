-- Script path: ReplicatedStorage.Content.NewEnemies.Chunky Ducky.Stats
-- Decompile time: 0.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Description = "Chunky Ducky aspires to be as wide and double-thick as Fat Ducky. However, the Evil Duckies would often be found knocking Chunky Ducky over and rolling him across the room. When Chunky Ducky lies down, it's not uncommon for a duckling or two to go missing beneath him. He means well, but is simply misunderstood.",
    Health = 2500,
    Speed = 2.5,
    RewardThreshold = 0.2,
    HealthPerDifficulty = {Hard = 1500, Easy = 750},
    Reward = {Hard = 2250, Easy = 2250},
    Attributes = {
        (require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.FreezeImmune,
    },
}