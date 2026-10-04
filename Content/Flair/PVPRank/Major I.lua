-- Script path: ReplicatedStorage.Content.Flair.PVPRank.Major I
-- Decompile time: 0.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Major I",
    description = "Unlocked from the \"Major I\" rank.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}