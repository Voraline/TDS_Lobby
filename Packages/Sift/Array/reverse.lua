-- Script path: ReplicatedStorage.Packages.Sift.Array.reverse
-- Decompile time: 0.21 ms

return function(a1) -- Line: 17 -- types: a1: table
    local v1 = {}
    for i = #a1, 1, -1 do
        table.insert(v1, a1[i])
    end
    return v1
end