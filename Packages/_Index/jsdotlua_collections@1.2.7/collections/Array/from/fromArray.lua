-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Array.from.fromArray
-- Decompile time: 0.43 ms

require(script.Parent.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(a1, a2, a3) -- Line: 8 -- types: a2: function?
    if not a2 then
        return (table.clone(a1))
    end
    local v1 = #a1
    local v2 = table.create(v1)
    local v3, v4, v5 = a3, a2, a1
    for i = 1, v1 do
        if v3 == nil then
            v2[i] = (v4(v5[i], i))
        else
            v2[i] = (v4(v3, v5[i], i))
        end
    end
    return v2
end