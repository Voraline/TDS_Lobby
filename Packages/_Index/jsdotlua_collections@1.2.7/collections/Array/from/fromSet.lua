-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Array.from.fromSet
-- Decompile time: 0.36 ms

require(script.Parent.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(a1, a2, a3) -- Line: 8 -- types: a2: function?
    if not a2 then
        return (table.clone(a1._array))
    end
    local v1 = {}
    for i, j in a1 do
        if a3 == nil then
            v1[i] = (a2(j, i))
        else
            v1[i] = (a2(a3, j, i))
        end
    end
    return v1
end