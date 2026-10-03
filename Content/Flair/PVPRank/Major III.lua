-- Script path: ReplicatedStorage.Content.Flair.PVPRank.Major III
-- Decompile time: 0.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Major III",
    description = "Unlocked from the \"Major III\" rank.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}