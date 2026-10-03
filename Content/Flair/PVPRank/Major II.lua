-- Script path: ReplicatedStorage.Content.Flair.PVPRank.Major II
-- Decompile time: 0.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Major II",
    description = "Unlocked from the \"Major II\" rank.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}