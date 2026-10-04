-- Script path: ReplicatedStorage.Content.Flair.Achievements.Doctor
-- Decompile time: 0.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Doctor",
    description = "Unlocked from the \"Doctor\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}