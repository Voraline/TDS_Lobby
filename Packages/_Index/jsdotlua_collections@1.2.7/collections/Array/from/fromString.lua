-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Array.from.fromString
-- Decompile time: 0.68 ms

require(script.Parent.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(a1, a2, a3) -- Line: 8 -- types: a1: string, a2: function?
    local v1, v2
    local v3 = #a1
    local v4 = table.create(v3)
    if not a2 then
        for i = 1, v3 do
            v4[i] = (string.sub(a1, i, i))
        end
        return v4
    end
    local v5, v6, v7 = a3, a2, a1
    for j = 1, v3 do
        if v5 == nil then
            v2 = string.sub(v7, j, j)
            v4[j] = (v6(v2, j))
        else
            v1 = string.sub(v7, j, j)
            v4[j] = (v6(v5, v1, j))
        end
    end
    return v4
end