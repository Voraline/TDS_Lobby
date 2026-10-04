-- Script path: ReplicatedStorage.Content.Flair.Achievements.Keeper of Knowledge
-- Decompile time: 0.14 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Keeper of Knowledge",
    description = "Unlocked from the \"Keeper of Knowledge\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}