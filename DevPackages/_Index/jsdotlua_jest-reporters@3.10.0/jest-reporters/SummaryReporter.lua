-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-reporters@3.10.0.jest-reporters.SummaryReporter
-- Decompile time: 14.53 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local Set = v1.Set
local v2 = {}
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
require(script.Parent.Parent:WaitForChild("jest-test-result"))
require(script.Parent.Parent:WaitForChild("jest-types"))
local default = require(script.Parent:WaitForChild("BaseReporter")).default
local default_2 = require(script.Parent:WaitForChild("getResultHeader")).default
local default_3 = require(script.Parent:WaitForChild("getSnapshotSummary")).default
require(script.Parent:WaitForChild("types"))
local getSummary = require(script.Parent:WaitForChild("utils")).getSummary
local u110 = Set.new({
    "prepublish",
    "publish",
    "postpublish",
    "preinstall",
    "install",
    "postinstall",
    "preuninstall",
    "uninstall",
    "postuninstall",
    "preversion",
    "version",
    "postversion",
    "pretest",
    "test",
    "posttest",
    "prestop",
    "stop",
    "poststop",
    "prestart",
    "start",
    "poststart",
    "prerestart",
    "restart",
    "postrestart",
})
local u111 = nil
local u112 = nil
local u113 = nil
local v3 = {__index = default}
local u117 = setmetatable({}, v3)
u117.__index = u117
u117.filename = "SummaryReporter"

function u117.new(a1, a2) -- Line: 83 -- upvalues: default (val), u117 (val), u113 (ref), u112 (ref), u111 (ref)
    local v1 = default.new(a2)
    local v2 = setmetatable(v1, u117)
    if a2 then
        u113 = a2.env.npm_lifecycle_script
        u112 = a2.env.npm_lifecycle_event
        u111 = a2.env.npm_config_user_agent
    end
    v2._globalConfig = a1
    v2._estimatedTime = 0
    return v2
end

function u117:_write(a2) -- Line: 104 -- types: self: table, a2: string
    self._process.stderr:write(a2)
end

function u117.onRunStart(a1, a2, a3) -- Line: 117 -- upvalues: default (val)
    default.onRunStart(a1, a2, a3)
    a1._estimatedTime = a3.estimatedTime
end

function u117.onRunComplete(a1, a2, a3) -- Line: 122 -- upvalues: Boolean (val), getSummary (val), chalk (val)
    local numTotalTestSuites = a3.numTotalTestSuites
    local testResults = a3.testResults
    local wasInterrupted = a3.wasInterrupted
    if Boolean.toJSBoolean(numTotalTestSuites) then
        local v1 = testResults[#testResults]
        if Boolean.toJSBoolean(a1._globalConfig.verbose)
            and Boolean.toJSBoolean(v1)
            and not Boolean.toJSBoolean(v1.numFailingTests)
            and not Boolean.toJSBoolean(v1.testExecError) then
            a1:log("")
        end
        a1:_printSummary(a3, a1._globalConfig)
        a1:_printSnapshotSummary(a3.snapshot, a1._globalConfig)
        if Boolean.toJSBoolean(numTotalTestSuites) then
            local v2 = getSummary(a3, {estimatedTime = a1._estimatedTime})
            if not Boolean.toJSBoolean(a1._globalConfig.silent) then
                local v3 = if not Boolean.toJSBoolean(wasInterrupted) then a1:_getTestSummary(a2, a1._globalConfig) else chalk.bold(chalk.red("Test run was interrupted."))
                v2 = v2 .. "\n" .. v3
            end
            a1:log(v2)
        end
    end
end

function u117:_printSnapshotSummary(a2, a3) -- Line: 151
    -- upvalues: Boolean (val), u112 (ref), u110 (val), u111 (ref), u113 (ref), default_3 (val), Array (val)
    if Boolean.toJSBoolean(a2.added)
        or Boolean.toJSBoolean(a2.filesRemoved)
        or Boolean.toJSBoolean(a2.unchecked)
        or Boolean.toJSBoolean(a2.unmatched)
        or Boolean.toJSBoolean(a2.updated) then
        local v1 = Boolean.toJSBoolean(u112) and u112 or ""
        local v2 = if not Boolean.toJSBoolean(u110:has(v1)) then "run " else ""
        local v3 = false
        if typeof(u111) == "string" then
            v3 = string.match(u111 or "", "yarn") ~= nil
        end
        local v4 = if not Boolean.toJSBoolean(v3) then "npm" else "yarn"
        local v5 = false
        if typeof(u113) == "string" then
            v5 = Boolean.toJSBoolean(string.match(u113 or "", "jest"))
        end
        Array.forEach(default_3(
            a2,
            a3,
            if not Boolean.toJSBoolean(v1) or not v5 then "re-run jest with `-u`" else ("run `%s -u`"):format(v4 .. " " .. v2 .. v1 .. (if not v3 then " --" else ""))
        ), function(a1) -- Line: 178 -- upvalues: self (val)
            self:log(a1)
        end)
        self:log("")
    end
end

function u117:_printSummary(a2, a3) -- Line: 185 -- upvalues: chalk (val), Array (val), Boolean (val), default_2 (val)
    if 0 < (a2.numFailedTests or 0) + (a2.numRuntimeErrorTestSuites or 0) and 20 < a2.numTotalTestSuites then
        self:log((chalk.bold("Summary of all failing tests")))
        Array.forEach(a2.testResults, function(a1) -- Line: 192 -- upvalues: Boolean (upval), self (val), default_2 (upval), a3 (val)
            local failureMessage = a1.failureMessage
            if Boolean.toJSBoolean(failureMessage) then
                self:_write((default_2(a1, a3)) .. "\n" .. failureMessage .. "\n")
            end
        end)
        self:log("")
    end
end

function u117._getTestSummary(a1, a2, a3) -- Line: 202 -- upvalues: chalk (val), Boolean (val), Array (val)
    local function getMatchingTestsInfo() -- Line: 203 -- upvalues: chalk (upval)
        return chalk.dim(" matching")
    end

    local v1 = ""
    if a3.runTestsByPath then
        v1 = chalk.dim(" within paths")
    elseif Boolean.toJSBoolean(a3.testPathPattern) then
        v1 = chalk.dim(" matching")
    end
    local v2 = ""
    if a3.runTestsByPath then
        v2 = " " .. Array.join(Array.map(a3.nonFlagArgs, function(a1) -- Line: 227
            return ("\"%s\""):format(a1)
        end), ", ")
    elseif a3.testNamePattern ~= nil then
        v2 = (chalk.dim(" with tests matching ")) .. ("\"%s\""):format(a3.testNamePattern)
    end
    local v3 = if not (1 < a2.size) then "" else (chalk.dim(" in ")) .. (tostring(a2.size)) .. chalk.dim(" projects")
    return (chalk.dim("Ran all test suites")) .. v1 .. v2 .. v3 .. chalk.dim(".")
end

v2.default = u117
return v2