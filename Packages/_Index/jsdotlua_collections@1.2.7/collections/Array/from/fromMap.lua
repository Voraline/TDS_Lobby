-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Array.from.fromMap
-- Decompile time: 0.44 ms

require(script.Parent.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(a1, a2, a3) -- Line: 8 -- types: a2: function?
    local v1
    if not a2 then
        v1 = {}
        for i, j in a1 do
            v1[i] = j
        end
        return v1
    end
    v1 = {}
    for k, n in a1 do
        if a3 == nil then
            v1[k] = (a2(n, k))
        else
            v1[k] = (a2(a3, n, k))
        end
    end
    return v1
end