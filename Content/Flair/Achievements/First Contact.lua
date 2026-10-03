-- Script path: ReplicatedStorage.Content.Flair.Achievements.First Contact
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "First Contact",
    description = "Unlocked from the \"First Contact\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}