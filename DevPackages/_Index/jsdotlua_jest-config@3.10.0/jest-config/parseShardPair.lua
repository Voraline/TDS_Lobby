-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-config@3.10.0.jest-config.parseShardPair
-- Decompile time: 2.25 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local Number = v1.Number
local Error = v1.Error
local String = v1.String
local u22 = require(script.Parent.Parent:WaitForChild("luau-regexp"))
return {
    parseShardPair = function(a1) -- Line: 17
        -- upvalues: Array (val), String (val), u22 (val), Boolean (val), Number (val), Error (val)
        local v1 = Array.filter(Array.map(Array.filter(String.split(a1, "/"), function(a1) -- Line: 20 -- upvalues: u22 (upval)
            return u22("^\\d+$"):test(a1)
        end), function(a1) -- Line: 23
            return (tonumber(a1, 10))
        end), function(a1) -- Line: 27 -- upvalues: Boolean (upval), Number (upval)
            return not Boolean.toJSBoolean(Number.isNaN(a1))
        end)
        local v2, v3 = table.unpack(v1, 1, 2)
        if #v1 ~= 2 then
            error(Error.new("The shard option requires a string in the format of <n>/<m>."))
        end
        if v2 == 0 or v3 == 0 then
            error(Error.new("The shard option requires 1-based values, received 0 or lower in the pair."))
        end
        if v3 < v2 then
            error(Error.new("The shard option <n>/<m> requires <n> to be lower or equal than <m>."))
        end
        return {shardCount = v3, shardIndex = v2}
    end,
}