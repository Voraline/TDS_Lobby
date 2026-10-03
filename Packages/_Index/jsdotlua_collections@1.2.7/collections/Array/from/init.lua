-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Array.from
-- Decompile time: 0.80 ms

local Set = require(script.Parent.Parent:WaitForChild("Set"))
local Map = require((script.Parent.Parent:WaitForChild("Map")):WaitForChild("Map"))
local isArray = require(script.Parent:WaitForChild("isArray"))
local u39 = require(script.Parent.Parent.Parent:WaitForChild("instance-of"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
local fromString = require(script:WaitForChild("fromString"))
local fromSet = require(script:WaitForChild("fromSet"))
local fromMap = require(script:WaitForChild("fromMap"))
local fromArray = require(script:WaitForChild("fromArray"))
return function(a1, a2, a3) -- Line: 19
    -- upvalues: isArray (val), fromArray (val), u39 (val), Set (val), fromSet (val), Map (val), fromMap (val)
    -- upvalues: fromString (val)
    if a1 == nil then
        error("cannot create array from a nil value")
    end
    local v1 = typeof(a1)
    if v1 == "table" and isArray(a1) then
        return (fromArray(a1, a2, a3))
    end
    if u39(a1, Set) then
        return (fromSet(a1, a2, a3))
    end
    if u39(a1, Map) then
        return (fromMap(a1, a2, a3))
    end
    if v1 == "string" then
        return (fromString(a1, a2, a3))
    end
    return {}
end