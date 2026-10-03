-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Array.find
-- Decompile time: 0.25 ms

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(a1, a2) -- Line: 5 -- types: a2: function
    local v1
    local v2 = #a1
    for i = 1, v2 do
        v1 = a1[i]
        if a2(v1, i, a1) then
            return v1
        end
    end
    return nil
end