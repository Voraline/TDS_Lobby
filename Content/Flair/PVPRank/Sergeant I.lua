-- Script path: ReplicatedStorage.Content.Flair.PVPRank.Sergeant I
-- Decompile time: 0.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Sergeant I",
    description = "Unlocked from the \"Sergeant I\" rank.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}