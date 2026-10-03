-- Script path: ReplicatedStorage.Content.Flair.Achievements.Blade Master
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Blade Master",
    description = "Unlocked from the \"Blade Master\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.fromRGB(214, 137, 255), Color3.fromRGB(255, 137, 224)),
}