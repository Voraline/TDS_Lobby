-- Script path: ReplicatedStorage.Packages.Sift.Array.unshift
-- Decompile time: 0.16 ms

return function(a1, ...) -- Line: 22 -- types: a1: table
    local v1 = {...}
    for i, v in ipairs(a1) do
        table.insert(v1, v)
    end
    return v1
end