-- Script path: ReplicatedStorage.Content.Flair.Achievements.Sentinel
-- Decompile time: 0.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Sentinel",
    description = "Unlocked from the \"Sentinel\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}