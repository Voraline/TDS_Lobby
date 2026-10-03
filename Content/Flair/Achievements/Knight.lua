-- Script path: ReplicatedStorage.Content.Flair.Achievements.Knight
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Knight",
    description = "Unlocked from the \"Knight\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}