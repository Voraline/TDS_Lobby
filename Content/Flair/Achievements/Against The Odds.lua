-- Script path: ReplicatedStorage.Content.Flair.Achievements.Against The Odds
-- Decompile time: 0.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Against The Odds",
    description = "Unlocked from the \"Against The Odds\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(0.764706, 0.196078, 0.992157), Color3.new(0.478431, 0.160784, 0.992157)),
}