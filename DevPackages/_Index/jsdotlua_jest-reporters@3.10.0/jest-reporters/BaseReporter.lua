-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-reporters@3.10.0.jest-reporters.BaseReporter
-- Decompile time: 0.93 ms

local Object = (require((script.Parent.Parent:WaitForChild("luau-polyfill")))).Object
local v1 = {}
require(script.Parent.Parent:WaitForChild("jest-test-result"))
local remove = require(script.Parent.Parent:WaitForChild("jest-util")).remove
require(script.Parent:WaitForChild("types"))
local Writeable = (require((script.Parent.Parent:WaitForChild("jest-roblox-shared")))).Writeable
local u48 = {}
u48.__index = u48

function u48.new(a1) -- Line: 48 -- upvalues: u48 (val), Object (val), Writeable (val)
    local v1 = setmetatable({}, u48)
    v1._process = Object.assign({}, {env = {}, stdout = Writeable.new(), stderr = Writeable.new()}, a1 or {})
    return v1
end

function u48.log(a1, a2) -- Line: 60 -- types: a1: table, a2: string
    a1._process.stderr:write(a2)
end

function u48.onRunStart(a1, a2, a3) -- Line: 64 -- upvalues: remove (val)
    remove(a1._process.stderr)
end

function u48.onTestCaseResult(a1, a2, a3) end

function u48.onTestResult(a1, a2, a3, a4) end

function u48.onTestStart(a1, a2) end

function u48.onRunComplete(a1, a2, a3) end

function u48._setError(a1, a2) -- Line: 76
    a1._error = a2
end

function u48.getLastError(a1) -- Line: 82
    return a1._error
end

v1.default = u48
return v1