-- Script path: ReplicatedStorage.Content.Flair.Achievements.Slayer
-- Decompile time: 0.14 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Slayer",
    description = "Unlocked from the \"Slayer\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}