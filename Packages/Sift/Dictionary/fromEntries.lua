-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.fromEntries
-- Decompile time: 0.26 ms

return function(a1) -- Line: 17 -- types: a1: table
    local v1 = {}
    for i, v in ipairs(a1) do
        v1[v[1]] = v[2]
    end
    return v1
end