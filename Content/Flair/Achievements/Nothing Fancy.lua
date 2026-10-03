-- Script path: ReplicatedStorage.Content.Flair.Achievements.Nothing Fancy
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Nothing Fancy",
    description = "Unlocked from the \"Nothing Fancy\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}