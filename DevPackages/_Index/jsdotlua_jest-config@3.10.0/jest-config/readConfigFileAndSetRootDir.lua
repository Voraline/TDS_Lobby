-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-config@3.10.0.jest-config.readConfigFileAndSetRootDir
-- Decompile time: 1.79 ms

local Error = (require((script.Parent.Parent:WaitForChild("luau-polyfill")))).Error
local promise = require(script.Parent.Parent:WaitForChild("promise"))
local v1 = {}
require(script.Parent.Parent:WaitForChild("jest-types"))

function v1.default(a1) -- Line: 42 -- upvalues: promise (val), Error (val) -- types: a1: userdata
    return (promise.resolve()):andThen(function() -- Line: 46 -- upvalues: a1 (val), Error (upval), promise (upval)
        local success, result = pcall(require, a1)
        if not success then
            error(Error.new(("Failed to load the Luau config file %s\n  %s"):format(tostring(a1), (tostring(result)))))
        end
        local v1 = result
        if typeof(v1) == "function" then
            v1 = promise.resolve(v1()):expect()
        end
        if not v1.rootDir or typeof(v1.rootDir) ~= "Instance" then
            v1.rootDir = a1.Parent
        end
        return v1
    end)
end

return v1