-- Script path: ReplicatedStorage.Content.Flair.Achievements.Zealot
-- Decompile time: 0.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Zealot",
    description = "Unlocked from the \"Zealot\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}