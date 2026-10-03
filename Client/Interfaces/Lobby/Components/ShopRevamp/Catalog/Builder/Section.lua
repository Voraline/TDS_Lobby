-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Catalog.Builder.Section
-- Decompile time: 6.29 ms

local Constants = require(script.Parent.Parent.Constants)
local Items = require(script.Parent.Parent.Items)
local LayoutUtils = require(script.Parent.Parent.LayoutUtils)
require(script.Parent.Parent.Types)
local VirtualRows = require(script.Parent.Parent.VirtualRows)
local Rows = require(script.Parent.Rows)
local CategorySection = require(script.Parent.CategorySection)
local Chrome = require(script.Parent.Chrome)
local ShowMore = require(script.Parent.Parent.Elements.ShowMore)
local Subsection = require(script.Parent.Parent.Elements.Subsection)
local u59 = {}
u59.Towers = {
    order = Constants.TOWER_CATEGORY_ORDER,
    getEntriesByCategory = Items.getTowerEntriesByCategory,
    getCategoryName = LayoutUtils.getTowerCategoryName,
}
u59.Crates = {
    order = Constants.CRATE_CATEGORY_ORDER,
    getOrder = Items.getCrateCategoryOrder,
    getEntriesByCategory = Items.getCrateEntriesByCategory,
    getCategoryName = Items.getCrateCategoryName,
}
return function(a1, a2, a3, a4, a5, a6) -- Line: 29
    -- upvalues: u59 (val), LayoutUtils (val), CategorySection (val), Chrome (val), Rows (val), VirtualRows (val)
    -- upvalues: Subsection (val), ShowMore (val)
    local collapsedRowLimit, collectEntries_2, collectEntries_4, dataName, props, props_2, rowSize, title, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
    local v11 = u59[a2.title]
    if v11 then
        return (CategorySection(
            a1,
            a2,
            a3,
            a4,
            a5,
            a6,
            LayoutUtils.collectEntries(a2.components, a2.key, LayoutUtils.formatSectionId(a2.key), {}),
            v11
        ))
    end
    local u213 = Chrome(a1, a2, a3, a6)
    local u678 = {}
    local v12 = {}
    local u570 = 0
    local v13 = nil
    local v14 = true
    local u465 = true

    local function flushDefaultEntries() -- Line: 66
        -- upvalues: u678 (ref), u213 (ref), Rows (upval), a1 (val), a2 (val), a4 (val), a5 (val), a6 (val), u465 (ref)
        -- upvalues: u570 (ref)
        if #u678 == 0 then
            return
        end
        local v1, v2 = Rows(a1, u678, u213, a2, a2.itemsPerRow, a2.shopProductSize, a2.rowSize, a2.collapsedRowLimit, a4, a5, a6, u465)
        u213 = v1
        u570 = u570 + v2
        u678 = {}
    end

    local v15 = nil
    local v16 = nil
    for i, j in a2.components, v15, v16 do
        if j.type == "Subsection" then
            flushDefaultEntries()
            props = j.props or {}
            title = props.title or props.name or "Products"
            v2 = LayoutUtils.getSubsectionKey(a2.key, title)
            v3 = LayoutUtils.resolveCollapsedRowLimit(props)
            u465 = a5.collapsedSubsections[v2] ~= true
            v14 = not v3 or a5.expandedSubsections[v2] == true
            if not a2.collapsedRowLimit or a4 or u570 < a2.collapsedRowLimit then
                VirtualRows.append(
                    a1,
                    ("%*_Subsection_%*"):format(a2.key, i),
                    UDim2.fromScale(1, 0.035),
                    a6,
                    Subsection(title, v2, u465, u213, a5.onToggleSubsection, props.refreshes),
                    nil,
                    title
                )
                u213 = u213 + 1
            end
            u570 = u570 + 1
        elseif not LayoutUtils.isRowGroup(j) then
            collectEntries_4 = LayoutUtils.collectEntries
            v2 = ("%*_%*"):format(a2.key, i)
            v3 = LayoutUtils.formatSectionId(a2.key)
            for k, n in collectEntries_4({j}, v2, v3, v12) do
                table.insert(u678, n)
            end
        else
            flushDefaultEntries()
            props_2 = j.props or {}
            v1 = props_2.layout or props_2
            v2 = LayoutUtils.resolveItemsPerRow(v1, a2.itemsPerRow)
            v3 = LayoutUtils.resolveShopProductSize(j, v1)
            rowSize = LayoutUtils.resolveLayoutRowSize(v1) or a2.rowSize
            v4 = LayoutUtils.resolveCollapsedRowLimit(v1)
            v5 = v14
            collapsedRowLimit = v4 or a2.collapsedRowLimit
            v6 = if not v4 then a4 else v5
            if not v4 and v13 then
                v5 = true
                v6 = a4
            end
            if v13 and not u465 then
                collapsedRowLimit = 0
                v6 = false
            end
            dataName = props_2.dataName or props_2.title or a2.key
            if j.type ~= "Section" then
                v7 = LayoutUtils.collectEntries(j.children or {}, ("%*_%*"):format(a2.key, i), LayoutUtils.formatSectionId(dataName), v12)
            else
                collectEntries_2 = LayoutUtils.collectEntries
                v9 = ("%*_%*"):format(a2.key, i)
                v10 = LayoutUtils.formatSectionId(dataName)
                v7 = collectEntries_2({j}, v9, v10, v12)
            end
            v9, v10 = Rows(a1, v7, u213, a2, v2, v3, rowSize, collapsedRowLimit, v6, a5, a6, true)
            u213 = v9
            v8 = v10
            u570 = u570 + v8
            if v13 and u465 and v4 and v4 < v8 then
                local u472 = v13
                VirtualRows.append(a1, ("%*_SubsectionShowMore_%*"):format(a2.key, i), UDim2.fromScale(1, 0.06), a6, ShowMore(if not v5 then "Show More" else "Show Less", u213, function() -- Line: 205 -- upvalues: a5 (val), u472 (val)
                    a5.onShowMoreSubsection(u472)
                end), nil)
                u213 = u213 + 1
            end
        end
    end
    flushDefaultEntries()
    if a2.collapsedRowLimit and a2.collapsedRowLimit < u570 then
        VirtualRows.append(a1, ("%*_ShowMore"):format(a2.key), UDim2.fromScale(1, 0.06), a6, ShowMore(if not a4 then "Show More" else "Show Less", u213, function() -- Line: 238 -- upvalues: a5 (val), a2 (val)
            a5.onShowMore(a2.key)
        end), nil)
        u213 = u213 + 1
    end
    return u213
end