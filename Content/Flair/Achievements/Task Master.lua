-- Script path: ReplicatedStorage.Content.Flair.Achievements.Task Master
-- Decompile time: 0.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Task Master",
    description = "Unlocked from the \"Task Master\" achievement.",
    colorRotation = 90,
    strokeWidth = 1,
    strokeColorRotation = 90,
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 206, 191)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 206, 191))),
    }),
    strokeColor = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
    }),
}