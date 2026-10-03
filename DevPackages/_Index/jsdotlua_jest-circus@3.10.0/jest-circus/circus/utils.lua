-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-circus@3.10.0.jest-circus.circus.utils
-- Decompile time: 9.64 ms

local addErrorToEachTestUnderDescribe, describeBlockHasTests, hasEnabledTest
local v1 = require(script.Parent.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local Error = v1.Error
local promise = require(script.Parent.Parent.Parent:WaitForChild("promise"))
local makeTestResults = nil
local getTestID = nil
local _getError = nil
local getErrorStack = nil
local invariant = nil
local u37 = require(script.Parent.Parent.Parent:WaitForChild("luau-regexp"))

local function separateMessageFromStack(a1) -- Line: 32 -- upvalues: u37 (val) -- types: a1: string
    if not a1 then
        return {message = "", stack = ""}
    end
    local v1 = a1
    local v2 = ""
    local v3 = u37("^(\\s*.*:\\d+)?(: )?(.*)$"):exec(a1)
    if v3 then
        v1 = v3[4]
        v2 = v3[2]
    end
    return {message = v1, stack = v2}
end

local v2 = {}
local dedent = require(script.Parent.Parent.Parent:WaitForChild("jest-roblox-shared")).dedent
require(script.Parent.Parent.Parent:WaitForChild("jest-test-result"))
require(script.Parent.Parent.Parent:WaitForChild("jest-types"))
local v3 = require(script.Parent.Parent.Parent:WaitForChild("jest-util"))
local ErrorWithStack = v3.ErrorWithStack
local convertDescriptorToString = v3.convertDescriptorToString
local formatTime = v3.formatTime
local format = require(script.Parent.Parent.Parent:WaitForChild("pretty-format")).format
local state_ = require(script.Parent:WaitForChild("state_"))
local ROOT_DESCRIBE_BLOCK_NAME = state_.ROOT_DESCRIBE_BLOCK_NAME
local getState = state_.getState

local function takesDoneCallback(a1) -- Line: 106
    return 1 < (debug.info(a1, "a"))
end

local function isGeneratorFunction(a1) -- Line: 113
    return false
end

function v2.makeDescribe(a1, a2, a3) -- Line: 125 -- upvalues: Boolean (val), convertDescriptorToString (val)
    local mode = a3
    if a2 ~= nil and not Boolean.toJSBoolean(a3) then
        mode = a2.mode
    end
    return {
        type = "describeBlock",
        children = {},
        hooks = {},
        mode = mode,
        name = convertDescriptorToString(a1),
        parent = a2,
        tests = {},
    }
end

function v2.makeTest(a1, a2, a3, a4, a5, a6, a7) -- Line: 149
    -- upvalues: convertDescriptorToString (val)
    return {
        type = "test",
        invocations = 0,
        seenDone = false,
        asyncError = a6,
        errors = {},
        failing = a7,
        fn = a1,
        mode = a2,
        name = convertDescriptorToString(a3),
        parent = a4,
        retryReasons = {},
        timeout = a5,
    }
end

function hasEnabledTest(a1) -- Line: 182 -- upvalues: getState (val), Array (val), hasEnabledTest (val), getTestID (ref)
    local v1 = getState()
    local hasFocusedTests = v1.hasFocusedTests
    local testNamePattern = v1.testNamePattern
    return Array.some(a1.children, function(a1) -- Line: 185
        -- upvalues: hasEnabledTest (upval), hasFocusedTests (val), testNamePattern (val), getTestID (upval)
        if a1.type == "describeBlock" then
            return (hasEnabledTest(a1))
        end
        local v1 = true
        if a1.mode ~= "skip" then
            if not hasFocusedTests then
                v1 = testNamePattern and not testNamePattern:test((getTestID(a1)))
            else
                v1 = true
                if a1.mode == "only" then
                    v1 = testNamePattern and not testNamePattern:test((getTestID(a1)))
                end
            end
        end
        return not v1
    end)
end

function v2.getAllHooksForDescribe(a1) -- Line: 201
    -- upvalues: getState (val), Array (val), hasEnabledTest (val), getTestID (ref)
    local v1 = {afterAll = {}, beforeAll = {}}
    local v2 = getState()
    local hasFocusedTests = v2.hasFocusedTests
    local testNamePattern = v2.testNamePattern
    if Array.some(a1.children, function(a1) -- Line: 185
        -- upvalues: hasEnabledTest (upval), hasFocusedTests (val), testNamePattern (val), getTestID (upval)
        local v2, v3, v4, v5
        if a1.type ~= "describeBlock" then
            v2 = true
            if a1.mode ~= "skip" then
                if not hasFocusedTests then
                    v2 = testNamePattern
                    if v2 then
                        v3 = testNamePattern
                        v5 = getTestID
                        v5 = v5(a1)
                        v2 = not v3:test(v5)
                    end
                else
                    v2 = true
                    if a1.mode == "only" then
                        v2 = testNamePattern
                        if v2 then
                            v3 = testNamePattern
                            v5 = getTestID
                            v5 = v5(a1)
                            v2 = not v3:test(v5)
                        end
                    end
                end
            end
            return not v2
        else
            return (hasEnabledTest(a1))
        end
    end) then
        for i, v in ipairs(a1.hooks) do
            if v.type == "beforeAll" then
                table.insert(v1.beforeAll, v)
            elseif v.type == "afterAll" then
                table.insert(v1.afterAll, v)
            end
        end
    end
    return v1
end

function v2.getEachHooksForTest(a1) -- Line: 223 -- upvalues: Array (val), Boolean (val)
    local v1, v2
    local v3 = {afterEach = {}, beforeEach = {}}
    local parent = a1.parent
    repeat
        v1 = {}
        for i, v in ipairs(parent.hooks) do
            v2 = v
            if v2.type == "beforeEach" then
                table.insert(v1, v2)
            elseif v2.type == "afterEach" then
                table.insert(v3.afterEach, v2)
            end
        end
        v3.beforeEach = Array.concat({}, v1, v3.beforeEach)
        parent = parent.parent
    until not Boolean.toJSBoolean(parent)
    return v3
end

function describeBlockHasTests(a1) -- Line: 251 -- upvalues: Array (val), describeBlockHasTests (val)
    return Array.some(a1.children, function(a1) -- Line: 252 -- upvalues: describeBlockHasTests (upval)
        local v1 = true
        if a1.type ~= "test" then
            v1 = describeBlockHasTests(a1)
        end
        return v1
    end)
end

v2.describeBlockHasTests = describeBlockHasTests

local function _makeTimeoutMessage(a1, a2) -- Line: 258 -- upvalues: formatTime (val) -- types: a1: number, a2: boolean
    local v1 = if not a2 then "test" else "hook"
    return ("Exceeded timeout of %s for a %s.\nUse jest.setTimeout(newTimeout) to increase the timeout value, if this is a long-running test."):format(
        formatTime(a1),
        v1
    )
end

local setTimeout = v1.setTimeout
local clearTimeout = v1.clearTimeout

local function checkIsError(a1) -- Line: 270 -- upvalues: Boolean (val)
    return Boolean.toJSBoolean(a1) and Boolean.toJSBoolean(a1.message) and Boolean.toJSBoolean(a1.stack)
end

function v2.callAsyncCircusFn(a1, a2, a3) -- Line: 278
    -- upvalues: promise (val), setTimeout (val), _makeTimeoutMessage (val), ErrorWithStack (val), Boolean (val)
    -- upvalues: format (val), dedent (val), clearTimeout (val), separateMessageFromStack (val), Error (val)
    local isHook = a3.isHook
    local timeout = a3.timeout
    local u5 = nil
    local u6 = false
    local fn = a1.fn
    local asyncError = a1.asyncError
    return (((promise.new(function(a1_2, a2_2) -- Line: 289
        -- upvalues: u5 (ref), setTimeout (upval), _makeTimeoutMessage (upval), timeout (val), isHook (val), fn (val)
        -- upvalues: ErrorWithStack (upval), u6 (ref), a1 (val), Boolean (upval), format (upval), promise (upval)
        -- upvalues: asyncError (val), dedent (upval), a2 (val)
        u5 = setTimeout(function() -- Line: 290 -- upvalues: a2_2 (val), _makeTimeoutMessage (upval), timeout (upval), isHook (upval)
            return a2_2(_makeTimeoutMessage(timeout, isHook))
        end, timeout)
        if 1 < (debug.info(fn, "a")) then
            local done
            local u15 = nil

            function done(a1_3) -- Line: 299
                -- upvalues: ErrorWithStack (upval), done (val), u6 (upval), a1 (upval), Boolean (upval), format (upval)
                -- upvalues: a2_2 (val), promise (upval), u15 (ref), asyncError (upval), dedent (upval), a1_2 (val)
                local u5 = ErrorWithStack.new(nil, done)
                if u6 or not a1.seenDone then
                    a1.seenDone = true
                else
                    u5.message = "Expected done to be called once, but it was called multiple times."
                    if Boolean.toJSBoolean(a1_3) then
                        u5.message = u5.message .. " Reason: " .. format(a1_3, {maxDepth = 3})
                    end
                    a2_2(u5)
                    error(u5)
                end
                ;(promise.delay(0)):andThen(function() -- Line: 318
                    -- upvalues: u15 (upval), asyncError (upval), dedent (upval), format (upval), a2_2 (upval)
                    -- upvalues: a1_3 (val), Boolean (upval), u5 (val), u6 (upval), a1_2 (upval)
                    local v1
                    if u15 ~= nil then
                        asyncError.message = dedent(("\n      Test functions cannot both take a 'done' callback and return something. Either use a 'done' callback, or return a promise.\n      Returned value: %s\n      "):format((format(u15, {maxDepth = 3}))))
                        return a2_2(asyncError)
                    end
                    local v2 = a1_3
                    if not Boolean.toJSBoolean(v2)
                        or not Boolean.toJSBoolean(v2.message)
                        or not Boolean.toJSBoolean(v2.stack) then
                        v1 = u5
                        u5.message = ("Failed: %s"):format((format(a1_3, {maxDepth = 3})))
                    else
                        v1 = a1_3
                    end
                    if u6 and Boolean.toJSBoolean(a1_3) then
                        v1.message = "Caught error after test environment was torn down\n\n" .. v1.message
                        error(v1)
                    end
                    if Boolean.toJSBoolean(a1_3) then
                        return (a2_2(v1))
                    end
                    return (a1_2())
                end)
            end

            local v1 = fn(a2, done)
            return
        end
        local v2 = nil
        if false then
            error("Generator functions are not supported in Lua")
            if typeof(v2) == "table" and v2 ~= nil and typeof(v2.andThen) == "function" then
                v2:andThen(function() -- Line: 383 -- upvalues: a1_2 (val)
                    return a1_2()
                end, a2_2)
                return
            end
            if not isHook and v2 ~= nil then
                a2_2((dedent(("\ntest functions can only return Promise or undefined.\n      Returned value: %s\n      "):format((format(v2, {maxDepth = 3}))))))
                return
            end
            a1_2()
            return
        end
        local success, result = pcall(fn, a2)
        if not success then
            a2_2(result)
            return
        end
        if typeof(result) == "table" and v2 ~= nil and typeof(v2.andThen) == "function" then
            v2:andThen(function() -- Line: 383 -- upvalues: a1_2 (val)
                return a1_2()
            end, a2_2)
            return
        end
        if not isHook and v2 ~= nil then
            a2_2((dedent(("\ntest functions can only return Promise or undefined.\n      Returned value: %s\n      "):format((format(v2, {maxDepth = 3}))))))
            return
        end
        a1_2()
    end)):andThen(function() -- Line: 405 -- upvalues: u6 (ref), clearTimeout (upval), u5 (ref)
        u6 = true
        clearTimeout(u5)
    end)):catch(function(a1) -- Line: 413
        -- upvalues: u6 (ref), clearTimeout (upval), u5 (ref), separateMessageFromStack (upval), Error (upval)
        u6 = true
        clearTimeout(u5)
        if typeof(a1) == "string" then
            local v1 = separateMessageFromStack(a1)
            local v2 = Error.new(v1.message)
            v2.__stack = v1.stack
            Error.__recalculateStacktrace(v2)
            error(v2)
        end
        error(a1)
    end))
end

function v2.getTestDuration(a1) -- Line: 432
    local startedAt = a1.startedAt
    if typeof(startedAt) == "number" then
        return DateTime.now().UnixTimestampMillis - startedAt
    end
    return nil
end

function v2.makeRunResult(a1, a2) -- Line: 438
    -- upvalues: makeTestResults (ref), Array (val), _getError (ref), getErrorStack (ref)
    return {
        testResults = makeTestResults(a1),
        unhandledErrors = Array.map(Array.map(a2, _getError), getErrorStack),
    }
end

local function makeSingleTestResult(a1) -- Line: 446
    -- upvalues: getState (val), invariant (ref), Array (val), _getError (ref), getErrorStack (ref)
    local includeTestLocationInResult = getState().includeTestLocationInResult
    local v1 = {}
    local parent = a1
    local status = a1.status
    invariant(status, "Status should be present after tests are run.")
    repeat
        table.insert(v1, 1, parent.name)
        parent = parent.parent
    until parent == nil
    local v2 = Array.map(a1.errors, _getError)
    return {
        duration = a1.duration,
        errors = Array.map(v2, getErrorStack),
        errorsDetailed = v2,
        invocations = a1.invocations,
        retryReasons = Array.map(Array.map(a1.retryReasons, _getError), getErrorStack),
        status = status,
        testPath = Array.from(v1),
    }
end

v2.makeSingleTestResult = makeSingleTestResult

function makeTestResults(a1) -- Line: 505 -- upvalues: Array (val), makeTestResults (ref), makeSingleTestResult (val)
    local v1 = {}
    for i, v in ipairs(a1.children) do
        if v.type == "describeBlock" then
            v1 = Array.concat(v1, makeTestResults(v))
        elseif v.type == "test" then
            table.insert(v1, (makeSingleTestResult(v)))
        end
    end
    return v1
end

function getTestID(a1) -- Line: 521 -- upvalues: Array (val)
    local v1 = {}
    local parent = a1
    repeat
        table.insert(v1, 1, parent.name)
        parent = parent.parent
    until parent == nil
    table.remove(v1, 1)
    return Array.join(v1, " ")
end

v2.getTestID = getTestID

function _getError(a1) -- Line: 541 -- upvalues: Array (val), Error (val), Boolean (val), format (val)
    local v1, v2
    if not Array.isArray(a1) then
        v1 = a1
        v2 = Error.new()
    else
        v1 = a1[1]
        v2 = a1[2]
    end
    if v1 == nil then
        v2.message = ("thrown: %s"):format((format(v1, {maxDepth = 3})))
        return v2
    end
    if typeof(v1.stack) ~= "string" and not Boolean.toJSBoolean(v1.message) then
        v2.message = ("thrown: %s"):format((format(v1, {maxDepth = 3})))
        return v2
    end
    return v1
end

function getErrorStack(a1) -- Line: 565
    if typeof(a1.stack) ~= "string" then
        return a1.message
    end
    if string.find(a1.stack, a1.message, nil, true) then
        return a1.stack
    end
    return a1.message .. "\n" .. a1.stack
end

function addErrorToEachTestUnderDescribe(a1, a2, a3) -- Line: 581 -- upvalues: addErrorToEachTestUnderDescribe (val)
    for i, v in ipairs(a1.children) do
        if v.type == "describeBlock" then
            addErrorToEachTestUnderDescribe(v, a2, a3)
        elseif v.type == "test" then
            table.insert(v.errors, {a2, a3})
        end
    end
end

v2.addErrorToEachTestUnderDescribe = addErrorToEachTestUnderDescribe

function invariant(a1, a2) -- Line: 597 -- upvalues: Boolean (val), Error (val) -- types: a2: string?
    if not Boolean.toJSBoolean(a1) then
        error(Error.new(a2))
    end
end

v2.invariant = invariant

function v2.parseSingleTestResult(a1) -- Line: 607
    -- upvalues: Array (val), ROOT_DESCRIBE_BLOCK_NAME (val), Boolean (val)
    local v1 = if a1.status == "skip" then "pending" else if a1.status ~= "todo" then if not (#a1.errors > 0) then "passed" else "failed" else "todo"
    local v2 = Array.filter(a1.testPath, function(a1) -- Line: 619 -- upvalues: ROOT_DESCRIBE_BLOCK_NAME (upval)
        return a1 ~= ROOT_DESCRIBE_BLOCK_NAME
    end)
    local v3 = table.remove(v2)
    local v4 = {
        numPassingAsserts = 0,
        ancestorTitles = v2,
        duration = a1.duration,
        failureDetails = a1.errorsDetailed,
        failureMessages = Array.from(a1.errors),
    }
    local v5 = if not Boolean.toJSBoolean(v3) then Array.join(v2, " ") else Array.join(Array.concat(v2, v3), " ")
    v4.fullName = v5
    v4.invocations = a1.invocations
    v4.location = a1.location
    v4.retryReasons = Array.from(a1.retryReasons)
    v4.status = v1
    v4.title = a1.testPath[#a1.testPath]
    return v4
end

return v2