-- Script path: ReplicatedStorage.Content.Flair.Achievements.Thrifty
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Thrifty",
    description = "Unlocked from the \"Thrifty\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}