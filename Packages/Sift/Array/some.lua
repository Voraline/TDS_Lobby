-- Script path: ReplicatedStorage.Packages.Sift.Array.some
-- Decompile time: 0.18 ms

return function(a1, a2) -- Line: 24 -- types: a1: table, a2: function
    for i, v in ipairs(a1) do
        if a2(v, i, a1) then
            return true
        end
    end
    return false
end