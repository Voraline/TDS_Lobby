-- Script path: ReplicatedStorage.Content.Flair.Achievements.Arsenal
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Arsenal",
    description = "Unlocked from the \"Arsenal\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}