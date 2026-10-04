-- Script path: ReplicatedStorage.Packages.Sift.Set.map
-- Decompile time: 0.20 ms

return function(a1, a2) -- Line: 20 -- types: a1: table, a2: function
    local v1
    local v2 = {}
    for k, v in pairs(a1) do
        v1 = a2(k, a1)
        if v1 ~= nil then
            v2[v1] = true
        end
    end
    return v2
end