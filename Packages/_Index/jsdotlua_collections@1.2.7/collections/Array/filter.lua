-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Array.filter
-- Decompile time: 0.70 ms

local __DEV__ = _G.__DEV__
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(a1, a2, a3) -- Line: 10 -- upvalues: __DEV__ (val) -- types: a2: function
    local v1
    if __DEV__ then
        if typeof(a1) ~= "table" then
            error(string.format("Array.filter called on %s", (typeof(a1))))
        end
        if typeof(a2) ~= "function" then
            error("callback is not a function")
        end
    end
    local v2 = #a1
    local v3 = {}
    local v4 = 1
    if a3 == nil then
        for j = 1, v2 do
            v1 = a1[j]
            if v1 ~= nil and a2(v1, j, a1) then
                v3[v4] = v1
                v4 = v4 + 1
            end
        end
        return v3
    end
    for i = 1, v2 do
        v1 = a1[i]
        if v1 ~= nil and a2(a3, v1, i, a1) then
            v3[v4] = v1
            v4 = v4 + 1
        end
    end
    return v3
end