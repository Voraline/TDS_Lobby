-- Script path: ReplicatedStorage.Content.Flair.Achievements.Tyrant Slayer
-- Decompile time: 0.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Tyrant Slayer",
    description = "Unlocked from the \"Tyrant Slayer\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}