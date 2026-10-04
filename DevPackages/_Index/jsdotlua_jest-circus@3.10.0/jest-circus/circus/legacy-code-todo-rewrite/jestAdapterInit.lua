-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-circus@3.10.0.jest-circus.circus.legacy-code-todo-rewrite.jestAdapterInit
-- Decompile time: 15.30 ms

local v1 = require(script.Parent.Parent.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local Object = v1.Object
local promise = require(script.Parent.Parent.Parent.Parent:WaitForChild("promise"))
local v2 = {}
local default = (require((script.Parent.Parent.Parent.Parent:WaitForChild("throat")))).default
require(script.Parent.Parent.Parent.Parent:WaitForChild("jest-environment"))
local createEmptyTestResult = (require((script.Parent.Parent.Parent.Parent:WaitForChild("jest-test-result")))).createEmptyTestResult
require(script.Parent.Parent.Parent.Parent:WaitForChild("jest-types"))
local expect = require(script.Parent.Parent.Parent.Parent:WaitForChild("expect"))
local extractExpectedAssertionsErrors = expect.extractExpectedAssertionsErrors
local getState = expect.getState
local setState = expect.setState
local bind = require(script.Parent.Parent.Parent.Parent:WaitForChild("jest-each")).bind
local v3 = require(script.Parent.Parent.Parent.Parent:WaitForChild("jest-message-util"))
local formatExecError = v3.formatExecError
local formatResultsErrors = v3.formatResultsErrors
local v4 = require(script.Parent.Parent.Parent.Parent:WaitForChild("jest-snapshot"))
local SnapshotState = v4.SnapshotState
local addSerializer = v4.addSerializer
local buildSnapshotResolver = v4.buildSnapshotResolver
local default_2 = require(script.Parent.Parent).default
local default_3 = require(script.Parent.Parent:WaitForChild("run")).default
local state = require(script.Parent.Parent:WaitForChild("state"))
local ROOT_DESCRIBE_BLOCK_NAME = state.ROOT_DESCRIBE_BLOCK_NAME
local addEventHandler = state.addEventHandler
local dispatch = state.dispatch
local getState_2 = state.getState
local default_4 = require(script.Parent.Parent:WaitForChild("testCaseReportHandler")).default
local getTestID = require(script.Parent.Parent:WaitForChild("utils")).getTestID
local default_5 = (require((script.Parent:WaitForChild("jestExpect")))).default
local getRelativePath = (require((script.Parent.Parent.Parent.Parent:WaitForChild("jest-roblox-shared")))).getRelativePath
local handleSnapshotStateAfterRetry = nil
local eventHandler = nil
local _addExpectedAssertionErrors = nil
local _addSuppressedErrors = nil

function v2.initialize(a1) -- Line: 92
    -- upvalues: promise (val), getState_2 (val), default (val), Object (val), default_2 (val), bind (val)
    -- upvalues: addEventHandler (val), eventHandler (ref), default_5 (val), dispatch (val), Array (val)
    -- upvalues: addSerializer (val), buildSnapshotResolver (val), SnapshotState (val), setState (val)
    -- upvalues: handleSnapshotStateAfterRetry (ref), default_4 (val), getRelativePath (val)
    local config = a1.config
    local environment = a1.environment
    local globalConfig = a1.globalConfig
    local localRequire = a1.localRequire
    local parentProcess = a1.parentProcess
    local sendMessageToJest = a1.sendMessageToJest
    local setGlobalsForRuntime = a1.setGlobalsForRuntime
    local testPath = a1.testPath
    return (promise.resolve()):andThen(function() -- Line: 117
        -- upvalues: globalConfig (val), getState_2 (upval), default (upval), Object (upval), default_2 (upval)
        -- upvalues: bind (upval), addEventHandler (upval), eventHandler (upval), environment (val), default_5 (upval)
        -- upvalues: setGlobalsForRuntime (val), config (val), dispatch (upval), parentProcess (val), Array (upval)
        -- upvalues: addSerializer (upval), localRequire (val), buildSnapshotResolver (upval), testPath (val)
        -- upvalues: SnapshotState (upval), setState (upval), handleSnapshotStateAfterRetry (upval)
        -- upvalues: sendMessageToJest (val), default_4 (upval), getRelativePath (upval)
        if globalConfig.testTimeout ~= nil and 0 < globalConfig.testTimeout then
            getState_2().testTimeout = globalConfig.testTimeout
        end
        local u12 = default(globalConfig.maxConcurrency)
        local u33 = Object.assign({}, default_2, {
            fdescribe = default_2.describe.only,
            fit = default_2.it.only,
            xdescribe = default_2.describe.skip,
            xit = default_2.it.skip,
            xtest = default_2.it.skip,
        })
        local test_2 = u33.test
        local test = u33.test

        local function concurrent_(a1, a2, a3) -- Line: 137
            -- upvalues: u12 (val), u33 (val)
            local u5 = u12(function() -- Line: 144 -- upvalues: a2 (val)
                return a2()
            end)
            u5:catch(function() end)
            u33.test(a1, function() -- Line: 151 -- upvalues: u5 (val)
                return u5
            end, a3)
        end

        local v1 = {
            __call = function(a1, a2, a3, a4) -- Line: 156 -- upvalues: concurrent_ (val) -- types: a2: string, a4: number?
                concurrent_(a2, a3, a4)
            end,
        }
        local v2 = setmetatable({}, v1)

        local function only_(a1, a2, a3) -- Line: 161
            -- upvalues: u12 (val), test (val)
            local u5 = u12(function() -- Line: 162 -- upvalues: a2 (val)
                return a2()
            end)
            test.only(a1, function() -- Line: 166 -- upvalues: u5 (val)
                return u5
            end, a3)
        end

        local v3 = {
            __call = function(a1, a2, a3, a4) -- Line: 171 -- upvalues: only_ (val) -- types: a2: string, a4: number?
                return only_(a2, a3, a4)
            end,
        }
        local v4 = setmetatable({}, v3)
        v2.only = v4
        v2.skip = test.skip
        v2.each = bind(test, false)
        v2.skip.each = bind(test.skip, false)
        v4.each = bind(test.only, false)
        test_2.concurrent = v2
        addEventHandler(eventHandler)
        if environment.handleTestEvent ~= nil then
            local handleTestEvent = environment.handleTestEvent
            addEventHandler(function(...) -- Line: 190 -- upvalues: handleTestEvent (val), environment (upval)
                return handleTestEvent(environment, ...)
            end)
        end
        local v5 = Object.assign({}, u33, {expect = default_5(globalConfig)})
        v5.expectExtended = v5.expect
        setGlobalsForRuntime(v5)
        if config.injectGlobals then
            Object.assign(environment.global, v5)
        end
        dispatch({
            name = "setup",
            parentProcess = parentProcess,
            runtimeGlobals = v5,
            testNamePattern = globalConfig.testNamePattern,
        }):expect()
        if config.testLocationInResults then
            dispatch({name = "include_test_location_in_result"}):expect()
        end
        Array.forEach(Array.reverse(Array.concat(config.snapshotSerializers)), function(a1) -- Line: 216 -- upvalues: addSerializer (upval), localRequire (upval)
            return addSerializer(localRequire(a1))
        end)
        local expand = globalConfig.expand
        local updateSnapshot = globalConfig.updateSnapshot
        local v6 = (buildSnapshotResolver(config, localRequire):expect()):resolveSnapshotPath(testPath)
        v4 = SnapshotState.new(v6, {
            expand = expand,
            snapshotFormat = config.snapshotFormat,
            updateSnapshot = updateSnapshot,
        })
        setState({snapshotState = v4, testPath = testPath})
        addEventHandler(handleSnapshotStateAfterRetry(v4))
        if sendMessageToJest ~= nil then
            addEventHandler(default_4(getRelativePath(testPath), sendMessageToJest))
        end
        return {globals = u33, snapshotState = v4}
    end)
end

function v2.runAndTransformResultsToJestFormat(a1) -- Line: 263
    -- upvalues: promise (val), default_3 (val), Array (val), ROOT_DESCRIBE_BLOCK_NAME (val), Boolean (val)
    -- upvalues: formatResultsErrors (val), formatExecError (val), dispatch (val), Object (val)
    -- upvalues: createEmptyTestResult (val)
    local config = a1.config
    local globalConfig = a1.globalConfig
    local testPath = a1.testPath
    return (promise.resolve()):andThen(function() -- Line: 270
        -- upvalues: promise (upval), default_3 (upval), Array (upval), ROOT_DESCRIBE_BLOCK_NAME (upval)
        -- upvalues: Boolean (upval), formatResultsErrors (upval), config (val), globalConfig (val), testPath (val)
        -- upvalues: formatExecError (upval), dispatch (upval), Object (upval), createEmptyTestResult (upval)
        local v1 = promise.resolve(default_3()):expect()
        local u8 = 0
        local u9 = 0
        local u10 = 0
        local u11 = 0
        local v2 = Array.map(v1.testResults, function(a1) -- Line: 278
            -- upvalues: u10 (ref), u11 (ref), u8 (ref), u9 (ref), Array (upval), ROOT_DESCRIBE_BLOCK_NAME (upval)
            -- upvalues: Boolean (upval)
            local v1
            if a1.status == "skip" then
                v1 = "pending"
                u10 = u10 + 1
            elseif a1.status == "todo" then
                v1 = "todo"
                u11 = u11 + 1
            elseif #a1.errors == 0 then
                v1 = "passed"
                u9 = u9 + 1
            else
                v1 = "failed"
                u8 = u8 + 1
            end
            local v2 = Array.filter(a1.testPath, function(a1) -- Line: 294 -- upvalues: ROOT_DESCRIBE_BLOCK_NAME (upval)
                return a1 ~= ROOT_DESCRIBE_BLOCK_NAME
            end)
            local v3 = table.remove(v2)
            local v4 = {
                numPassingAsserts = 0,
                ancestorTitles = v2,
                duration = a1.duration,
                failureDetails = a1.errorsDetailed,
                failureMessages = a1.errors,
            }
            local v5 = if not Boolean.toJSBoolean(v3) then Array.join(v2, " ") else Array.join(Array.concat(v2, v3), " ")
            v4.fullName = v5
            v4.invocations = a1.invocations
            v4.location = a1.location
            v4.retryReasons = a1.retryReasons
            v4.status = v1
            v4.title = a1.testPath[#a1.testPath]
            return v4
        end)
        local v3 = formatResultsErrors(v2, config, globalConfig, testPath)
        local v4 = nil
        if #v1.unhandledErrors ~= 0 then
            v4 = {message = "", stack = Array.join(v1.unhandledErrors, "\n")}
            v3 = (Boolean.toJSBoolean(v3) and v3 or "") .. "\n\n" .. Array.join(Array.map(v1.unhandledErrors, function(a1) -- Line: 333 -- upvalues: formatExecError (upval), config (upval), globalConfig (upval)
                return formatExecError(a1, config, globalConfig)
            end), "\n")
        end
        dispatch({name = "teardown"}):expect()
        return (Object.assign({}, createEmptyTestResult(), {
            console = Object.None,
            displayName = config.displayName,
            failureMessage = v3,
            numFailingTests = u8,
            numPassingTests = u9,
            numPendingTests = u10,
            numTodoTests = u11,
            testExecError = v4,
            testFilePath = testPath,
            testResults = v2,
        }))
    end)
end

function handleSnapshotStateAfterRetry(a1) -- Line: 363
    return function(a1_2, a2) -- Line: 364 -- upvalues: a1 (val)
        if a2.name == "test_retry" then
            a1:clear()
        end
    end
end

function eventHandler(a1, a2) -- Line: 372
    -- upvalues: promise (val), setState (val), getTestID (val), _addSuppressedErrors (ref)
    -- upvalues: _addExpectedAssertionErrors (ref)
    return (promise.resolve()):andThen(function() -- Line: 373
        -- upvalues: a2 (val), setState (upval), getTestID (upval), _addSuppressedErrors (upval)
        -- upvalues: _addExpectedAssertionErrors (upval)
        if a2.name == "test_start" then
            setState({currentTestName = getTestID(a2.test)})
            return
        end
        if a2.name ~= "test_done" then
            return
        end
        _addSuppressedErrors(a2.test)
        _addExpectedAssertionErrors(a2.test)
    end)
end

function _addExpectedAssertionErrors(a1) -- Line: 387 -- upvalues: extractExpectedAssertionsErrors (val), Array (val)
    a1.errors = Array.concat(a1.errors, (Array.map(extractExpectedAssertionsErrors(), function(a1) -- Line: 389
        return a1.error
    end)))
end

function _addSuppressedErrors(a1) -- Line: 398 -- upvalues: getState (val), setState (val), Array (val)
    local suppressedErrors = getState().suppressedErrors
    setState({suppressedErrors = {}})
    if #suppressedErrors ~= 0 then
        a1.errors = Array.concat(a1.errors, suppressedErrors)
    end
end

return v2