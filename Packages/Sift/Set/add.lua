-- Script path: ReplicatedStorage.Packages.Sift.Set.add
-- Decompile time: 0.22 ms

return function(a1, ...) -- Line: 18 -- types: a1: table
    local v1 = {}
    for k, v in pairs(a1) do
        v1[k] = true
    end
    for i, i2 in ipairs({...}) do
        v1[i2] = true
    end
    return v1
end