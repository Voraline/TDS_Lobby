-- Script path: ReplicatedStorage.Content.Flair.Achievements.Errand Boy
-- Decompile time: 0.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Errand Boy",
    description = "Unlocked from the \"Errand Boy\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}