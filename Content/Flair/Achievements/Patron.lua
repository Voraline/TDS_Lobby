-- Script path: ReplicatedStorage.Content.Flair.Achievements.Patron
-- Decompile time: 0.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Patron",
    description = "Unlocked from the \"Patron\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}