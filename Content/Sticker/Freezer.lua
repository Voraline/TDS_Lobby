-- Script path: ReplicatedStorage.Content.Sticker.Freezer
-- Decompile time: 0.12 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Name = "Freezer",
    Description = "Brrrr",
    Creator = "squeezewhiz",
    Icon = 81008815355922,
    Sound = 5020631118,
    Duration = 3,
    Rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).StickerRarity.Legendary,
}