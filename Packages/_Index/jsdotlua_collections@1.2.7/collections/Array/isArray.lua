-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Array.isArray
-- Decompile time: 0.63 ms

return function(a1) -- Line: 1
    if typeof(a1) ~= "table" then
        return false
    end
    if next(a1) == nil then
        return true
    end
    if #a1 == 0 then
        return false
    end
    local v1 = 0
    local v2 = 0
    for k in pairs(a1) do
        if typeof(k) ~= "number" then
            return false
        end
        if k % 1 == 0 and not (k < 1) then
            v1 = v1 + 1
            v2 = v2 + k
            continue
        end
        return false
    end
    return v2 == v1 * (v1 + 1) / 2
end