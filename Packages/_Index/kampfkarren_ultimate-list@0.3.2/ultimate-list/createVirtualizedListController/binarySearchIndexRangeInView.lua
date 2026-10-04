-- Script path: ReplicatedStorage.Packages._Index.kampfkarren_ultimate-list@0.3.2.ultimate-list.createVirtualizedListController.binarySearchIndexRangeInView
-- Decompile time: 2.37 ms

local v1 = script:FindFirstAncestor("ultimate-list")
local DataSourceMethods = require(v1.DataSources.DataSourceMethods)
require(v1.DataSources)
require(v1.Dimensions)
local exhaustiveMatch = require(v1.Util.exhaustiveMatch)
return function(a1, a2, a3, a4, a5) -- Line: 8
    -- upvalues: exhaustiveMatch (val), DataSourceMethods (val)
    local v1, v2, v3, v4, v5, v6

    local function compareInView(a1) -- Line: 18 -- upvalues: a5 (val), exhaustiveMatch (upval), a3 (val), a4 (val)
        local Offset = if a5 ~= "x" then if a5 ~= "y" then exhaustiveMatch(a5) else a1.position.Y.Offset else a1.position.X.Offset
        local Offset_2 = if a5 ~= "x" then if a5 ~= "y" then exhaustiveMatch(a5) else a1.size.Y.Offset else a1.size.X.Offset
        if Offset + Offset_2 < a3 then
            return "before"
        end
        if a3 + a4 < Offset then
            return "after"
        end
        return "inside"
    end

    local v7 = 1
    local v8 = DataSourceMethods.length(a1)
    local v9 = v8
    while v7 <= v9 do
        v6 = (v7 + v9) // 2
        v1 = DataSourceMethods.get(a1, v6)
        assert(v1 ~= nil, "get() returned nil, meaning the length is inaccurate")
        v2 = compareInView((v10(v1.value, v6)))
        if v2 == "after" then
            v9 = v6 - 1
        elseif v2 ~= "before" then
            if v2 == "inside" then
                v3 = v6
                while v3 > 1 do
                    v4 = v1.before()
                    if v4 == nil or compareInView(v10(v4.value, v3 - 1)) ~= "inside" then
                        break
                    end
                    v3 = v3 - 1
                end
                v4 = v6
                while v4 < v8 do
                    v5 = v1.after()
                    if v5 == nil or compareInView(v10(v5.value, v4 + 1)) ~= "inside" then
                        break
                    end
                    v4 = v4 + 1
                end
                return (Vector3.new(v3, v4))
            end
            exhaustiveMatch(v2)
        else
            v7 = v6 + 1
        end
    end
    return (Vector3.new(0, 0, 0))
end