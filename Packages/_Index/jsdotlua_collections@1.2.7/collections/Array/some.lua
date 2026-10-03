-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Array.some
-- Decompile time: 0.51 ms

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(a1, a2, a3) -- Line: 11 -- types: a2: function
    if typeof(a1) ~= "table" then
        error(string.format("Array.some called on %s", (typeof(a1))))
    end
    if typeof(a2) ~= "function" then
        error("callback is not a function")
    end
    local v1 = nil
    local v2 = nil
    local v3, v4, v5 = a3, a2, a1
    for i, j in a1, v1, v2 do
        if v3 == nil then
            if j ~= nil and v4(j, i, v5) then
                return true
            end
        elseif j ~= nil and v4(v3, j, i, v5) then
            return true
        end
    end
    return false
end