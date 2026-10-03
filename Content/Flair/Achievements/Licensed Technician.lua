-- Script path: ReplicatedStorage.Content.Flair.Achievements.Licensed Technician
-- Decompile time: 0.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Licensed Technician",
    description = "Unlocked from the \"Licensed Technician\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}