-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-config@3.10.0.jest-config.utils
-- Decompile time: 1.94 ms

local String = (require((script.Parent.Parent:WaitForChild("luau-polyfill")))).String
local v1 = {}
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
require(script.Parent.Parent:WaitForChild("jest-types"))
v1.BULLET = chalk.bold("● ")
v1.DOCUMENTATION_NOTE = ("  %s\n  https://jestjs.io/docs/configuration\n"):format((chalk.bold("Configuration Documentation:")))

function v1.isJSONString(a1) -- Line: 140 -- upvalues: String (val)
    local v1 = false
    if a1 ~= nil then
        v1 = false
        if typeof(a1) == "string" then
            v1 = String.startsWith(a1, "{") and String.endsWith(a1, "}")
        end
    end
    return v1
end

return v1