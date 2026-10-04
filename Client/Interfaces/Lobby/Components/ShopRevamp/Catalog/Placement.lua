-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Catalog.Placement
-- Decompile time: 4.61 ms

require(script.Parent.Types)
local u5 = {}

function u5.getEntryRowSpan(a1) -- Line: 7
    local props = a1.component.props or {}
    local layout = props.layout
    local rowSpan = props.rowSpan
    if type(layout) == "table" and type(layout.rowSpan) == "number" then
        rowSpan = layout.rowSpan
    end
    if type(rowSpan) == "number" then
        return (math.max(1, (math.floor(rowSpan))))
    end
    return 1
end

function u5.hasSpanningEntry(a1) -- Line: 19 -- upvalues: u5 (val) -- types: a1: table
    for i, j in a1 do
        if 1 < (u5.getEntryRowSpan(j)) then
            return true
        end
    end
    return false
end

local function canPlaceEntry(a1, a2, a3, a4) -- Line: 29 -- types: a2: number, a3: number, a4: number
    local v1
    local v2 = a4 - 1
    local v3, v4, v5 = a2, a1, a3
    for i = 0, v2 do
        v1 = v4[v3 + i]
        if v1 and v1[v5] then
            return false
        end
    end
    return true
end

local function occupyEntry(a1, a2, a3, a4) -- Line: 40 -- types: a2: number, a3: number, a4: number
    local v1
    local v2 = a4 - 1
    local v3, v4 = a2, a1
    for i = 0, v2 do
        v1 = v4[v3 + i]
        if not v1 then
            v4[v3 + i] = {}
        end
        v1[v5] = true
    end
end

function u5.getEntryPlacement(a1, a2, a3) -- Line: 52 -- upvalues: occupyEntry (val) -- types: a2: number, a3: number
    local v1, v2
    local v3 = 1
    local v4, v5, v6 = a2, a1, a3
    while true do
        for i = 1, v4 do
            v2 = v6 - 1
            for j = 0, v2 do
                v1 = v5[v3 + j]
                if v1 and v1[i] then
                    if true then
                        break
                    end
                    occupyEntry(v5, v3, i, v6)
                    return v3, i
                end
            end
            if true then
                occupyEntry(v5, v3, i, v6)
                return v3, i
            end
        end
        v3 = v3 + 1
    end
    occupyEntry(v5, v3, i, v6)
    return v3, i
end

return u5