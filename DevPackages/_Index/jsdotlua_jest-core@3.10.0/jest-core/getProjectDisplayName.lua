-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-core@3.10.0.jest-core.getProjectDisplayName
-- Decompile time: 0.62 ms

local Boolean = (require((script.Parent.Parent:WaitForChild("luau-polyfill")))).Boolean
local v1 = {}
require(script.Parent.Parent:WaitForChild("jest-types"))

function v1.default(a1) -- Line: 17 -- upvalues: Boolean (val)
    local name = if typeof(a1.displayName) ~= "table" then nil else a1.displayName.name
    return Boolean.toJSBoolean(name) and name or nil
end

return v1