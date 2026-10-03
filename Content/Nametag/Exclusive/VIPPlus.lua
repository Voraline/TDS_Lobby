-- Script path: ReplicatedStorage.Content.Nametag.Exclusive.VIPPlus
-- Decompile time: 0.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Name = "VIPPlus",
    Description = "A special nametag for being a VIP+ subscriber!",
    Rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).SkinRarity.Exclusive,
}