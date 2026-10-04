-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-core@3.10.0.jest-core.lib.logDebugMessages
-- Decompile time: 0.64 ms

require(script.Parent.Parent.Parent:WaitForChild("luau-polyfill"))
local v1 = {}
require(script.Parent.Parent.Parent:WaitForChild("jest-types"))
local JSON = require(script.Parent.Parent.Parent:WaitForChild("jest-roblox-shared")).nodeUtils.JSON

function v1.default(a1, a2, a3) -- Line: 29 -- upvalues: JSON (val)
    a3:write((JSON.stringify({version = "27.4.7", configs = a2, globalConfig = a1}, nil, "  ")) .. "\n")
end

return v1