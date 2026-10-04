-- Script path: ReplicatedStorage.Content.Flair.Achievements.Vindicator
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Vindicator",
    description = "Unlocked from the \"Vindicator\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}