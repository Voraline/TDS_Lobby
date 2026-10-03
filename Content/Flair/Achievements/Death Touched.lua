-- Script path: ReplicatedStorage.Content.Flair.Achievements.Death Touched
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Evil Within",
    description = "Unlocked from the \"Evil Within\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(0.196078, 0.67451, 0.992157), Color3.new(0.160784, 0.992157, 0.407843)),
}