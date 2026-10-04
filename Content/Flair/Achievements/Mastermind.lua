-- Script path: ReplicatedStorage.Content.Flair.Achievements.Mastermind
-- Decompile time: 0.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Mastermind",
    description = "Unlocked from the \"Mastermind\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}