-- Script path: ReplicatedStorage.Content.Flair.Achievements.Fully Loaded
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Fully Loaded",
    description = "Unlocked from the \"Fully Loaded\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}