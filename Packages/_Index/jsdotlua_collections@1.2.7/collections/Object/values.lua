-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Object.values
-- Decompile time: 0.49 ms

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(a1) -- Line: 5
    if a1 == nil then
        error("cannot extract values from a nil value")
    end
    local v1 = typeof(a1)
    local v2 = nil
    if v1 == "table" then
        v2 = {}
        for k, v in pairs(a1) do
            table.insert(v2, v)
        end
        return v2
    end
    if v1 == "string" then
        local v3 = a1:len()
        v2 = table.create(v3)
        for i = 1, v3 do
            v2[i] = (a1:sub(i, i))
        end
    end
    return v2
end