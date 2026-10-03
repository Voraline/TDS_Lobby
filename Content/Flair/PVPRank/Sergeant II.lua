-- Script path: ReplicatedStorage.Content.Flair.PVPRank.Sergeant II
-- Decompile time: 0.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Sergeant II",
    description = "Unlocked from the \"Sergeant II\" rank.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}