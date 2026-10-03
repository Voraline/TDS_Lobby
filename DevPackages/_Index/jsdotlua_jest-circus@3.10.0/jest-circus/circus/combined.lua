-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-circus@3.10.0.jest-circus.circus.combined
-- Decompile time: 9.93 ms

local v1 = {}
require(script.Parent.Parent.Parent:WaitForChild("jest-types"))
local dispatchSync = nil
local v2 = require(script.Parent.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v2.Array
local Boolean = v2.Boolean
local Error = v2.Error
local u37 = require(script.Parent.Parent.Parent:WaitForChild("luau-regexp"))
local TEST_TIMEOUT_SYMBOL = require(script.Parent:WaitForChild("types")).TEST_TIMEOUT_SYMBOL
local utils = require(script.Parent:WaitForChild("utils"))
local addErrorToEachTestUnderDescribe = utils.addErrorToEachTestUnderDescribe
local describeBlockHasTests = utils.describeBlockHasTests
local getTestDuration = utils.getTestDuration
local invariant = utils.invariant
local makeDescribe = utils.makeDescribe
local makeTest = utils.makeTest

local function eventHandler(a1, a2, a3) -- Line: 60
    -- upvalues: Error (val), makeDescribe (val), invariant (val), Boolean (val), describeBlockHasTests (val)
    -- upvalues: Array (val), makeTest (val), addErrorToEachTestUnderDescribe (val), getTestDuration (val)
    -- upvalues: TEST_TIMEOUT_SYMBOL (val), u37 (val)
    if a2.name == "include_test_location_in_result" then
        a3.includeTestLocationInResult = true
        return
    end
    if a2.name == "hook_start" then
        a2.hook.seenDone = false
        return
    end
    if a2.name == "start_describe_definition" then
        local blockName = a2.blockName
        local mode = a2.mode
        local currentDescribeBlock_2 = a3.currentDescribeBlock
        local currentlyRunningTest = a3.currentlyRunningTest
        if currentlyRunningTest ~= nil then
            table.insert(currentlyRunningTest.errors, (Error.new((("Cannot nest a describe inside a test. Describe block \"%s\" cannot run because it is nested within \"%s\"."):format(
                blockName,
                currentlyRunningTest.name
            )))))
            return
        end
        local v1 = makeDescribe(blockName, currentDescribeBlock_2, mode)
        table.insert(currentDescribeBlock_2.children, v1)
        a3.currentDescribeBlock = v1
        return
    end
    if a2.name == "finish_describe_definition" then
        local currentDescribeBlock = a3.currentDescribeBlock
        invariant(currentDescribeBlock, "currentDescribeBlock must be there")
        if not Boolean.toJSBoolean(describeBlockHasTests(currentDescribeBlock)) then
            Array.forEach(currentDescribeBlock.hooks, function(a1) -- Line: 96 -- upvalues: a3 (val)
                a1.asyncError.message = ("Invalid: %s() may not be used in a describe block containing no tests."):format(a1.type)
                table.insert(a3.unhandledErrors, a1.asyncError)
            end)
        end
        local v2 = false
        if currentDescribeBlock.mode == "only" then
            v2 = Array.some(currentDescribeBlock.children, function(a1) -- Line: 108
                local v1 = false
                if a1.type == "test" then
                    v1 = a1.mode == "only"
                end
                return v1
            end)
        end
        if not v2 then
            Array.forEach(currentDescribeBlock.children, function(a1) -- Line: 113 -- upvalues: Boolean (upval), currentDescribeBlock (val)
                if a1.type == "test" and not Boolean.toJSBoolean(a1.mode) then
                    a1.mode = currentDescribeBlock.mode
                end
            end)
        end
        if not Boolean.toJSBoolean(a3.hasFocusedTests)
            and currentDescribeBlock.mode ~= "skip"
            and Array.some(currentDescribeBlock.children, function(a1) -- Line: 122
                local v1
                v1 = false
                if a1.type == "test" then
                    if a1.mode == "only" then
                        v1 = true
                    else
                        v1 = false
                    end
                end
                return v1
            end) then
            a3.hasFocusedTests = true
        end
        if currentDescribeBlock.parent == nil then
            return
        end
        a3.currentDescribeBlock = currentDescribeBlock.parent
        return
    end
    if a2.name == "add_hook" then
        local currentDescribeBlock_3 = a3.currentDescribeBlock
        local currentlyRunningTest_2 = a3.currentlyRunningTest
        local hasStarted = a3.hasStarted
        local asyncError = a2.asyncError
        local fn = a2.fn
        local hookType = a2.hookType
        local timeout = a2.timeout
        if currentlyRunningTest_2 ~= nil then
            table.insert(currentlyRunningTest_2.errors, (Error.new((("Hooks cannot be defined inside tests. Hook of type \"%s\" is nested within \"%s\"."):format(
                hookType,
                currentlyRunningTest_2.name
            )))))
            return
        end
        if Boolean.toJSBoolean(hasStarted) then
            table.insert(
                a3.unhandledErrors,
                (Error.new("Cannot add a hook after tests have started running. Hooks must be defined synchronously."))
            )
            return
        end
        table.insert(currentDescribeBlock_3.hooks, {
            seenDone = false,
            asyncError = asyncError,
            fn = fn,
            parent = currentDescribeBlock_3,
            timeout = timeout,
            type = hookType,
        })
        return
    end
    if a2.name == "add_test" then
        local currentDescribeBlock_4 = a3.currentDescribeBlock
        local currentlyRunningTest_3 = a3.currentlyRunningTest
        local hasStarted_2 = a3.hasStarted
        local asyncError_2 = a2.asyncError
        local fn_2 = a2.fn
        local mode_2 = a2.mode
        local testName = a2.testName
        local timeout_2 = a2.timeout
        local failing = a2.failing
        if currentlyRunningTest_3 ~= nil then
            table.insert(currentlyRunningTest_3.errors, (Error.new((("Tests cannot be nested. Test \"%s\" cannot run because it is nested within \"%s\"."):format(
                testName,
                currentlyRunningTest_3.name
            )))))
            return
        end
        if Boolean.toJSBoolean(hasStarted_2) then
            table.insert(
                a3.unhandledErrors,
                (Error.new("Cannot add a test after tests have started running. Tests must be defined synchronously."))
            )
            return
        end
        local v3 = makeTest(fn_2, mode_2, testName, currentDescribeBlock_4, timeout_2, asyncError_2, failing)
        if currentDescribeBlock_4.mode ~= "skip" and v3.mode == "only" then
            a3.hasFocusedTests = true
        end
        table.insert(currentDescribeBlock_4.children, v3)
        table.insert(currentDescribeBlock_4.tests, v3)
        return
    end
    if a2.name == "hook_failure" then
        local test = a2.test
        local describeBlock = a2.describeBlock
        local error = a2.error
        local hook = a2.hook
        local asyncError_3 = hook.asyncError
        local type = hook.type
        if type == "beforeAll" then
            invariant(describeBlock, "always present for `*All` hooks")
            addErrorToEachTestUnderDescribe(describeBlock, error, asyncError_3)
            return
        end
        if type == "afterAll" then
            table.insert(a3.unhandledErrors, {error, asyncError_3})
            return
        end
        invariant(test, "always present for `*Each` hooks")
        table.insert(test.errors, {error, asyncError_3})
        return
    end
    if a2.name == "test_skip" then
        a2.test.status = "skip"
        return
    end
    if a2.name == "test_todo" then
        a2.test.status = "todo"
        return
    end
    if a2.name == "test_done" then
        a2.test.duration = getTestDuration(a2.test)
        a2.test.status = "done"
        a3.currentlyRunningTest = nil
        return
    end
    if a2.name == "test_start" then
        a3.currentlyRunningTest = a2.test
        a2.test.startedAt = DateTime.now().UnixTimestampMillis
        local test_2 = a2.test
        test_2.invocations = test_2.invocations + 1
        return
    end
    if a2.name == "test_fn_start" then
        a2.test.seenDone = false
        return
    end
    if a2.name == "test_fn_failure" then
        table.insert(a2.test.errors, {a2.error, a2.test.asyncError})
        return
    end
    if a2.name == "test_retry" then
        a2.test.errors = {}
        return
    end
    if a2.name == "run_start" then
        a3.hasStarted = true
        if not Boolean.toJSBoolean(_G[TEST_TIMEOUT_SYMBOL]) then
            return
        end
        a3.testTimeout = _G[TEST_TIMEOUT_SYMBOL]
        return
    end
    if a2.name == "run_finish" then
        return
    end
    if a2.name == "setup" then
        if not Boolean.toJSBoolean(a2.testNamePattern) then
            return
        end
        a3.testNamePattern = u37(a2.testNamePattern, "i")
        return
    end
    if a2.name == "teardown" or a2.name ~= "error" then
        return
    end
    if a3.currentlyRunningTest ~= nil then
        table.insert(a3.currentlyRunningTest.errors, a2.error)
        return
    end
    table.insert(a3.unhandledErrors, a2.error)
end

v1.eventHandler = eventHandler
local Array_2 = (require((script.Parent.Parent.Parent:WaitForChild("luau-polyfill")))).Array
local u73 = {}

function u73.listeners(a1, ...) -- Line: 313
    return {}
end

local function uncaught(a1) -- Line: 326 -- upvalues: dispatchSync (ref)
    dispatchSync({name = "error", error = a1})
end

function v1.injectGlobalErrorHandlers(a1) -- Line: 330 -- upvalues: Array_2 (val), u73 (val), uncaught (ref)
    local v1 = Array_2.slice(u73:listeners("uncaughtException"))
    local v2 = Array_2.slice(u73:listeners("unhandledRejection"))
    a1:removeAllListeners("uncaughtException")
    a1:removeAllListeners("unhandledRejection")
    a1:on("uncaughtException", uncaught)
    a1:on("unhandledRejection", uncaught)
    return {uncaughtException = v1, unhandledRejection = v2}
end

function v1.restoreGlobalErrorHandlers(a1, a2) -- Line: 341 -- upvalues: uncaught (ref)
    a1:removeListener("uncaughtException", uncaught)
    a1:removeListener("unhandledRejection", uncaught)
    for i, v in ipairs(a2.uncaughtException) do
        a1:on("uncaughtException", v)
    end
    for i2, i3 in ipairs(a2.unhandledRejection) do
        a1:on("unhandledRejection", i3)
    end
end

require(script.Parent.Parent.Parent:WaitForChild("luau-polyfill"))
local promise = require(script.Parent.Parent.Parent:WaitForChild("promise"))
local default = require(script.Parent:WaitForChild("formatNodeAssertErrors")).default
local STATE_SYM = require(script.Parent:WaitForChild("types")).STATE_SYM
local makeDescribe_2 = require(script.Parent:WaitForChild("utils")).makeDescribe
local u126 = {eventHandler, default}
local state_ = require(script.Parent:WaitForChild("state_"))
local ROOT_DESCRIBE_BLOCK_NAME = state_.ROOT_DESCRIBE_BLOCK_NAME
v1.ROOT_DESCRIBE_BLOCK_NAME = ROOT_DESCRIBE_BLOCK_NAME

local function createState() -- Line: 386 -- upvalues: makeDescribe_2 (val), ROOT_DESCRIBE_BLOCK_NAME (val)
    local v1 = makeDescribe_2(ROOT_DESCRIBE_BLOCK_NAME)
    return {
        hasFocusedTests = false,
        hasStarted = false,
        includeTestLocationInResult = false,
        testTimeout = 5000,
        currentDescribeBlock = v1,
        rootDescribeBlock = v1,
        unhandledErrors = {},
    }
end

function v1.resetState() -- Line: 402 -- upvalues: STATE_SYM (val), createState (val)
    _G[STATE_SYM] = (createState())
end

_G[STATE_SYM] = (createState())
local getState = state_.getState
v1.getState = getState

function v1.setState(a1) -- Line: 411 -- upvalues: STATE_SYM (val)
    _G[STATE_SYM] = a1
    return _G[STATE_SYM]
end

function v1.dispatch(a1) -- Line: 416 -- upvalues: promise (val), u126 (val), getState (val)
    return (promise.resolve()):andThen(function() -- Line: 417 -- upvalues: u126 (upval), a1 (val), getState (upval)
        local v1
        for i, v in ipairs(u126) do
            v1 = v(nil, a1, getState())
            if v1 ~= nil then
                v1:expect()
            end
        end
    end)
end

function dispatchSync(a1) -- Line: 432 -- upvalues: u126 (val), getState (val)
    for i, v in ipairs(u126) do
        v(nil, a1, getState())
    end
end

v1.dispatchSync = dispatchSync

function v1.addEventHandler(a1) -- Line: 439 -- upvalues: u126 (val)
    table.insert(u126, a1)
end

return v1