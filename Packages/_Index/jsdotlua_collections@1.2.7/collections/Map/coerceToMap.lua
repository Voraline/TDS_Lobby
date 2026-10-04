-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Map.coerceToMap
-- Decompile time: 0.25 ms

local Map = require(script.Parent:WaitForChild("Map"))
local Object = require(script.Parent.Parent:WaitForChild("Object"))
local u26 = require(script.Parent.Parent.Parent:WaitForChild("instance-of"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(a1) -- Line: 9 -- upvalues: u26 (val), Map (val), Object (val)
    return u26(a1, Map) and a1 or Map.new(Object.entries(a1))
end