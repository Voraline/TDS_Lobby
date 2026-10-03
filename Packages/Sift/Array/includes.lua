-- Script path: ReplicatedStorage.Packages.Sift.Array.includes
-- Decompile time: 0.18 ms

local find = require(script.Parent.find)
return function(a1, a2, a3) -- Line: 28 -- upvalues: find (val) -- types: a1: table, a3: number?
    return find(a1, a2, a3) ~= nil
end