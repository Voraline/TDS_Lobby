-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Array.indexOf
-- Decompile time: 0.48 ms

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(a1, a2, a3) -- Line: 10 -- types: a3: number?
    local v1 = a3 or 1
    local v2 = #a1
    if v1 < 1 then
        v1 = math.max(v2 - math.abs(v1), 1)
    end
    for i = v1, v2 do
        if a1[i] == a2 then
            return i
        end
    end
    return -1
end