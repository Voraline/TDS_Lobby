-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-util@3.10.0.jest-util.convertDescriptorToString
-- Decompile time: 0.53 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Error = v1.Error
local String = v1.String
return {
    default = function(a1) -- Line: 26 -- upvalues: String (val), Error (val)
        local v1 = typeof(a1)
        if v1 == "function" then
            local v2 = String.trim(debug.info(a1, "n"))
            if v2 ~= nil and v2 ~= "" then
                return v2
            end
            error(Error.new(("Invalid first argument, %s. It must be a named function, number, or string."):format(if typeof(a1) ~= "function" then tostring(a1) else "[Function anonymous]")))
            return
        end
        if v1 ~= "number" and a1 ~= nil then
            if v1 == "string" then
                return a1
            end
            error(Error.new(("Invalid first argument, %s. It must be a named function, number, or string."):format(if typeof(a1) ~= "function" then tostring(a1) else "[Function anonymous]")))
            return
        end
        return ("%s"):format((tostring(a1)))
    end,
}