-- Script path: ReplicatedStorage.Content.Flair.PVPRank.Private II
-- Decompile time: 0.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Private II",
    description = "Unlocked from the \"Private II\" rank.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}