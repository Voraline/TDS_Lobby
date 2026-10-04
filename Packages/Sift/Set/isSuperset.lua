-- Script path: ReplicatedStorage.Packages.Sift.Set.isSuperset
-- Decompile time: 0.23 ms

local isSubset = require(script.Parent.isSubset)
return function(a1, a2) -- Line: 21 -- upvalues: isSubset (val) -- types: a1: table, a2: table
    return isSubset(a2, a1)
end