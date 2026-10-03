-- Script path: ReplicatedStorage.Packages.Sift.Array.removeValue
-- Decompile time: 0.26 ms

return function(a1, a2) -- Line: 18 -- types: a1: table
    local v1 = {}
    for i, v in ipairs(a1) do
        if v ~= a2 then
            table.insert(v1, v)
        end
    end
    return v1
end