-- Script path: ReplicatedStorage.Content.Flair.Achievements.Decimator
-- Decompile time: 0.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Decimator",
    description = "Unlocked from the \"Decimator\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}