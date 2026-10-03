-- Script path: ReplicatedStorage.Content.Flair.Achievements.Cursed Soul
-- Decompile time: 0.59 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Cursed Soul",
    description = "Unlocked from the \"Cursed Soul\" achievement.",
    colorRotation = 90,
    strokeWidth = 1,
    strokeColorRotation = 90,
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(44, 44, 44)),
        ColorSequenceKeypoint.new(0.2, Color3.fromRGB(59, 59, 59)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(170, 170, 170)),
        ColorSequenceKeypoint.new(0.8, Color3.fromRGB(60, 60, 60)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(44, 44, 44))),
    }),
    strokeColor = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
    }),
    strokeTransparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.5), (NumberSequenceKeypoint.new(1, 0.5))}),
}