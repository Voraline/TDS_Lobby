-- Script path: ReplicatedStorage.Packages.Sift.Set.merge
-- Decompile time: 0.28 ms

return function(...) -- Line: 20
    local v1
    local v2 = {}
    for i = 1, (select("#", ...)) do
        v1 = select(i, ...)
        if type(v1) == "table" then
            for k, v in pairs(v1) do
                v2[k] = true
            end
        end
    end
    return v2
end