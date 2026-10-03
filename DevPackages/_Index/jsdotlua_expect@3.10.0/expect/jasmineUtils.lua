-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_expect@3.10.0.expect.jasmineUtils
-- Decompile time: 0.59 ms

local v1 = require(script.Parent.Parent:WaitForChild("jest-roblox-shared"))
require(script.Parent.Parent:WaitForChild("luau-polyfill"))
return {
    equals = v1.expect.equals,
    isA = v1.expect.isA,
    fnNameFor = function(a1) -- Line: 61
        return "[Function]"
    end,
    isUndefined = function(a1) -- Line: 74
        return a1 == nil
    end,
    getPrototype = function(a1) -- Line: 78
        if getmetatable(a1) ~= nil then
            return getmetatable(a1).__index
        end
        return nil
    end,
    hasProperty = function(a1, a2) -- Line: 86 -- types: a2: string
        if not a1 then
            return false
        end
        local success, result = pcall(function() -- Line: 91 -- upvalues: a1 (val), a2 (val)
            return a1[a2]
        end)
        if success then
            return result ~= nil
        end
        error(result)
    end,
}