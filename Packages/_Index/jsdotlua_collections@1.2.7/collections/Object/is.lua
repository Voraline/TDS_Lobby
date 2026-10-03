-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Object.is
-- Decompile time: 0.26 ms

return function(a1, a2) -- Line: 3
    local v1
    if a1 == a2 then
        v1 = true
        if a1 == 0 then
            v1 = 1 / a1 == 1 / a2
        end
        return v1
    end
    v1 = false
    if a1 ~= a1 then
        v1 = a2 ~= a2
    end
    return v1
end