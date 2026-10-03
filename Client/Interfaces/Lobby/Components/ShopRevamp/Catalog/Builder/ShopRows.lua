-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Catalog.Builder.ShopRows
-- Decompile time: 0.76 ms

local Constants = require(script.Parent.Parent.Constants)
local LayoutUtils = require(script.Parent.Parent.LayoutUtils)
require(script.Parent.Parent.Types)
local VirtualRows = require(script.Parent.Parent.VirtualRows)
local Section = require(script.Parent.Section)
local BottomBuffer = require(script.Parent.Parent.Elements.BottomBuffer)
return function(a1, a2) -- Line: 11
    -- upvalues: LayoutUtils (val), Section (val), VirtualRows (val), Constants (val), BottomBuffer (val)
    local v1
    local v2 = {}
    local v3 = 0
    local v4 = LayoutUtils.getEffectiveWindowSize(a2)
    local v5 = nil
    local v6 = nil
    local v7 = a1
    for i, j in a1.sectionSpecs, v5, v6 do
        v1 = v7.expandedSections[j.key] == true
        v3 = Section(v2, j, v3, v1, v7, v4)
    end
    VirtualRows.append(v2, "BottomBuffer", Constants.BOTTOM_BUFFER_SIZE, v4, BottomBuffer(v3), nil)
    return v2
end