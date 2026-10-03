-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Object.keys
-- Decompile time: 0.63 ms

local Set = require(script.Parent.Parent:WaitForChild("Set"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
local u28 = require(script.Parent.Parent.Parent:WaitForChild("instance-of"))
return function(a1) -- Line: 8 -- upvalues: u28 (val), Set (val)
    if a1 == nil then
        error("cannot extract keys from a nil value")
    end
    local v1 = typeof(a1)
    local v2 = nil
    if v1 == "table" then
        v2 = {}
        if u28(a1, Set) then
            return v2
        end
        for k in pairs(a1) do
            table.insert(v2, k)
        end
        return v2
    end
    if v1 == "string" then
        local v3 = a1:len()
        v2 = table.create(v3)
        for i = 1, v3 do
            v2[i] = (tostring(i))
        end
    end
    return v2
end