-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-test-result@3.10.0.jest-test-result.formatTestResults
-- Decompile time: 3.16 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local Object = v1.Object
require(script.Parent:WaitForChild("types"))
local formatTestAssertion = nil

local function formatTestResult(a1, a2, a3) -- Line: 26
    -- upvalues: Array (val), formatTestAssertion (ref), Boolean (val)
    local v1
    local v2 = Array.map(a1.testResults, formatTestAssertion)
    if a1.testExecError ~= nil then
        local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
        v1 = {
            status = "failed",
            summary = "",
            assertionResults = v2,
            coverage = {},
            endTime = UnixTimestampMillis,
        }
        local failureMessage = if a1.failureMessage == nil then a1.testExecError.message else a1.failureMessage
        v1.message = failureMessage
        v1.name = a1.testFilePath
        v1.startTime = UnixTimestampMillis
        return v1
    end
    local v3 = a1.numFailingTests == 0
    v1 = {summary = "", assertionResults = v2}
    local coverage = if a2 == nil then a1.coverage else a2(a1.coverage, a3)
    v1.coverage = coverage
    v1.endTime = a1.perfStats["end"]
    v1.message = if a1.failureMessage == nil then "" else a1.failureMessage
    v1.name = a1.testFilePath
    v1.startTime = a1.perfStats.start
    v1.status = if not Boolean.toJSBoolean(v3) then "failed" else "passed"
    return v1
end

function formatTestAssertion(a1) -- Line: 63
    local v1 = {
        ancestorTitles = a1.ancestorTitles,
        duration = a1.duration,
        fullName = a1.fullName,
        location = a1.location,
        status = a1.status,
        title = a1.title,
    }
    if a1.failureMessages then
        v1.failureMessages = a1.failureMessages
    end
    return v1
end

return {
    default = function(a1, a2, a3) -- Line: 79 -- upvalues: Array (val), formatTestResult (val), Object (val)
        return Object.assign({}, a1, {
            testResults = Array.map(a1.testResults, function(a1) -- Line: 84 -- upvalues: formatTestResult (upval), a2 (val), a3 (val)
                return (formatTestResult(a1, a2, a3))
            end),
        })
    end,
}