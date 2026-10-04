-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.removeKey
-- Decompile time: 0.12 ms

local copy = require(script.Parent.copy)
return function(a1, a2) -- Line: 21 -- upvalues: copy (val) -- types: a1: table
    local v1 = copy(a1)
    v1[a2] = nil
    return v1
end