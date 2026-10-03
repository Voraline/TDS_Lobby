-- Script path: ReplicatedStorage.Packages.Sift.Array.sort
-- Decompile time: 0.23 ms

local copy = require(script.Parent.copy)
return function(a1, a2) -- Line: 22 -- upvalues: copy (val) -- types: a1: table, a2: function?
    local v1 = copy(a1)
    table.sort(v1, a2)
    return v1
end