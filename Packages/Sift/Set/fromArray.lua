-- Script path: ReplicatedStorage.Packages.Sift.Set.fromArray
-- Decompile time: 0.20 ms

return function(a1) -- Line: 20 -- types: a1: table
    local v1 = table.create(#a1)
    for i, v in ipairs(a1) do
        v1[v] = true
    end
    return v1
end