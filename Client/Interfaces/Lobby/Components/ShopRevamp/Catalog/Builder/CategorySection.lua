-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Catalog.Builder.CategorySection
-- Decompile time: 1.94 ms

local LayoutUtils = require(script.Parent.Parent.LayoutUtils)
require(script.Parent.Parent.Types)
local VirtualRows = require(script.Parent.Parent.VirtualRows)
local Rows = require(script.Parent.Rows)
local Chrome = require(script.Parent.Chrome)
local ShowMore = require(script.Parent.Parent.Elements.ShowMore)
local Subsection = require(script.Parent.Parent.Elements.Subsection)
return function(a1, a2, a3, a4, a5, a6, a7, a8) -- Line: 19
    -- upvalues: Chrome (val), LayoutUtils (val), VirtualRows (val), Subsection (val), Rows (val), ShowMore (val)
    local v1, v2, v3, v4, v5, v6, v7
    local v8 = a8.getEntriesByCategory(a7, a5)
    if next(v8) == nil then
        return a3
    end
    local v9 = Chrome(a1, a2, a3, a6)
    local v10 = 0
    local v11 = if not a8.getOrder then a8.order else a8.getOrder(a7, a5)
    local v12 = nil
    local v13 = nil
    local v14, v15, v16, v17 = a1, a6, a4, a8
    for i, j in v11, v12, v13 do
        v1 = v8[j]
        if v1 and #v1 ~= 0 then
            v2 = v17.getCategoryName(j)
            v3 = LayoutUtils.getSubsectionKey(a2.key, v2)
            v4 = a5.collapsedSubsections[v3] ~= true
            v5 = not a2.collapsedRowLimit or v16 or v10 < a2.collapsedRowLimit
            if v5 then
                VirtualRows.append(
                    v14,
                    ("%*_Subsection_%*"):format(a2.key, j),
                    UDim2.fromScale(1, 0.035),
                    v15,
                    Subsection(v2, v3, v4, v9, a5.onToggleSubsection),
                    nil,
                    v2
                )
                v9 = v9 + 1
            end
            v10 = v10 + 1
            v6, v7 = Rows(v14, v1, v9, a2, a2.itemsPerRow, a2.shopProductSize, a2.rowSize, 0, v4, a5, v15, v5)
            v9 = v6
            v10 = v10 + v7
        end
    end
    if a2.collapsedRowLimit and a2.collapsedRowLimit < v10 then
        VirtualRows.append(v14, ("%*_ShowMore"):format(a2.key), UDim2.fromScale(1, 0.06), v15, ShowMore(if not v16 then "Show More" else "Show Less", v9, function() -- Line: 100 -- upvalues: a5 (val), a2 (val)
            a5.onShowMore(a2.key)
        end), nil)
        v9 = v9 + 1
    end
    return v9
end