-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Array.concat
-- Decompile time: 0.83 ms

local __DEV__ = _G.__DEV__
local isArray = require(script.Parent:WaitForChild("isArray"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(a1, ...) -- Line: 12 -- upvalues: isArray (val), __DEV__ (val)
    local v1, v2, v3, v4, v5
    if not isArray(a1) then
        v2 = 1
        v1 = {[v2] = a1}
    else
        v1 = table.clone(a1)
        v2 = #a1
    end
    for i = 1, (select("#", ...)) do
        v3 = select(i, ...)
        v4 = typeof(v3)
        if v3 ~= nil then
            if v4 ~= "table" then
                v2 = v2 + 1
                v1[v2] = v3
            else
                if __DEV__ and not isArray(v3) then
                    error("Array.concat(...) only works with array-like tables but it received an object-like table.\nYou can avoid this error by wrapping the object-like table into an array. Example: `concat({1, 2}, {a = true})` should be `concat({1, 2}, { {a = true} }`")
                end
                v5 = #v3
                for j = 1, v5 do
                    v2 = v2 + 1
                    v1[v2] = v3[j]
                end
            end
        end
    end
    return v1
end