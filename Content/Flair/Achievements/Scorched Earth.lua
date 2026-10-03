-- Script path: ReplicatedStorage.Content.Flair.Achievements.Scorched Earth
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Scorched Earth",
    description = "Unlocked from the \"Scorched Earth\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}