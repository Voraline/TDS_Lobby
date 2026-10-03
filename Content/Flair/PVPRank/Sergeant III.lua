-- Script path: ReplicatedStorage.Content.Flair.PVPRank.Sergeant III
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Sergeant III",
    description = "Unlocked from the \"Sergeant III\" rank.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}