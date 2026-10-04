-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Catalog.VirtualRows
-- Decompile time: 0.88 ms

local LayoutUtils = require(script.Parent.LayoutUtils)
require(script.Parent.Types)
return {
    append = function(a1, a2, a3, a4, a5, a6, a7) -- Line: 8
        -- upvalues: LayoutUtils (val)
        local v1 = a1[#a1]
        local v2 = if not v1 then 0 else v1.offset + v1.height
        local v3 = LayoutUtils.resolvePixelHeight(a3, a4)
        table.insert(a1, {
            key = a2,
            height = v3,
            offset = v2,
            sectionTitle = a6,
            scrollTarget = a7,
            element = a5,
        })
        return v3
    end,
}