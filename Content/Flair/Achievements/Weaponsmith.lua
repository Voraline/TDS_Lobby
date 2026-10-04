-- Script path: ReplicatedStorage.Content.Flair.Achievements.Weaponsmith
-- Decompile time: 0.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Weaponsmith",
    description = "Unlocked from the \"Weaponsmith\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}