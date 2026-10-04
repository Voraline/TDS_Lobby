-- Script path: ReplicatedStorage.Packages.Sift.Set.toArray
-- Decompile time: 0.13 ms

return function(a1) -- Line: 17 -- types: a1: table
    local v1 = {}
    for k, v in pairs(a1) do
        table.insert(v1, k)
    end
    return v1
end