-- Script path: ReplicatedStorage.Content.Flair.Achievements.Hype Beast
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Hype Beast",
    description = "Unlocked from the \"Hype Beast\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}