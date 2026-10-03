-- Script path: ReplicatedStorage.Content.Flair.PVPRank.Lieutenant III
-- Decompile time: 0.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Lieutenant III",
    description = "Unlocked from the \"Lieutenant III\" rank.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}