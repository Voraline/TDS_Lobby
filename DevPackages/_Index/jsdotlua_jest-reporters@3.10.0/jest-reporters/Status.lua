-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-reporters@3.10.0.jest-reporters.Status
-- Decompile time: 12.07 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local String = v1.String
local setTimeout = v1.setTimeout
local setInterval = v1.setInterval
local clearInterval = v1.clearInterval
local v2 = {}
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
local len = utf8.len
require(script.Parent.Parent:WaitForChild("jest-test-result"))
require(script.Parent.Parent:WaitForChild("jest-types"))
require(script.Parent:WaitForChild("types"))
local utils = require(script.Parent:WaitForChild("utils"))
local getSummary = utils.getSummary
local printDisplayName = utils.printDisplayName
local trimAndFormatPath = utils.trimAndFormatPath
local wrapAnsiString = utils.wrapAnsiString
local u74 = (chalk.reset(chalk.inverse(chalk.yellow(chalk.bold(" RUNS "))))) .. " "
local u75 = {}
u75.__index = u75

function u75.new() -- Line: 84 -- upvalues: u75 (val)
    local v1 = setmetatable({}, u75)
    v1._array = {}
    return v1
end

function u75:add(a2, a3) -- Line: 90 -- upvalues: Array (val)
    local v1 = Array.indexOf(self._array, nil)
    local v2 = {config = a3, testPath = a2}
    if v1 ~= -1 then
        self._array[v1] = v2
        return
    end
    table.insert(self._array, v2)
end

function u75:delete(a2) -- Line: 100 -- upvalues: Array (val), Boolean (val)
    local v1 = Array.find(self._array, function(a1) -- Line: 101 -- upvalues: a2 (val)
        local v1 = false
        if a1 ~= nil then
            v1 = a1.testPath == a2
        end
        return v1
    end)
    local _array_2 = self._array
    local indexOf = Array.indexOf
    local _array_3 = self._array
    _array_2[(indexOf(_array_3, Boolean.toJSBoolean(v1) and v1 or nil))] = nil
end

function u75:get() -- Line: 107
    return self._array
end

local u80 = {}
u80.__index = u80

function u80.new() -- Line: 142 -- upvalues: u80 (val), u75 (val)
    local v1 = setmetatable({}, u80)
    v1._cache = nil
    v1._currentTests = u75.new()
    v1._currentTestCases = {}
    v1._done = false
    v1._emitScheduled = false
    v1._estimatedTime = 0
    v1._showStatus = false
    return v1
end

function u80.onChange(a1, a2) -- Line: 154 -- types: a1: table, a2: function
    a1._callback = a2
end

function u80.runStarted(a1, a2, a3) -- Line: 158 -- upvalues: Boolean (val), setInterval (val)
    a1._estimatedTime = if not Boolean.toJSBoolean(a3) then 0 else if not Boolean.toJSBoolean(a3.estimatedTime) then 0 else a3.estimatedTime
    a1._showStatus = if not Boolean.toJSBoolean(a3) then a3 else a3.showStatus
    a1._interval = setInterval(function() -- Line: 163 -- upvalues: a1 (val)
        return a1:_tick()
    end, 1000)
    a1._aggregatedResults = a2
    a1:_debouncedEmit()
end

function u80.runFinished(a1) -- Line: 170 -- upvalues: Boolean (val), clearInterval (val)
    a1._done = true
    if Boolean.toJSBoolean(a1._interval) then
        clearInterval(a1._interval)
    end
    a1:_emit()
end

function u80.addTestCaseResult(a1, a2, a3) -- Line: 178 -- upvalues: Boolean (val)
    table.insert(a1._currentTestCases, {test = a2, testCaseResult = a3})
    if not Boolean.toJSBoolean(a1._showStatus) then
        a1:_emit()
        return
    end
    a1:_debouncedEmit()
end

function u80.testStarted(a1, a2, a3) -- Line: 187
    a1._currentTests:add(a2, a3)
    if not a1._showStatus then
        a1:_emit()
        return
    end
    a1:_debouncedEmit()
end

function u80.testFinished(a1, a2, a3, a4) -- Line: 196 -- upvalues: Array (val)
    local testFilePath = a3.testFilePath
    a1._aggregatedResults = a4
    a1._currentTests:delete(testFilePath)
    a1._currentTestCases = Array.filter(a1._currentTestCases, function(a1) -- Line: 204 -- upvalues: a2 (val), testFilePath (val)
        local test = a1.test
        if a2 ~= test.context.config then
            return true
        end
        return test.path ~= testFilePath
    end)
    a1:_debouncedEmit()
end

function u80:get() -- Line: 214
    -- upvalues: Boolean (val), Array (val), printDisplayName (val), u74 (val), len (val), wrapAnsiString (val)
    -- upvalues: trimAndFormatPath (val), getSummary (val), String (val)
    local v1
    if Boolean.toJSBoolean(self._cache) then
        return self._cache
    end
    if Boolean.toJSBoolean(self._done) then
        return {clear = "", content = ""}
    end
    local u60 = "\n"
    Array.forEach(self._currentTests:get(), function(a1) -- Line: 223
        -- upvalues: Boolean (upval), printDisplayName (upval), u74 (upval), len (upval), u60 (ref)
        -- upvalues: wrapAnsiString (upval), trimAndFormatPath (upval)
        if Boolean.toJSBoolean(a1) then
            local config = a1.config
            local testPath = a1.testPath
            local v1 = if not Boolean.toJSBoolean(config.displayName) then "" else ("%s "):format((tostring((printDisplayName(config)))))
            local v2 = u74 .. v1
            local v3 = len(v2)
            assert(v3 ~= nil)
            u60 = u60 .. (wrapAnsiString(v2 .. trimAndFormatPath(v3, config, testPath, 0), 0)) .. "\n"
        end
    end)
    if self._showStatus and Boolean.toJSBoolean(self._aggregatedResults) then
        v1 = u60
        u60 = v1 .. "\n" .. tostring((getSummary(self._aggregatedResults, {
            roundTime = true,
            width = 0,
            currentTestCases = self._currentTestCases,
            estimatedTime = self._estimatedTime,
        })))
    end
    v1 = 0
    local v2 = 0
    local v3 = utf8.len(u60)
    assert(v3 ~= nil)
    local v4 = self
    while v2 < v3 do
        if String.charCodeAt(u60, v2) == "\n" then
            v1 = v1 + 1
        end
        v2 = v2 + 1
    end
    v4._cache = {clear = ("\n"):rep(v1), content = u60}
    return v4._cache
end

function u80:_emit() -- Line: 263 -- upvalues: Boolean (val)
    self._cache = nil
    if Boolean.toJSBoolean(self._callback) then
        self:_callback()
    end
end

function u80:_debouncedEmit() -- Line: 270 -- upvalues: Boolean (val), setTimeout (val)
    if not Boolean.toJSBoolean(self._emitScheduled) then
        self._emitScheduled = true
        setTimeout(function() -- Line: 275 -- upvalues: self (val)
            self:_emit()
            self._emitScheduled = false
        end, 100)
    end
end

function u80:_tick() -- Line: 282
    self:_debouncedEmit()
end

v2.default = u80
return v2