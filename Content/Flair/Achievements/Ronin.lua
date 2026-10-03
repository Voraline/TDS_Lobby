-- Script path: ReplicatedStorage.Content.Flair.Achievements.Ronin
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Ronin",
    description = "Unlocked from the \"Ronin\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}