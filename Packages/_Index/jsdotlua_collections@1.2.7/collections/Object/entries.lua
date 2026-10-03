-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Object.entries
-- Decompile time: 0.53 ms

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(a1) -- Line: 6
    assert(a1 ~= nil, "cannot get entries from a nil value")
    local v1 = typeof(a1)
    local v2 = {}
    if v1 == "table" then
        for k, v in pairs(a1) do
            table.insert(v2, {k, v})
        end
        return v2
    end
    if v1 == "string" then
        local v3
        for i = 1, (string.len(a1)) do
            v3 = {tostring(i), (string.sub(a1, i, i))}
            v2[i] = v3
        end
    end
    return v2
end