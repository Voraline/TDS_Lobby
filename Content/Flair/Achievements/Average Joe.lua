-- Script path: ReplicatedStorage.Content.Flair.Achievements.Average Joe
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Average Joe",
    description = "Unlocked from the \"Average Joe\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}