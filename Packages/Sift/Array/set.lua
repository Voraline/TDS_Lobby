-- Script path: ReplicatedStorage.Packages.Sift.Array.set
-- Decompile time: 0.29 ms

return function(a1, a2, a3) -- Line: 20 -- types: a1: table, a2: number
    local v1 = #a1
    local v2 = {}
    if a2 < 1 then
        a2 = a2 + v1
    end
    for i, v in ipairs(a1) do
        if i ~= a2 then
            table.insert(v2, v)
        else
            table.insert(v2, a3)
        end
    end
    return v2
end