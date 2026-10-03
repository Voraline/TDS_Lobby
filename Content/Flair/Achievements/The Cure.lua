-- Script path: ReplicatedStorage.Content.Flair.Achievements.The Cure
-- Decompile time: 0.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "The Cure",
    description = "Unlocked from the \"The Cure\" achievement.",
    colorRotation = 90,
    strokeWidth = 1,
    strokeColorRotation = 90,
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 255, 19)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(13, 152, 159))),
    }),
    strokeColor = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
    }),
}