-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.some
-- Decompile time: 0.23 ms

return function(a1, a2) -- Line: 24 -- types: a1: table, a2: function
    for k, v in pairs(a1) do
        if a2(v, k, a1) then
            return true
        end
    end
    return false
end