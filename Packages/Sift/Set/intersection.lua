-- Script path: ReplicatedStorage.Packages.Sift.Set.intersection
-- Decompile time: 0.45 ms

return function(...) -- Line: 20
    local v1
    local v2 = select("#", ...)
    local v3 = {}
    for k, v in pairs((select(1, ...))) do
        v1 = true
        for i = 2, v2 do
            if select(i, ...)[k] ~= true then
                v1 = false
                break
            end
        end
        if v1 then
            v3[k] = true
        end
    end
    return v3
end