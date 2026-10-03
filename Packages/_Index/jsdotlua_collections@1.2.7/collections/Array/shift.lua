-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Array.shift
-- Decompile time: 0.28 ms

local __DEV__ = _G.__DEV__
local isArray = require(script.Parent:WaitForChild("isArray"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(a1) -- Line: 6 -- upvalues: __DEV__ (val), isArray (val)
    if __DEV__ and not isArray(a1) then
        error(string.format("Array.shift called on non-array %s", (typeof(a1))))
    end
    if #a1 > 0 then
        return table.remove(a1, 1)
    end
    return nil
end