-- Script path: ReplicatedStorage.Content.Flair.Rank.Content Creator
-- Decompile time: 0.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Content Creator",
    description = "Unlocked for being a \"Content Creator\"",
    colorRotation = 90,
    strokeWidth = 1,
    strokeColorRotation = 90,
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Exclusive,
    color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(206, 0, 3)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(206, 0, 3))),
    }),
    strokeColor = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
    }),
}