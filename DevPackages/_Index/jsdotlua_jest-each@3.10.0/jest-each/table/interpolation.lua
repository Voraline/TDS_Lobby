-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-each@3.10.0.jest-each.table.interpolation
-- Decompile time: 3.03 ms

local v1 = require(script.Parent.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local Object = v1.Object
local String = v1.String
local v2 = {}
local isPrimitive = require(script.Parent.Parent.Parent:WaitForChild("jest-get-type")).isPrimitive
local format = (require((script.Parent.Parent.Parent:WaitForChild("pretty-format")))).format
local getMatchingKeyPaths = nil
local replaceKeyPathWithValue = nil
local getPath = nil

function v2.interpolateVariables(a1, a2, a3) -- Line: 33
    -- upvalues: Array (val), Object (val), getMatchingKeyPaths (ref), replaceKeyPathWithValue (ref)
    return ((Array.reduce(Array.reduce(Object.keys(a2), getMatchingKeyPaths(a1), {}), replaceKeyPathWithValue(a2), a1)):gsub("%$#", tostring(a3), 1)):gsub(
        "%%#",
        tostring(a3),
        1
    )
end

function getMatchingKeyPaths(a1) -- Line: 47 -- upvalues: Array (val) -- types: a1: string
    return function(a1_2, a2) -- Line: 48 -- upvalues: Array (upval), a1 (val) -- types: a2: string
        local concat = Array.concat
        local v1 = {}
        for i in a1:gmatch((("%%$%s[%%.%%w]*"):format(a2))) do
            table.insert(v1, i)
        end
        return concat(a1_2, v1)
    end
end

function replaceKeyPathWithValue(a1) -- Line: 62
    -- upvalues: String (val), getPath (ref), isPrimitive (val), format (val)
    return function(a1_2, a2) -- Line: 63
        -- upvalues: String (upval), getPath (upval), a1 (val), isPrimitive (upval), format (upval)
        local v1 = a2:gsub("%$", "", 1)
        local v2 = String.split(v1, ".")
        local v3 = getPath(a1, v2)
        if isPrimitive(v3) then
            return a1_2:gsub(a2, tostring(v3), 1)
        end
        return a1_2:gsub(a2, format(v3, {maxDepth = 1, min = true}), 1)
    end
end

function getPath(a1, a2) -- Line: 112 -- upvalues: Boolean (val), getPath (ref) -- types: a1: table
    local v1 = table.unpack(a2, 1, 1)
    local v2 = if not (#a2 > 1) then {} else {table.unpack(a2, 2)}
    if Boolean.toJSBoolean(v1) and a1[v1] ~= nil then
        return getPath(a1[v1], v2)
    end
    return a1
end

v2.getPath = getPath
return v2