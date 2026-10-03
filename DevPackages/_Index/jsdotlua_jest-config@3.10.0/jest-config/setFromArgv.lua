-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-config@3.10.0.jest-config.setFromArgv
-- Decompile time: 1.09 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Object = v1.Object
local v2 = {}
require(script.Parent.Parent:WaitForChild("jest-types"))
local isJSONString = require(script.Parent:WaitForChild("utils")).isJSONString
local JSON = (require((script.Parent.Parent:WaitForChild("jest-roblox-shared")))).nodeUtils.JSON
local u41 = {"_", "$0", "h", "help", "config"}

function v2.default(a1, a2) -- Line: 29
    -- upvalues: Array (val), Object (val), u41 (val), isJSONString (val), JSON (val)
    return Object.assign({}, a1, if not isJSONString(a2.config) then nil else JSON.parse(a2.config), (Array.reduce(Array.filter(Object.keys(a2), function(a1) -- Line: 31 -- upvalues: a2 (val), Array (upval), u41 (upval)
        local v1 = false
        if a2[a1] ~= nil then
            v1 = Array.indexOf(u41, a1) == -1
        end
        return v1
    end), function(a1, a2_2) -- Line: 35 -- upvalues: a2 (val), isJSONString (upval), JSON (upval) -- types: a1: table
        if a2_2 == "json" then
            a1.useStderr = a2[a2_2]
            return a1
        end
        if a2_2 == "config" then
            return a1
        end
        if a2_2 ~= "globals" then
            a1[a2_2] = a2[a2_2]
            return a1
        end
        local v1 = a2[a2_2]
        if not isJSONString(v1) then
            return a1
        end
        a1[a2_2] = (JSON.parse(v1))
        return a1
    end, {})))
end

return v2