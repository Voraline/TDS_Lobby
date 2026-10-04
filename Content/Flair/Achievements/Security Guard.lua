-- Script path: ReplicatedStorage.Content.Flair.Achievements.Security Guard
-- Decompile time: 0.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "Security Guard",
    description = "Unlocked from the \"Security Guard\" achievement.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Common,
    color = ColorSequence.new(Color3.new(1, 1, 1)),
}