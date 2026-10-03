-- Script path: ReplicatedStorage.Content.Flair.Achievements.Undergrad
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Undergrad",
    description = "Unlocked from the \"Undergrad\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}