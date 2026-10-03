-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-util@3.10.0.jest-util.ErrorWithStack
-- Decompile time: 0.55 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Boolean = v1.Boolean
local Error = v1.Error
local v2 = {}
local v3 = {__index = Error}
local u15 = setmetatable({}, v3)
u15.__index = u15

function u15.new(a1, a2, a3) -- Line: 19
    -- upvalues: Error (val), Boolean (val), u15 (val)
    local stackTraceLimit = Error.stackTraceLimit
    if a3 ~= nil and a3 ~= 0 then
        Error.stackTraceLimit = math.max(a3, Boolean.toJSBoolean(stackTraceLimit) and stackTraceLimit or 10)
    end
    local v1 = Error.new(a1)
    local v2 = setmetatable(v1, u15)
    if Error.captureStackTrace then
        Error.captureStackTrace(v2, a2)
    end
    Error.stackTraceLimit = stackTraceLimit
    return v2
end

v2.default = u15
return v2