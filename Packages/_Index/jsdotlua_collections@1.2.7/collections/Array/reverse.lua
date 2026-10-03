-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Array.reverse
-- Decompile time: 0.28 ms

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(a1) -- Line: 5
    local v1, v2
    local v3 = #a1
    local v4 = 1
    while v4 < v3 do
        v1 = a1[v3]
        v2 = a1[v4]
        a1[v4] = v1
        a1[v3] = v2
        v4 = v4 + 1
        v3 = v3 - 1
    end
    return a1
end