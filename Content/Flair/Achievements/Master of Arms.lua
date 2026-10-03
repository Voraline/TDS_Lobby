-- Script path: ReplicatedStorage.Content.Flair.Achievements.Master of Arms
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Master of Arms",
    description = "Unlocked from the \"Master of Arms\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}