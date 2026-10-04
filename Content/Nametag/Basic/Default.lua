-- Script path: ReplicatedStorage.Content.Nametag.Basic.Default
-- Decompile time: 0.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Name = "Default",
    Description = "The default nametag",
    Rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).SkinRarity.Common,
}