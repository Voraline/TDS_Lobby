-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Array.reduce
-- Decompile time: 0.64 ms

local __DEV__ = _G.__DEV__
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(a1, a2, a3) -- Line: 9 -- upvalues: __DEV__ (val) -- types: a2: function
    local v1
    if __DEV__ then
        if typeof(a1) ~= "table" then
            error(string.format("Array.reduce called on %s", (typeof(a1))))
        end
        if typeof(a2) ~= "function" then
            error("callback is not a function")
        end
    end
    local v2 = #a1
    local v3 = 1
    if a3 == nil then
        v3 = 2
        if v2 == 0 then
            error("reduce of empty array with no initial value")
        end
        v1 = a1[1]
    else
        v1 = a3
    end
    for i = v3, v2 do
        v1 = a2(v1, a1[i], i, a1)
    end
    return v1
end