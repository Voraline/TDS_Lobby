-- Script path: ReplicatedStorage.Packages.Sift.Array.removeValues
-- Decompile time: 0.34 ms

local toSet = require(script.Parent.toSet)
return function(a1, ...) -- Line: 20 -- upvalues: toSet (val) -- types: a1: table
    local v1 = toSet({...})
    local v2 = {}
    for i, v in ipairs(a1) do
        if not v1[v] then
            table.insert(v2, v)
        end
    end
    return v2
end