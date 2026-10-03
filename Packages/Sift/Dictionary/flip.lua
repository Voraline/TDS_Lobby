-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.flip
-- Decompile time: 0.18 ms

return function(a1) -- Line: 17 -- types: a1: table
    local v1 = {}
    for k, v in pairs(a1) do
        v1[v] = k
    end
    return v1
end