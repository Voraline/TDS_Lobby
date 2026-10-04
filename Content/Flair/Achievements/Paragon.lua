-- Script path: ReplicatedStorage.Content.Flair.Achievements.Paragon
-- Decompile time: 0.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Paragon",
    description = "Unlocked from the \"Paragon\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.fromRGB(214, 137, 255), Color3.fromRGB(255, 137, 224)),
}