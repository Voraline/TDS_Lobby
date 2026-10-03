-- Script path: ReplicatedStorage.Content.Flair.Achievements.Commander in Chief
-- Decompile time: 0.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Commander in Chief",
    description = "Unlocked from the \"Commander in Chief\" achievement.",
    colorRotation = 90,
    strokeWidth = 1,
    strokeColorRotation = 90,
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 110, 255)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 110, 255))),
    }),
    strokeColor = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
    }),
}