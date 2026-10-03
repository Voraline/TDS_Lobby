-- Script path: ReplicatedStorage.Content.Flair.Achievements.Void Splitter
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Void Splitter",
    description = "Unlocked from the \"Void Splitter\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.fromRGB(89, 0, 148), Color3.fromRGB(35, 0, 69)),
}