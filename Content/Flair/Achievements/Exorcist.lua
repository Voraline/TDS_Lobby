-- Script path: ReplicatedStorage.Content.Flair.Achievements.Exorcist
-- Decompile time: 0.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Exorcist",
    description = "Unlocked from the \"Exorcist\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(0.92549, 0.027451, 0.027451)),
}