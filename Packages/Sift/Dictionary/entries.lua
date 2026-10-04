-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.entries
-- Decompile time: 0.18 ms

return function(a1) -- Line: 17 -- types: a1: table
    local v1 = {}
    for k, v in pairs(a1) do
        table.insert(v1, {k, v})
    end
    return v1
end