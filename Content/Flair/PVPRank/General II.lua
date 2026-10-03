-- Script path: ReplicatedStorage.Content.Flair.PVPRank.General II
-- Decompile time: 0.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "General II",
    description = "Unlocked from the \"General II\" rank.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}