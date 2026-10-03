-- Script path: ReplicatedStorage.Content.Flair.Achievements.Void Pioneer
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Void Pioneer",
    description = "Unlocked from the \"Void Pioneer\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.fromRGB(72, 0, 112), Color3.fromRGB(148, 0, 37)),
}