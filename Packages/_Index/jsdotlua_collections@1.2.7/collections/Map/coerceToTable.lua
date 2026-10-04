-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Map.coerceToTable
-- Decompile time: 0.35 ms

local Map = require(script.Parent:WaitForChild("Map"))
local u17 = require(script.Parent.Parent.Parent:WaitForChild("instance-of"))
local reduce = require((script.Parent.Parent:WaitForChild("Array")):WaitForChild("reduce"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(a1) -- Line: 9 -- upvalues: u17 (val), Map (val), reduce (val)
    if not u17(a1, Map) then
        return a1
    end
    return reduce(a1:entries(), function(a1, a2) -- Line: 15
        a1[a2[1]] = a2[2]
        return a1
    end, {})
end