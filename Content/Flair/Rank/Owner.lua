-- Script path: ReplicatedStorage.Content.Flair.Rank.Owner
-- Decompile time: 0.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Owner",
    description = "Unlocked for being a \"Owner\"",
    colorRotation = 90,
    strokeWidth = 1,
    strokeColorRotation = 90,
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Exclusive,
    color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(7, 197, 255)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 60, 166))),
    }),
    strokeColor = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
    }),
}