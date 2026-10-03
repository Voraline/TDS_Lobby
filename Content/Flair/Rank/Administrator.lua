-- Script path: ReplicatedStorage.Content.Flair.Rank.Administrator
-- Decompile time: 0.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Administrator",
    description = "Unlocked for being a \"Administrator\"",
    colorRotation = 90,
    strokeWidth = 1,
    strokeColorRotation = 90,
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Exclusive,
    color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 137, 3)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 137, 3))),
    }),
    strokeColor = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
    }),
}