-- Script path: ReplicatedStorage.Content.Flair.PVPRank.Lieutenant II
-- Decompile time: 0.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Lieutenant II",
    description = "Unlocked from the \"Lieutenant II\" rank.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}