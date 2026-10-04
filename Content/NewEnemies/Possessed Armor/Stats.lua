-- Script path: ReplicatedStorage.Content.NewEnemies.Possessed Armor.Stats
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Shield = 750,
    Health = 1250,
    Defense = 50,
    Speed = 3.5,
    BrokenShieldSpeed = 5.5,
    Description = "These suits of armor once belonged to the kingdom's greatest Champions, displayed in halls of honor. When the curse swept through, the residual magic within animated them. The armor conceals something inside, and many believe it holds the souls of the lost Champions trapped within. Whether the armor truly contains the Champions' souls has yet to be discovered.",
    HealthPerDifficulty = {Fallen = 1500, PVP_highRanks = 450, SummerExperimental = 750},
    Attributes = {},
    Reward = {Fallen = 1650, PVP_highRanks = 1250, SummerExperimental = 750},
    ModifiersGiven = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.Hidden},
}