-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-get-type@3.10.0.jest-get-type
-- Decompile time: 3.51 ms

local v1 = require(script.Parent:WaitForChild("luau-polyfill"))
local Error = v1.Error
local instanceof = v1.instanceof
local u10 = nil
local Set = v1.Set
local Map = v1.Map
return {
    getType = function(a1) -- Line: 24 -- upvalues: u10 (ref), instanceof (val), Error (val), Map (val), Set (val)
        if a1 == nil then
            return "nil"
        end
        if typeof(a1) == "boolean" then
            return "boolean"
        end
        if typeof(a1) == "function" then
            return "function"
        end
        if typeof(a1) == "number" then
            return "number"
        end
        if typeof(a1) == "string" then
            return "string"
        end
        if typeof(a1) == "DateTime" then
            return "DateTime"
        end
        if typeof(a1) == "userdata" and tostring(a1):match("Symbol%(.*%)") then
            return "symbol"
        end
        if typeof(a1) == "table" then
            local success, result = pcall(function() -- Line: 51 -- upvalues: a1 (val)
                local v1 = false
                if typeof(a1.test) == "function" then
                    v1 = typeof(a1.exec) == "function"
                end
                return v1
            end)
            if success and result then
                u10 = require(script.Parent:WaitForChild("luau-regexp"))
                if instanceof(a1, u10) then
                    return "regexp"
                end
            end
        end
        if instanceof(a1, Error) then
            return "error"
        end
        if instanceof(a1, Map) then
            return "map"
        end
        if instanceof(a1, Set) then
            return "set"
        end
        if typeof(a1) == "table" then
            return "table"
        end
        if (type(a1)) ~= typeof(a1) then
            return (typeof(a1))
        end
        if type(a1) == "userdata" then
            return "userdata"
        end
        if typeof(a1) == "thread" then
            return "thread"
        end
        error(string.format("value of unknown type: %s (%s)", typeof(a1), (tostring(a1))))
    end,
    isPrimitive = function(a1) -- Line: 101
        local v1 = false
        if typeof(a1) ~= "table" then
            v1 = false
            if typeof(a1) ~= "function" then
                v1 = not ((type(a1)) ~= typeof(a1))
            end
        end
        return v1
    end,
    isRobloxBuiltin = function(a1) -- Line: 20
        return (type(a1)) ~= typeof(a1)
    end,
}