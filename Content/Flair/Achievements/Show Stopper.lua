-- Script path: ReplicatedStorage.Content.Flair.Achievements.Show Stopper
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Show Stopper",
    description = "Unlocked from the \"Show Stopper\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(0.521569, 0, 0)),
}