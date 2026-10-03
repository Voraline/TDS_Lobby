-- Script path: ReplicatedStorage.Content.Flair.Achievements.The Gambit
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "The Gambit",
    description = "Unlocked from the \"The Gambit\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}