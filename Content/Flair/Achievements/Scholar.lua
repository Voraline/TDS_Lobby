-- Script path: ReplicatedStorage.Content.Flair.Achievements.Scholar
-- Decompile time: 0.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Scholar",
    description = "Unlocked from the \"Scholar\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}