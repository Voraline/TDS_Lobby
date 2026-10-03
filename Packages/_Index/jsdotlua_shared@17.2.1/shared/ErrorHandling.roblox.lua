-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.ErrorHandling.roblox
-- Decompile time: 0.79 ms

local u8 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Error = u8.Error
local inspect = u8.util.inspect
return {
    __ERROR_DIVIDER = "\n------ Error caught by React ------\n",
    describeError = function(a1) -- Line: 33 -- upvalues: u8 (val)
        local v1
        if typeof(a1) ~= "string" then
            return a1
        end
        _, v1 = string.find(a1, ":[%d]+: ")
        local v2 = u8.Error.new(if not v1 then a1 else string.sub(a1, v1 + 1))
        v2.stack = debug.traceback(nil, 2)
        return v2
    end,
    errorToString = function(a1) -- Line: 53 -- upvalues: inspect (val)
        if typeof(a1) ~= "table" then
            return (inspect(a1))
        end
        if a1.message and a1.stack then
            return "\n------ Error caught by React ------\n" .. a1.message .. "\n------ Error caught by React ------\n" .. tostring(a1.stack)
        end
        return (inspect(a1))
    end,
    parseReactError = function(a1) -- Line: 79 -- upvalues: Error (val) -- types: a1: string
        local v1, v2, v3
        local v4 = string.split(a1, "\n------ Error caught by React ------\n")
        if #v4 ~= 3 then
            v1 = Error.new(a1)
            v1.stack = nil
            return v1, ""
        end
        v1, v2, v3 = table.unpack(v4)
        local v5 = Error.new(v2)
        v5.stack = v3
        return v5, v1
    end,
}