-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Array.slice
-- Decompile time: 0.65 ms

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(a1, a2, a3) -- Line: 6 -- types: a2: number?, a3: number?
    if typeof(a1) ~= "table" then
        error(string.format("Array.slice called on %s", (typeof(a1))))
    end
    local v1 = #a1
    local v2 = a2 or 1
    local v3 = if a3 == nil then v1 + 1 else if not (v1 + 1 < a3) then a3 else v1 + 1
    if v1 + 1 < v2 then
        return {}
    end
    local v4 = {}
    if v2 < 1 then
        v2 = math.max(v1 - math.abs(v2), 1)
    end
    if v3 < 1 then
        v3 = math.max(v1 - math.abs(v3), 1)
    end
    local v5 = v2
    local v6 = 1
    while v5 < v3 do
        v4[v6] = a1[v5]
        v5 = v5 + 1
        v6 = v6 + 1
    end
    return v4
end