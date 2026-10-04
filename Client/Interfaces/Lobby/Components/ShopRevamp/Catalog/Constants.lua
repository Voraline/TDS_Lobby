-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Catalog.Constants
-- Decompile time: 1.49 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local RarityColors = require(ReplicatedStorage.Shared.Modules.RarityColors)
local v1 = {
    DEFAULT_ITEMS_PER_ROW = 5,
    SECONDS_PER_DAY = 86400,
    CONTENT_WIDTH_SCALE = 0.8,
    SECTION_WIDTH_SCALE = 0.975,
    PRODUCT_ROW_GAP = 0,
    MAX_RESPONSIVE_ROW_HEIGHT_MULTIPLIER = 1.75,
    DEFAULT_SHOP_PRODUCT_SIZE = Enum.ShopProductSize.Card,
    BOTTOM_BUFFER_SIZE = UDim2.fromScale(1, 0.2),
    DEFAULT_WINDOW_SIZE = Vector2.new(900, 1000),
    MIN_PRODUCT_WIDTH_BY_PRODUCT_SIZE = {
        [Enum.ShopProductSize.Card] = 134,
        [Enum.ShopProductSize.Square] = 112,
        [Enum.ShopProductSize.Featured_Duo] = 220,
        [Enum.ShopProductSize.Featured_Thirds] = 170,
        [Enum.ShopProductSize.Currency_Horizontal] = 180,
        [Enum.ShopProductSize.Currency_Vertical] = 132,
    },
    TOWER_CATEGORY_ORDER = {
        Enum.TowerCategory.Starter,
        Enum.TowerCategory.Intermediate,
        Enum.TowerCategory.Advanced,
        Enum.TowerCategory.Hardcore,
        Enum.TowerCategory.Exclusive,
        Enum.TowerCategory.Event,
        Enum.TowerCategory.Evolved,
    },
    CRATE_CATEGORY_ORDER = {
        Enum.CrateCategory.Robux,
        Enum.CrateCategory.Default,
        Enum.CrateCategory.Consumables,
        Enum.CrateCategory.Event,
    },
}
local v2 = {}
v2[Enum.CrateCategory.Default] = RarityColors[Enum.SkinRarity.Common]
v2[Enum.CrateCategory.Robux] = RarityColors[Enum.SkinRarity.Uncommon]
v2[Enum.CrateCategory.Consumables] = RarityColors[Enum.SkinRarity.Utility]
v2[Enum.CrateCategory.Event] = RarityColors[Enum.SkinRarity.Event]
v1.CRATE_CATEGORY_COLORS = v2
v2 = {}
v2[Enum.ShopProductSize.Card] = (UDim2.fromScale(1, 0.25))
v2[Enum.ShopProductSize.Square] = (UDim2.fromScale(1, 0.18))
v2[Enum.ShopProductSize.Featured_Duo] = (UDim2.fromScale(1, 0.225))
v2[Enum.ShopProductSize.Featured_Thirds] = (UDim2.fromScale(1, 0.15))
v2[Enum.ShopProductSize.Currency_Horizontal] = (UDim2.fromScale(1, 0.225))
v2[Enum.ShopProductSize.Currency_Vertical] = (UDim2.fromScale(1, 0.225))
v1.ROW_SIZE_BY_PRODUCT_SIZE = v2
v1.RARITY_NAMES = {
    ["1"] = "Common",
    ["2"] = "Uncommon",
    ["3"] = "Rare",
    ["4"] = "Legendary",
    ["5"] = "Golden",
    ["6"] = "Mythic",
    ["7"] = "Ultimate",
    ["8"] = "Exclusive",
    ["9"] = "Event",
    ["10"] = "Developer",
}
return v1