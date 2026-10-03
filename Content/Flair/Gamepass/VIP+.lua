-- Script path: ReplicatedStorage.Content.Flair.Gamepass.VIP+
-- Decompile time: 0.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    title = "VIP+",
    description = "A title for those who have purchased VIP+.",
    rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).FlairRarity.Exclusive,
    color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(179, 0, 238)),
        ColorSequenceKeypoint.new(0.197, Color3.fromRGB(0, 107, 238)),
        ColorSequenceKeypoint.new(0.365, Color3.fromRGB(0, 238, 139)),
        ColorSequenceKeypoint.new(0.524, Color3.fromRGB(0, 255, 38)),
        ColorSequenceKeypoint.new(0.711, Color3.fromRGB(255, 255, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 85, 0))),
    }),
}