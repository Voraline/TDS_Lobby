-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Catalog.Builder.Rows
-- Decompile time: 10.50 ms

local Constants = require(script.Parent.Parent.Constants)
local Items = require(script.Parent.Parent.Items)
local LayoutUtils = require(script.Parent.Parent.LayoutUtils)
local Placement = require(script.Parent.Parent.Placement)
require(script.Parent.Parent.Types)
local VirtualRows = require(script.Parent.Parent.VirtualRows)
local Container = require(script.Parent.Parent.Elements.Container)
local Product = require(script.Parent.Parent.Elements.Product)
local ProductRow = require(script.Parent.Parent.Elements.ProductRow)
return function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12) -- Line: 14
    -- upvalues: Items (val), LayoutUtils (val), Placement (val), Product (val), VirtualRows (val), Container (val)
    -- upvalues: Constants (val), ProductRow (val)
    local Scale_2, v1, v2, v3, v4
    local v5 = Items.filterRenderable(a2, a10)
    local u23 = LayoutUtils.resolveResponsiveItemsPerRow(a5, a6, a11)
    local u332 = 0
    local v6 = 0
    local u27 = a12 ~= false
    if Placement.hasSpanningEntry(v5) then
        local v7
        local v8 = {}
        local v9 = 1
        local v10 = nil
        v1 = nil
        for k, n in v5, v10, v1 do
            v7 = Items.resolve(a10.items, n)
            v2 = Placement.getEntryRowSpan(n)
            v3, v4 = Placement.getEntryPlacement({}, u23, v2)
            v9 = math.max(v9, v3 + v2 - 1)
            v6 = v6 + 1
            table.insert(v8, {
                entry = n,
                item = v7,
                row = v3,
                column = v4,
                rowSpan = v2,
                productIndex = v6,
            })
        end
        local v11 = v9
        local v12 = u27 and (not a8 or a9 or v11 <= a8)
        if v12 and #v8 > 0 then
            local entry, v13
            v10 = {}
            v1 = LayoutUtils.resolveResponsiveRowSize(a7 or LayoutUtils.resolveRowSize(a6), a5, u23)
            for m, i5 in v8 do
                entry = i5.entry
                v13 = LayoutUtils.resolveShopProductSize(entry.component, {productSize = a6})
                v10[entry.id] = (Product(
                    entry,
                    i5.item,
                    i5.productIndex,
                    u23,
                    v13,
                    a10,
                    UDim2.fromScale(1 / u23, i5.rowSpan / v11),
                    UDim2.fromScale((i5.column - 1) / u23, (i5.row - 1) / v11)
                ))
            end
            VirtualRows.append(
                a1,
                ("%*_Row_%*"):format(a4.key, a3),
                UDim2.new(v1.X.Scale, v1.X.Offset, v1.Y.Scale * v11, v1.Y.Offset * v11),
                a11,
                Container(Constants.CONTENT_WIDTH_SCALE, v10),
                nil
            )
            a3 = a3 + 1
        end
        return a3, v11
    end
    local u228 = {}
    local u276 = nil
    local u286 = 0

    local function flushRow() -- Line: 115
        -- upvalues: u286 (ref), u332 (ref), u27 (val), a8 (val), a9 (val), LayoutUtils (upval), u276 (ref), a7 (val)
        -- upvalues: a6 (val), a5 (val), u23 (val), VirtualRows (upval), a1 (val), a4 (val), a3 (ref), a11 (val)
        -- upvalues: ProductRow (upval), u228 (ref)
        if u286 == 0 then
            return
        end
        u332 = u332 + 1
        if u27 and (not a8 or a9 or u332 <= a8) then
            local v1 = LayoutUtils.resolveResponsiveRowSize(u276 or a7 or LayoutUtils.resolveRowSize(a6), a5, u23)
            VirtualRows.append(a1, ("%*_Row_%*"):format(a4.key, a3), v1, a11, ProductRow(u228), nil)
            a3 = a3 + 1
        end
        u228 = {}
        u276 = nil
        u286 = 0
    end

    v1 = nil
    local v14 = nil
    local v15 = a10
    for i, j in v5, v1, v14 do
        v2 = Items.resolve(v15.items, j)
        v3 = LayoutUtils.resolveShopProductSize(j.component, {productSize = a6})
        v4 = a7 or LayoutUtils.resolveRowSize(v3)
        if not u276 then
            u276 = v4
        else
            Scale_2 = v4.Y.Scale
            if u276.Y.Scale < Scale_2 then
                u276 = v4
            end
        end
        v6 = v6 + 1
        u286 = u286 + 1
        u228[j.id] = (Product(j, v2, v6, u23, v3, v15))
        if u286 == u23 then
            flushRow()
        end
    end
    flushRow()
    v1 = u332
    return a3, v1
end