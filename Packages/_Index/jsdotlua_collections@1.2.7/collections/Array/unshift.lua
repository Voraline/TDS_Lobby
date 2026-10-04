-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Array.unshift
-- Decompile time: 0.36 ms

local __DEV__ = _G.__DEV__
local isArray = require(script.Parent:WaitForChild("isArray"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(a1, ...) -- Line: 6 -- upvalues: __DEV__ (val), isArray (val)
    if __DEV__ and not isArray(a1) then
        error(string.format("Array.unshift called on non-array %s", (typeof(a1))))
    end
    local v1 = select("#", ...)
    if v1 > 0 then
        for i = v1, 1, -1 do
            table.insert(a1, 1, (select(i, ...)))
        end
    end
    return #a1
end