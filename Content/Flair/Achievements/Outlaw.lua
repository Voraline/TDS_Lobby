-- Script path: ReplicatedStorage.Content.Flair.Achievements.Outlaw
-- Decompile time: 0.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Outlaw",
    description = "Unlocked from the \"Outlaw\" achievement.",
    colorRotation = 90,
    strokeWidth = 1,
    strokeColorRotation = 90,
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 182, 65)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 34, 34))),
    }),
    strokeColor = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
    }),
}