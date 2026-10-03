-- Script path: ReplicatedStorage.Content.Flair.Achievements.Special Agent
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Special Agent",
    description = "Unlocked from the \"Special Agent\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}