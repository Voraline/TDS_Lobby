-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Catalog
-- Decompile time: 0.65 ms

local Items = require(script.Items)
return {
    createSectionSpecs = require(script.SectionSpecs),
    buildShopRows = require(script.Builder.ShopRows),
    hasAvailableTowerProducts = Items.hasAvailableTowerProducts,
}