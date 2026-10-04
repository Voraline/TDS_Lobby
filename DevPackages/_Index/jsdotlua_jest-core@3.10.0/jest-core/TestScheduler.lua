-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-core@3.10.0.jest-core.TestScheduler
-- Decompile time: 19.13 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local Error = v1.Error
local Object = v1.Object
local Set = v1.Set
local WeakMap = v1.WeakMap
local promise = require(script.Parent.Parent:WaitForChild("promise"))
local v2 = {}
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
local exit = require(script.Parent.Parent:WaitForChild("jest-roblox-shared")).nodeUtils.exit
local v3 = require(script.Parent.Parent:WaitForChild("jest-reporters"))
local DefaultReporter = v3.DefaultReporter
local SummaryReporter = v3.SummaryReporter
local VerboseReporter = v3.VerboseReporter
local v4 = require(script.Parent.Parent:WaitForChild("jest-test-result"))
local addResult = v4.addResult
local buildFailureTestResult = v4.buildFailureTestResult
local makeEmptyAggregatedTestResult = v4.makeEmptyAggregatedTestResult
require(script.Parent.Parent:WaitForChild("jest-types"))
local formatExecError = require(script.Parent.Parent:WaitForChild("jest-message-util")).formatExecError
require(script.Parent.Parent:WaitForChild("jest-runner"))
require(script.Parent.Parent:WaitForChild("jest-runtime"))
local default = (require((script.Parent:WaitForChild("ReporterDispatcher")))).default
require(script.Parent:WaitForChild("TestWatcher"))
local shouldRunInBand = require(script.Parent:WaitForChild("testSchedulerHelper")).shouldRunInBand
require(script.Parent:WaitForChild("types"))
local u140 = nil
local invariant = nil
local createAggregatedResults = nil
local getEstimatedTime = nil

function v2.createTestScheduler(a1, a2) -- Line: 93 -- upvalues: promise (val), u140 (ref)
    return (promise.resolve()):andThen(function() -- Line: 97 -- upvalues: u140 (upval), a1 (val), a2 (val)
        local v1 = u140.new(a1, a2)
        v1:_setupReporters():expect()
        return v1
    end)
end

u140 = {}
u140.__index = u140

function u140.new(a1, a2) -- Line: 162 -- upvalues: u140 (ref), default (val)
    local v1 = u140
    local v2 = setmetatable({}, v1)
    v2._context = a2
    v2._dispatcher = default.new()
    v2._globalConfig = a1
    return v2
end

function u140:addReporter(a2) -- Line: 170
    self._dispatcher:register(a2)
end

function u140.removeReporter(a1, a2) -- Line: 174 -- types: a1: table, a2: function
    a1._dispatcher:unregister(a2)
end

function u140.scheduleTests(a1, a2, a3) -- Line: 178
    -- upvalues: promise (val), Set (val), Array (val), createAggregatedResults (ref), getEstimatedTime (ref)
    -- upvalues: shouldRunInBand (val), Error (val), Boolean (val), chalk (val), addResult (val)
    -- upvalues: buildFailureTestResult (val), formatExecError (val), WeakMap (val), Object (val), invariant (ref)
    return (promise.resolve()):andThen(function() -- Line: 179
        -- upvalues: a1 (val), Set (upval), Array (upval), a2 (val), createAggregatedResults (upval)
        -- upvalues: getEstimatedTime (upval), shouldRunInBand (upval), promise (upval), a3 (val), Error (upval)
        -- upvalues: Boolean (upval), chalk (upval), addResult (upval), buildFailureTestResult (upval)
        -- upvalues: formatExecError (upval), WeakMap (upval), Object (upval), invariant (upval)
        local onFailure = nil

        local function u3(...) -- Line: 186 -- upvalues: a1 (upval)
            return a1._dispatcher:onTestFileStart(...)
        end

        local u4 = {}
        local u7 = Set.new()
        Array.forEach(a2, function(a1) -- Line: 191 -- upvalues: u7 (val), u4 (val)
            u7:add(a1.context)
            local v1 = a1.duration or 0
            if v1 > 0 then
                table.insert(u4, v1)
            end
        end)
        local u16 = createAggregatedResults(#a2)
        local v1 = math.ceil((getEstimatedTime(u4, a1._globalConfig.maxWorkers)) / 1000)
        local u31 = shouldRunInBand(a2, u4, a1._globalConfig)

        local function onResult(a1_2, a2) -- Line: 206
            -- upvalues: promise (upval), a3 (upval), onFailure (ref), Error (upval), Boolean (upval), chalk (upval)
            -- upvalues: addResult (upval), u16 (val), a1 (upval), u7 (val)
            return (promise.resolve()):andThen(function() -- Line: 207
                -- upvalues: a3 (upval), promise (upval), a2 (val), onFailure (upval), a1_2 (val), Error (upval)
                -- upvalues: Boolean (upval), chalk (upval), addResult (upval), u16 (upval), a1 (upval), u7 (upval)
                if a3:isInterrupted() then
                    return promise.resolve()
                end
                if #a2.testResults == 0 then
                    return onFailure(a1_2, {
                        message = "Your test suite must contain at least one test.",
                        stack = Error.new("Your test suite must contain at least one test.").stack,
                    })
                end
                if Boolean.toJSBoolean(a2.leaks) then
                    local v1 = (("%sYour test suite is leaking memory. Please ensure all references are cleaned.\n"):format((tostring((chalk.red:bold("EXPERIMENTAL FEATURE!\n")))))) .. "\nThere is a number of things that can leak memory:\n  - Async operations that have not finished (e.g. fs.readFile).\n  - Timers not properly mocked (e.g. setInterval, setTimeout).\n  - Keeping references to the global scope."
                    return onFailure(a1_2, {message = v1, stack = Error.new(v1).stack})
                end
                addResult(u16, a2)
                local v2 = u16
                a1._dispatcher:onTestFileResult(a1_2, a2, v2):expect()
                return a1:_bailIfNeeded(u7, u16, a3)
            end)
        end

        function onFailure(a1_2, a2) -- Line: 233
            -- upvalues: promise (upval), a3 (upval), buildFailureTestResult (upval), formatExecError (upval)
            -- upvalues: a1 (upval), addResult (upval), u16 (val)
            return (promise.resolve()):andThen(function() -- Line: 234
                -- upvalues: a3 (upval), buildFailureTestResult (upval), a1_2 (val), a2 (val), formatExecError (upval)
                -- upvalues: a1 (upval), addResult (upval), u16 (upval)
                if a3:isInterrupted() then
                    return
                end
                local v1 = buildFailureTestResult(a1_2.path, a2)
                v1.failureMessage = formatExecError(v1.testExecError, a1_2.context.config, a1._globalConfig, a1_2.path)
                addResult(u16, v1)
                local v2 = u16
                a1._dispatcher:onTestFileResult(a1_2, v1, v2):expect()
            end)
        end

        local function updateSnapshotState() -- Line: 251
            -- upvalues: promise (upval), Array (upval), u7 (val), u16 (val), a1 (upval)
            return (promise.resolve()):andThen(function() -- Line: 252 -- upvalues: promise (upval), Array (upval), u7 (upval), u16 (upval), a1 (upval)
                local v1 = promise.all(Array.map(Array.from(u7), function(a1) -- Line: 253 -- upvalues: promise (upval)
                    return (promise.resolve()):andThen(function() -- Line: 254 -- upvalues: a1 (val)
                        return {a1}
                    end)
                end)):expect()
                Array.forEach(v1, function(a1) -- Line: 264 -- upvalues: u16 (upval), Array (upval)
                    local v1 = {filesRemoved = 0, filesRemovedList = {}}
                    local snapshot = u16.snapshot
                    snapshot.filesRemoved = snapshot.filesRemoved + v1.filesRemoved
                    u16.snapshot.filesRemovedList = Array.concat(if u16.snapshot.filesRemovedList == nil then {} else u16.snapshot.filesRemovedList, v1.filesRemovedList)
                end)
                local v2 = a1._globalConfig.updateSnapshot == "all"
                u16.snapshot.didUpdate = v2
                local snapshot = u16.snapshot
                local v3 = not v2
                if v3 then
                    v3 = true
                    if not (0 < u16.snapshot.unchecked) then
                        v3 = true
                        if not (0 < u16.snapshot.unmatched) then
                            v3 = 0 < u16.snapshot.filesRemoved
                        end
                    end
                end
                snapshot.failure = v3
            end)
        end

        a1._dispatcher:onRunStart(u16, {estimatedTime = v1, showStatus = not Boolean.toJSBoolean(u31)}):expect()
        local u50 = {}
        local u53 = WeakMap.new()
        local v2 = Array.from(u7)
        local v3 = Array.map(v2, promise.promisify(function(a1_2) -- Line: 310 -- upvalues: Boolean (upval), u50 (val), a1 (upval), u53 (val)
            local config = a1_2.config
            if not Boolean.toJSBoolean(u50[config.runner]) then
                local v1 = (require((script.Parent.Parent:WaitForChild("jest-runner")))).default.new(a1._globalConfig, {
                    changedFiles = a1._context.changedFiles,
                    sourcesRelatedToTestsInChangedFiles = a1._context.sourcesRelatedToTestsInChangedFiles,
                })
                u50[config.runner] = v1
                u53:set(v1, a1_2)
            end
        end))
        promise.all(v3):expect()
        local u78 = a1:_partitionTests(u50, a2)
        if u78 ~= nil then
            local success, result = pcall(function() -- Line: 332
                -- upvalues: Object (upval), u50 (val), u53 (val), invariant (upval), u78 (val), u31 (val)
                -- upvalues: Boolean (upval), u3 (val), onResult (ref), onFailure (ref), a1 (upval), a3 (upval)
                local v1, v2, v3, v4
                for i, j in Object.keys(u50) do
                    v2 = u50[j]
                    local u19 = u53:get(v2)
                    invariant(u19)
                    v3 = u78[j]
                    v4 = {serial = u31 or Boolean.toJSBoolean(v2.isSerial)}
                    if not v2.__PRIVATE_UNSTABLE_API_supportsEventEmitters__ then
                        v2:runTests(v3, a3, u3, onResult, onFailure, v4):expect()
                    else
                        v1 = {
                            v2:on("test-file-start", function(a1) -- Line: 350 -- upvalues: u3 (upval)
                                return u3(a1[1])
                            end),
                            v2:on("test-file-success", function(a1) -- Line: 354 -- upvalues: onResult (upval)
                                local v1, v2 = table.unpack(a1, 1, 2)
                                return onResult(v1, v2)
                            end),
                            v2:on("test-file-failure", function(a1) -- Line: 358 -- upvalues: onFailure (upval)
                                local v1, v2 = table.unpack(a1, 1, 2)
                                return onFailure(v1, v2)
                            end),
                            (v2:on("test-case-result", function(a1_2) -- Line: 362 -- upvalues: u19 (val), a1 (upval)
                                local v1, v2 = table.unpack(a1_2, 1, 2)
                                local v3 = {context = u19, path = v1.Name, script = v1}
                                a1._dispatcher:onTestCaseResult(v3, v2)
                            end)),
                        }
                        v2:runTests(v3, a3, nil, nil, nil, v4):expect()
                        for k, n in v1 do
                            n()
                        end
                    end
                    v2:cleanup()
                end
            end)
            if not success and not a3:isInterrupted() then
                error(result)
            end
        end
        updateSnapshotState():expect()
        u16.wasInterrupted = a3:isInterrupted()
        a1._dispatcher:onRunComplete(u7, u16):expect()
        local v4 = false
        if u16.numFailedTests == 0 then
            v4 = u16.numRuntimeErrorTestSuites == 0
        end
        local v5 = not v4
        v4 = a1._dispatcher:hasErrors()
        u16.success = v5 or u16.snapshot.failure or v4
        return u16
    end)
end

function u140._partitionTests(a1, a2, a3) -- Line: 440
    -- upvalues: Object (val), Array (val), Boolean (val)
    if #Object.keys(a2) > 1 then
        return Array.reduce(a3, function(a1, a2) -- Line: 445 -- upvalues: Boolean (upval)
            local runner = a2.context.config.runner
            if not Boolean.toJSBoolean(a1[runner]) then
                a1[runner] = {}
            end
            table.insert(a1[runner], a2)
            return a1
        end, {})
    end
    if #a3 > 0 and a3[1] ~= nil then
        return Object.assign({}, {[a3[1].context.config.runner] = a3})
    end
    return nil
end

function u140._shouldAddDefaultReporters(a1, a2) -- Line: 463 -- upvalues: Boolean (val), Array (val)
    local v1 = true
    if a2 ~= nil then
        v1 = Boolean.toJSBoolean(Array.find(a2, function(a1_2) -- Line: 465 -- upvalues: a1 (val)
            return a1:_getReporterProps(a1_2).path == "default"
        end))
    end
    return v1
end

function u140._setupReporters(a1) -- Line: 470 -- upvalues: promise (val)
    return (promise.resolve()):andThen(function() -- Line: 471 -- upvalues: a1 (val)
        if a1:_shouldAddDefaultReporters(nil) then
            a1:_setupDefaultReporters(false)
        end
    end)
end

function u140:_setupDefaultReporters(a2) -- Line: 508
    -- upvalues: VerboseReporter (val), DefaultReporter (val), SummaryReporter (val)
    self:addReporter(if not self._globalConfig.verbose then DefaultReporter.new(self._globalConfig) else VerboseReporter.new(self._globalConfig))
    self:addReporter((SummaryReporter.new(self._globalConfig)))
end

function u140:_getReporterProps(a2) -- Line: 562 -- upvalues: Array (val), Error (val)
    if typeof(a2) == "string" then
        return {options = self._options, path = a2}
    end
    if Array.isArray(a2) then
        local v1 = a2[1]
        return {options = a2[2], path = v1}
    end
    error(Error.new("Reporter should be either a string or an array"))
end

function u140._bailIfNeeded(a1, a2, a3, a4) -- Line: 577 -- upvalues: promise (val), exit (val)
    return (promise.resolve()):andThen(function() -- Line: 582 -- upvalues: a1 (val), a3 (val), a4 (val), a2 (val), exit (upval)
        if a1._globalConfig.bail ~= 0 and a1._globalConfig.bail <= a3.numFailedTests then
            if a4:isWatchMode() then
                a4:setState({interrupted = true}):expect()
                return
            end
            local v1, v2 = a1._dispatcher:onRunComplete(a2, a3):await()
            local testFailureExitCode = a1._globalConfig.testFailureExitCode
            exit(testFailureExitCode)
            if not v1 then
                error(v2)
            end
        end
    end)
end

function invariant(a1, a2) -- Line: 600 -- upvalues: Boolean (val), Error (val) -- types: a2: string?
    if not Boolean.toJSBoolean(a1) then
        error(Error.new(a2))
    end
end

function createAggregatedResults(a1) -- Line: 609 -- upvalues: makeEmptyAggregatedTestResult (val) -- types: a1: number
    local v1 = makeEmptyAggregatedTestResult()
    v1.numTotalTestSuites = a1
    v1.startTime = DateTime.now().UnixTimestampMillis
    v1.success = false
    return v1
end

function getEstimatedTime(a1, a2) -- Line: 617 -- upvalues: Array (val) -- types: a2: number
    if #a1 == 0 then
        return 0
    end
    local v1 = math.max((table.unpack(a1)))
    if #a1 <= a2 then
        return v1
    end
    return (math.max(Array.reduce(a1, function(a1, a2) -- Line: 624 -- types: a1: number
        return a1 + a2
    end) / a2, v1))
end

return v2