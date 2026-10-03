-- Script path: ReplicatedStorage.Content.Flair.Achievements.Living Weapon
-- Decompile time: 0.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Living Weapon",
    description = "Unlocked from the \"Living Weapon\" achievement.",
    colorRotation = 90,
    strokeWidth = 1,
    strokeColorRotation = 90,
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 252, 211)),
        ColorSequenceKeypoint.new(0.475, Color3.fromRGB(255, 164, 37)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(74, 76, 21))),
    }),
    strokeColor = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
    }),
}