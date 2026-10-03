-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Array.findIndex
-- Decompile time: 0.21 ms

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(a1, a2) -- Line: 5 -- types: a2: function
    local v1 = #a1
    for i = 1, v1 do
        if a2(a1[i], i, a1) then
            return i
        end
    end
    return -1
end