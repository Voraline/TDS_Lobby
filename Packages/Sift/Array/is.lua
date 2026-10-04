-- Script path: ReplicatedStorage.Packages.Sift.Array.is
-- Decompile time: 0.19 ms

return function(a1) -- Line: 21
    local v1 = false
    if typeof(a1) == "table" then
        v1 = false
        if #a1 > 0 then
            v1 = next(a1, #a1) == nil
        end
    end
    return v1
end