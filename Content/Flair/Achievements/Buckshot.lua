-- Script path: ReplicatedStorage.Content.Flair.Achievements.Buckshot
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Buckshot",
    description = "Unlocked from the \"Buckshot\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}