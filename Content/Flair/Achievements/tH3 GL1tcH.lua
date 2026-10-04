-- Script path: ReplicatedStorage.Content.Flair.Achievements.tH3 GL1tcH
-- Decompile time: 0.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "tH3 GL1tcH",
    description = "Unlocked from the \"tH3 GL1tcH\" achievement.",
    colorRotation = 90,
    strokeWidth = 1,
    strokeColorRotation = 90,
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(195, 42, 255)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(81, 0, 255))),
    }),
    strokeColor = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
    }),
    strokeTransparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.5), (NumberSequenceKeypoint.new(1, 0.5))}),
}