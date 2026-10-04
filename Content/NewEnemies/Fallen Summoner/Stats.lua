-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen Summoner.Stats
-- Decompile time: 0.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Health = 15000,
    Speed = 1.5,
    Reward = 12500,
    RewardThreshold = 0.25,
    HiddenModePerc = 0.5,
    Description = "Fallen Summoners were high priests who once called upon Two X's power to protect their people, but no one answered. Those who once commenced sacred rituals and called upon lost magic now raise armies of Necrotic Skeletons to fight in the Fallen King's apocalypse.",
    HealthPerDifficulty = {Insane = 20000, Fallen = 12500},
    Attacks = {
        Summon = {Amount = 3, Delay = 0.5, Cooldown = 20, Spawns = {{Name = "Necrotic Skeleton", Weight = 100}}},
    },
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}