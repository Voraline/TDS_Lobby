-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_pretty-format@3.10.0.pretty-format.Collections
-- Decompile time: 3.55 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Object = v1.Object
local Array = v1.Array
require(script.Parent:WaitForChild("Types"))
return {
    printTableEntries = function(a1, a2, a3, a4, a5, a6, a7) -- Line: 30
        -- upvalues: Array (val), Object (val)
        local v1 = a7 or ": "
        local v2 = ""
        local sort = Array.sort
        local v3 = Object.keys(a1)
        local v4 = sort(v3, if a2.compareKeys == nil then function(a1, a2) -- Line: 47
            if (type(a1)) .. tostring(a1) < (type(a2)) .. tostring(a2) then
                return -1
            end
            if (type(a1)) .. tostring(a1) == (type(a2)) .. tostring(a2) then
                return 0
            end
            return 1
        end else if a2.compareKeys == Object.None then function(a1, a2) -- Line: 47
            if (type(a1)) .. tostring(a1) < (type(a2)) .. tostring(a2) then
                return -1
            end
            if (type(a1)) .. tostring(a1) == (type(a2)) .. tostring(a2) then
                return 0
            end
            return 1
        end else a2.compareKeys)
        if #v4 > 0 then
            local v5, v6
            v2 = v2 .. a2.spacingOuter
            v3 = a3 .. a2.indent
            local v7 = #v4
            for i = 1, v7 do
                v5 = v4[i]
                v6 = a1[v5]
                v2 = v2 .. v3
                v2 = v2 .. (a6(v5, a2, v3, a4, a5)) .. v1 .. (a6(v6, a2, v3, a4, a5))
                if i < #v4 then
                    v2 = v2 .. (",%s"):format((tostring(a2.spacingInner)))
                elseif not a2.min then
                    v2 = v2 .. ","
                end
            end
            v2 = v2 .. a2.spacingOuter .. a3
        end
        return v2
    end,
    printMapEntries = function(a1, a2, a3, a4, a5, a6, a7) -- Line: 89
        -- upvalues: Array (val), Object (val)
        local v1 = a7 or " => "
        local v2 = ""
        local sort = Array.sort
        local v3 = Object.keys(a1)
        local v4 = sort(v3, if a2.compareKeys == nil then function(a1, a2) -- Line: 105
            if (type(a1)) .. tostring(a1) < (type(a2)) .. tostring(a2) then
                return -1
            end
            if (type(a1)) .. tostring(a1) == (type(a2)) .. tostring(a2) then
                return 0
            end
            return 1
        end else if a2.compareKeys == Object.None then function(a1, a2) -- Line: 105
            if (type(a1)) .. tostring(a1) < (type(a2)) .. tostring(a2) then
                return -1
            end
            if (type(a1)) .. tostring(a1) == (type(a2)) .. tostring(a2) then
                return 0
            end
            return 1
        end else a2.compareKeys)
        if #v4 > 0 then
            local v5, v6
            v2 = v2 .. a2.spacingOuter
            v3 = a3 .. a2.indent
            local v7 = #v4
            for i = 1, v7 do
                v5 = v4[i]
                v6 = a1[v5]
                v2 = v2 .. v3
                if i == a2.maxWidth + 1 then
                    v2 = v2 .. "…"
                    break
                end
                v2 = v2 .. (a6(v5, a2, v3, a4, a5)) .. v1 .. (a6(v6, a2, v3, a4, a5))
                if i < #v4 then
                    v2 = v2 .. (",%s"):format((tostring(a2.spacingInner)))
                elseif not a2.min then
                    v2 = v2 .. ","
                end
            end
            v2 = v2 .. a2.spacingOuter .. a3
        end
        return v2
    end,
    printListItems = function(a1, a2, a3, a4, a5, a6) -- Line: 152 -- types: a1: table, a3: string, a4: number
        local v1 = ""
        if #a1 > 0 then
            v1 = v1 .. a2.spacingOuter
            local v2 = a3 .. a2.indent
            local v3 = #a1
            local v4, v5, v6, v7 = a1, a6, a4, a5
            for i = 1, v3 do
                v1 = v1 .. v2
                if i == a2.maxWidth + 1 then
                    v1 = v1 .. "…"
                    break
                end
                if v4[i] ~= nil then
                    v1 = v1 .. v5(v4[i], a2, v2, v6, v7)
                end
                if i < #v4 then
                    v1 = v1 .. (",%s"):format((tostring(a2.spacingInner)))
                elseif not a2.min then
                    v1 = v1 .. ","
                end
            end
            v1 = v1 .. a2.spacingOuter .. a3
        end
        return v1
    end,
}