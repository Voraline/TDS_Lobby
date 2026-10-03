-- Script path: ReplicatedStorage.Content.Flair.Achievements.Immortal Lich
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Immortal Lich",
    description = "Unlocked from the \"Immortal Lich\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.fromRGB(89, 0, 148), Color3.fromRGB(35, 0, 69)),
}