-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-validate@3.10.0.jest-validate.utils
-- Decompile time: 0.56 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Boolean = v1.Boolean
local Error = v1.Error
local v2 = {}
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
local v3 = {__index = Error}
local u24 = setmetatable({}, v3)
u24.__index = u24

function u24.new(a1, a2, a3) -- Line: 53
    -- upvalues: Error (val), u24 (val), Boolean (val), chalk (val)
    local v1 = Error.new()
    local v2 = setmetatable(v1, u24)
    v2.name = ""
    v2.message = chalk.red((chalk.bold(a1)) .. ":\n\n" .. a2 .. (if a3 == nil then "\n" else if not Boolean.toJSBoolean(a3) then "\n" else "\n\n" .. a3))
    return v2
end

v2.ValidationError = u24
return v2