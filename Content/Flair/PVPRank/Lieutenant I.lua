-- Script path: ReplicatedStorage.Content.Flair.PVPRank.Lieutenant I
-- Decompile time: 0.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Lieutenant I",
    description = "Unlocked from the \"Lieutenant I\" rank.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}