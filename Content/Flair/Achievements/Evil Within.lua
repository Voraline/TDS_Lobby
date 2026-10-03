-- Script path: ReplicatedStorage.Content.Flair.Achievements.Evil Within
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Evil Within",
    description = "Unlocked from the \"Evil Within\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(0.92549, 0.407843, 0.407843)),
}