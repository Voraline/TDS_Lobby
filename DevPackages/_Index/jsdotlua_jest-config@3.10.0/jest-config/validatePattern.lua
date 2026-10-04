-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-config@3.10.0.jest-config.validatePattern
-- Decompile time: 0.63 ms

local Boolean = (require((script.Parent.Parent:WaitForChild("luau-polyfill")))).Boolean
local u18 = require(script.Parent.Parent:WaitForChild("luau-regexp"))
return {
    default = function(a1) -- Line: 15 -- upvalues: Boolean (val), u18 (val) -- types: a1: string?
        if a1 ~= nil
            and Boolean.toJSBoolean(a1)
            and not pcall(function() -- Line: 17 -- upvalues: u18 (upval), a1 (val)
                local v0
                u18(a1, "i")
                return
            end) then
            return false
        end
        return true
    end,
}