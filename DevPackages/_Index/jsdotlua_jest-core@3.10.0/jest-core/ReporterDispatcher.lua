-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-core@3.10.0.jest-core.ReporterDispatcher
-- Decompile time: 5.49 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local instanceof = v1.instanceof
local promise = require(script.Parent.Parent:WaitForChild("promise"))
local v2 = {}
require(script.Parent.Parent:WaitForChild("jest-reporters"))
require(script.Parent.Parent:WaitForChild("jest-test-result"))
require(script.Parent.Parent:WaitForChild("jest-runtime"))
require(script.Parent:WaitForChild("types"))
local u56 = {}
u56.__index = u56

function u56.new() -- Line: 90 -- upvalues: u56 (val)
    local v1 = setmetatable({}, u56)
    v1._reporters = {}
    return v1
end

function u56.register(a1, a2) -- Line: 96
    table.insert(a1._reporters, a2)
end

function u56.unregister(a1, a2) -- Line: 100
    -- upvalues: Array (val), instanceof (val)
    a1._reporters = Array.filter(a1._reporters, function(a1) -- Line: 101 -- upvalues: instanceof (upval), a2 (val)
        return not instanceof(a1, a2)
    end)
end

function u56.onTestFileResult(a1, a2, a3, a4) -- Line: 106 -- upvalues: promise (val)
    return (promise.resolve()):andThen(function() -- Line: 111 -- upvalues: a1 (val), promise (upval), a2 (val), a3 (val), a4 (val)
        for i, j in a1._reporters do
            if j.onTestFileResult ~= nil then
                promise.resolve(j.onTestFileResult(j, a2, a3, a4)):expect()
            elseif j.onTestResult ~= nil then
                promise.resolve(j.onTestResult(j, a2, a3, a4)):expect()
            end
        end
        a3.coverage = nil
        a3.console = nil
    end)
end

function u56.onTestFileStart(a1, a2) -- Line: 126 -- upvalues: promise (val)
    return (promise.resolve()):andThen(function() -- Line: 127 -- upvalues: a1 (val), promise (upval), a2 (val)
        for i, j in a1._reporters do
            if j.onTestFileStart ~= nil then
                promise.resolve(j.onTestFileStart(j, a2)):expect()
            elseif j.onTestStart ~= nil then
                promise.resolve(j.onTestStart(j, a2)):expect()
            end
        end
    end)
end

function u56.onRunStart(a1, a2, a3) -- Line: 138 -- upvalues: promise (val)
    return (promise.resolve()):andThen(function() -- Line: 139 -- upvalues: a1 (val), promise (upval), a2 (val), a3 (val)
        for i, j in a1._reporters do
            if j.onRunStart ~= nil then
                promise.resolve(j:onRunStart(a2, a3)):expect()
            end
        end
    end)
end

function u56.onTestCaseResult(a1, a2, a3) -- Line: 148 -- upvalues: promise (val)
    return (promise.resolve()):andThen(function() -- Line: 149 -- upvalues: a1 (val), promise (upval), a2 (val), a3 (val)
        for i, j in a1._reporters do
            if j.onTestCaseResult ~= nil then
                promise.resolve(j.onTestCaseResult(j, a2, a3)):expect()
            end
        end
    end)
end

function u56.onRunComplete(a1, a2, a3) -- Line: 158 -- upvalues: promise (val)
    return (promise.resolve()):andThen(function() -- Line: 159 -- upvalues: a1 (val), promise (upval), a2 (val), a3 (val)
        for i, j in a1._reporters do
            if j.onRunComplete ~= nil then
                promise.resolve(j:onRunComplete(a2, a3)):expect()
            end
        end
    end)
end

function u56:getErrors() -- Line: 168 -- upvalues: Array (val)
    return Array.reduce(self._reporters, function(a1, a2) -- Line: 169 -- upvalues: Array (upval)
        local v1 = if a2.getLastError == nil then nil else a2:getLastError()
        if v1 ~= nil then
            return (Array.concat(a1, v1))
        end
        return a1
    end, {})
end

function u56.hasErrors(a1) -- Line: 179
    return #a1:getErrors() ~= 0
end

v2.default = u56
return v2