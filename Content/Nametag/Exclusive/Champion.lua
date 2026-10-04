-- Script path: ReplicatedStorage.Content.Nametag.Exclusive.Champion
-- Decompile time: 0.11 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Name = "Champion",
    Description = "Only for the best of players..",
    Rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).SkinRarity.Exclusive,
}