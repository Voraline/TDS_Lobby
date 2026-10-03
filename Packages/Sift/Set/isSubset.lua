-- Script path: ReplicatedStorage.Packages.Sift.Set.isSubset
-- Decompile time: 0.17 ms

return function(a1, a2) -- Line: 19 -- types: a1: table, a2: table
    for k, v in pairs(a1) do
        if a2[k] ~= v then
            return false
        end
    end
    return true
end