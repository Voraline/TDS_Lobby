-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Array.flatMap
-- Decompile time: 0.33 ms

local __DEV__ = _G.__DEV__
local flat = require(script.Parent:WaitForChild("flat"))
local map = require(script.Parent:WaitForChild("map"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(a1, a2, a3) -- Line: 9 -- upvalues: __DEV__ (val), flat (val), map (val) -- types: a2: function
    if __DEV__ then
        if typeof(a1) ~= "table" then
            error(string.format("Array.flatMap called on %s", (typeof(a1))))
        end
        if typeof(a2) ~= "function" then
            error("callback is not a function")
        end
    end
    return flat(map(a1, a2, a3))
end