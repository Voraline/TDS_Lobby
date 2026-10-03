-- Script path: ReplicatedStorage.Content.Flair.Achievements.Recruit
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Recruit",
    description = "Unlocked from the \"Recruit\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}