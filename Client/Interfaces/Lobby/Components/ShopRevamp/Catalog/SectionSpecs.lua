-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Catalog.SectionSpecs
-- Decompile time: 0.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ShopTypes)
local Constants = require(script.Parent.Constants)
local LayoutUtils = require(script.Parent.LayoutUtils)
require(script.Parent.Types)
return function(a1) -- Line: 11 -- upvalues: LayoutUtils (val), Constants (val)
    local components, layout, title, v1
    local v2 = {}
    local v3 = nil
    local v4 = nil
    for i, j in a1, v3, v4 do
        title = j.title or ("Section %*"):format(i)
        layout = j.layout or {}
        v1 = {
            key = title:gsub("%s+", "_"),
            title = title,
            icon = j.icon,
            refreshes = j.refreshes,
        }
        components = j.components or {}
        v1.components = components
        v1.itemsPerRow = LayoutUtils.resolveItemsPerRow(layout, Constants.DEFAULT_ITEMS_PER_ROW)
        v1.shopProductSize = LayoutUtils.resolveShopProductSize(nil, layout)
        v1.rowSize = LayoutUtils.resolveLayoutRowSize(layout)
        v1.collapsedRowLimit = LayoutUtils.resolveCollapsedRowLimit(layout)
        table.insert(v2, v1)
    end
    return v2
end