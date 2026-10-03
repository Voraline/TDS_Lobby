-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-reporters@3.10.0.jest-reporters.VerboseReporter
-- Decompile time: 4.20 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local v2 = {}
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
require(script.Parent.Parent:WaitForChild("jest-test-result"))
require(script.Parent.Parent:WaitForChild("jest-types"))
local v3 = require(script.Parent.Parent:WaitForChild("jest-util"))
local formatTime = v3.formatTime
local ICONS = v3.ICONS
local default = require(script.Parent:WaitForChild("DefaultReporter")).default
require(script.Parent:WaitForChild("types"))
require(script.Parent.Parent:WaitForChild("jest-roblox-shared"))
local v4 = {__index = default}
local u79 = setmetatable({}, v4)
u79.__index = u79
u79.filename = "VerboseReporter"

local function round(a1) -- Line: 63 -- types: a1: number
    return math.floor(a1 * 1 + 0.5) / 1
end

function u79.new(a1) -- Line: 69 -- upvalues: default (val), u79 (val)
    local v1 = default.new(a1)
    local v2 = setmetatable(v1, u79)
    v2._globalConfig = a1
    return v2
end

function u79.__wrapStdio(a1, a2) -- Line: 77
    local write = a2.write

    function a2.write(a1_2, a2_2) -- Line: 79 -- upvalues: a1 (val), write (val), a2 (val) -- types: a2_2: string
        a1:__clearStatus()
        write(a2, a2_2)
        a1:__printStatus()
        return true
    end
end

function u79.filterTestResults(a1) -- Line: 87 -- upvalues: Array (val)
    return Array.filter(a1, function(a1) -- Line: 88
        return a1.status ~= "pending"
    end)
end

function u79.groupTestsBySuites(a1) -- Line: 94 -- upvalues: Array (val)
    local u1 = {title = "", suites = {}, tests = {}}
    Array.forEach(a1, function(a1) -- Line: 97 -- upvalues: u1 (val), Array (upval)
        local v1
        local v2 = u1
        for i, v in ipairs(a1.ancestorTitles) do
            v1 = Array.find(v2.suites, function(a1) -- Line: 103 -- upvalues: v (val)
                return a1.title == v
            end)
            if v1 == nil then
                table.insert(v2.suites, {suites = {}, tests = {}, title = v})
            end
            v2 = v1
        end
        table.insert(v2.tests, a1)
    end)
    return u1
end

function u79.onTestResult(a1, a2, a3, a4) -- Line: 118 -- upvalues: default (val), Boolean (val)
    default.testFinished(a1, a2.context.config, a3, a4)
    if not Boolean.toJSBoolean(a3.skipped) then
        a1:printTestFileHeader(a3.testFilePath, a2.context.config, a3)
        if not Boolean.toJSBoolean(a3.testExecError) and not Boolean.toJSBoolean(a3.skipped) then
            a1:_logTestResults(a3.testResults)
        end
        a1:printTestFileFailureMessage(a3.testFilePath, a2.context.config, a3)
    end
    default.forceFlushBufferedOutput(a1)
end

function u79:_logTestResults(a2) -- Line: 134 -- upvalues: u79 (val)
    self:_logSuite(u79.groupTestsBySuites(a2), 0)
    self:_logLine()
end

function u79:_logSuite(a2, a3) -- Line: 139 -- upvalues: Boolean (val), Array (val) -- types: self: table, a3: number
    if Boolean.toJSBoolean(a2.title) then
        self:_logLine(a2.title, a3)
    end
    self:_logTests(a2.tests, a3 + 1)
    Array.forEach(a2.suites, function(a1) -- Line: 144 -- upvalues: self (val), a3 (val)
        self:_logSuite(a1, a3 + 1)
    end)
end

function u79._getIcon(a1, a2) -- Line: 149 -- upvalues: chalk (val), ICONS (val) -- types: a1: table, a2: string
    if a2 == "failed" then
        return chalk.red(ICONS.failed)
    end
    if a2 == "pending" then
        return chalk.yellow(ICONS.pending)
    end
    if a2 == "todo" then
        return chalk.magenta(ICONS.todo)
    end
    return chalk.green(ICONS.success)
end

function u79:_logTest(a2, a3) -- Line: 161 -- upvalues: formatTime (val), chalk (val) -- types: self: table, a3: number
    self:_logLine(
        (self:_getIcon(a2.status)) .. " " .. chalk.dim(a2.title .. (if a2.duration == nil then "" else (" (%s)"):format((tostring((formatTime((math.floor(a2.duration * 1 + 0.5)) / 1))))))),
        a3
    )
end

function u79:_logTests(a2, a3) -- Line: 167 -- upvalues: Boolean (val), Array (val) -- types: self: table, a3: number
    if Boolean.toJSBoolean(self._globalConfig.expand) then
        Array.forEach(a2, function(a1) -- Line: 169 -- upvalues: self (val), a3 (val)
            return self:_logTest(a1, a3)
        end)
        return
    end
    local v1 = Array.reduce(a2, function(a1, a2) -- Line: 173 -- upvalues: self (val), a3 (val)
        if a2.status == "pending" then
            table.insert(a1.pending, a2)
            return a1
        end
        if a2.status == "todo" then
            table.insert(a1.todo, a2)
            return a1
        end
        self:_logTest(a2, a3)
        return a1
    end, {pending = {}, todo = {}})
    if #v1.pending > 0 then
        Array.forEach(v1.pending, self:_logTodoOrPendingTest(a3))
    end
    if #v1.todo > 0 then
        Array.forEach(v1.todo, self:_logTodoOrPendingTest(a3))
    end
end

function u79._logTodoOrPendingTest(a1, a2) -- Line: 192 -- upvalues: chalk (val) -- types: a1: table, a2: number
    return function(a1_2) -- Line: 193 -- upvalues: a1 (val), chalk (upval), a2 (val)
        local status = if a1_2.status ~= "pending" then a1_2.status else "skipped"
        a1:_logLine(("%s %s"):format(a1:_getIcon(a1_2.status), (chalk.dim(("%s %s"):format(status, a1_2.title)))), a2)
    end
end

function u79:_logLine(a2, a3) -- Line: 201 -- upvalues: Boolean (val) -- types: self: table, a2: string?, a3: number?
    self:log((("  "):rep(Boolean.toJSBoolean(a3) and a3 or 0)) .. (a2 or ""))
end

v2.default = u79
return v2