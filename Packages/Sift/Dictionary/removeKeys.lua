-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.removeKeys
-- Decompile time: 0.25 ms

local copy = require(script.Parent.copy)
return function(a1, ...) -- Line: 20 -- upvalues: copy (val) -- types: a1: table
    local v1 = copy(a1)
    for i, v in ipairs({...}) do
        v1[v] = nil
    end
    return v1
end