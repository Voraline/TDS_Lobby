-- Script path: ReplicatedStorage.Content.Flair.Achievements.Stylist
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Stylist",
    description = "Unlocked from the \"Stylist\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}