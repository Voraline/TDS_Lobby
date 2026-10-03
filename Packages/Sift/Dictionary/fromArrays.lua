-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.fromArrays
-- Decompile time: 0.28 ms

return function(a1, a2) -- Line: 20 -- types: a1: table, a2: table
    local v1 = {}
    for i = 1, #a1 do
        v1[a1[i]] = a2[i]
    end
    return v1
end