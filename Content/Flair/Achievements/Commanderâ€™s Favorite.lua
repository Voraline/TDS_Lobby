-- Script path: ReplicatedStorage.Content.Flair.Achievements.Commander’s Favorite
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Commander’s Favorite",
    description = "Unlocked from the \"Commander’s Favorite\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}