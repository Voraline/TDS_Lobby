-- Script path: ReplicatedStorage.Content.Flair.Achievements.The Vault
-- Decompile time: 0.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "The Vault",
    description = "Unlocked from the \"The Vault\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}