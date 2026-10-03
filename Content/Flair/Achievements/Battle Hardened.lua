-- Script path: ReplicatedStorage.Content.Flair.Achievements.Battle Hardened
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Battle Hardened",
    description = "Unlocked from the \"Battle Hardened\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}