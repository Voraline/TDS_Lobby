-- Script path: ReplicatedStorage.Content.Flair.Achievements.Plague Doctor
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Plague Doctor",
    description = "Unlocked from the \"Plague Doctor\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}