-- Script path: ReplicatedStorage.Packages.Fusion.Utility.isSimilar
-- Decompile time: 0.14 ms

return function(a1, a2) -- Line: 7
    if typeof(a1) == "table" then
        return false
    end
    return a1 == a2
end