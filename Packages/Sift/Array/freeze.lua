-- Script path: ReplicatedStorage.Packages.Sift.Array.freeze
-- Decompile time: 0.13 ms

local copy = require(script.Parent.copy)
return function(a1) -- Line: 22 -- upvalues: copy (val) -- types: a1: table
    local v1 = copy(a1)
    table.freeze(v1)
    return v1
end