-- Script path: ReplicatedStorage.Content.Flair.Achievements.Usurper
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Usurper",
    description = "Unlocked from the \"Usurper\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}