-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Array.every
-- Decompile time: 0.48 ms

local __DEV__ = _G.__DEV__
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(a1, a2, a3) -- Line: 10 -- upvalues: __DEV__ (val) -- types: a2: function
    local v1
    if __DEV__ then
        if typeof(a1) ~= "table" then
            error(string.format("Array.every called on %s", (typeof(a1))))
        end
        if typeof(a2) ~= "function" then
            error("callback is not a function")
        end
    end
    local v2 = #a1
    local v3 = 1
    while v3 <= v2 do
        v1 = a1[v3]
        if v1 ~= nil and not (if a3 == nil then a2(v1, v3, a1) else a2(a3, v1, v3, a1)) then
            return false
        end
        v3 = v3 + 1
    end
    return true
end