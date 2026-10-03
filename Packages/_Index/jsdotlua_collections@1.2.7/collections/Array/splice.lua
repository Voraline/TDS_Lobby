-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Array.splice
-- Decompile time: 0.71 ms

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(a1, a2, a3, ...) -- Line: 7 -- types: a2: number, a3: number?
    if #a1 < a2 then
        for k = 1, (select("#", ...)) do
            table.insert(a1, (select(k, ...)))
        end
        return {}
    end
    local v1 = #a1
    if a2 < 1 then
        a2 = math.max(v1 - math.abs(a2), 1)
    end
    local v2 = {}
    local v3 = a3 or v1
    if v3 > 0 then
        for i = a2, (math.min(v1, a2 + (math.max(0, v3 - 1)))) do
            table.insert(v2, (table.remove(a1, a2)))
        end
    end
    for j = select("#", ...), 1, -1 do
        table.insert(a1, a2, (select(j, ...)))
    end
    return v2
end