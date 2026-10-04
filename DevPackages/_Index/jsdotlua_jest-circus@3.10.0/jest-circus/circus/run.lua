-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-circus@3.10.0.jest-circus.circus.run
-- Decompile time: 11.71 ms

local Boolean = require(script.Parent.Parent.Parent:WaitForChild("luau-polyfill")).Boolean
local promise = require(script.Parent.Parent.Parent:WaitForChild("promise"))
local v1 = {}
require(script.Parent.Parent.Parent:WaitForChild("jest-types"))
local state = require(script.Parent:WaitForChild("state"))
local dispatch = state.dispatch
local getState = state.getState
local RETRY_TIMES = require(script.Parent:WaitForChild("types")).RETRY_TIMES
local utils = require(script.Parent:WaitForChild("utils"))
local callAsyncCircusFn = utils.callAsyncCircusFn
local getAllHooksForDescribe = utils.getAllHooksForDescribe
local getEachHooksForTest = utils.getEachHooksForTest
local getTestID = utils.getTestID
local invariant = utils.invariant
local makeRunResult = utils.makeRunResult
local _runTestsForDescribeBlock = nil
local _runTest = nil
local _callCircusHook = nil
local _callCircusTest = nil

function _runTestsForDescribeBlock(a1) -- Line: 56
    -- upvalues: promise (val), dispatch (val), getAllHooksForDescribe (val), _callCircusHook (ref), RETRY_TIMES (val)
    -- upvalues: _runTestsForDescribeBlock (ref), _runTest (ref)
    return (promise.resolve()):andThen(function() -- Line: 57
        -- upvalues: dispatch (upval), a1 (val), getAllHooksForDescribe (upval), _callCircusHook (upval)
        -- upvalues: RETRY_TIMES (upval), _runTestsForDescribeBlock (upval), _runTest (upval)
        local v1, v2
        dispatch({name = "run_describe_start", describeBlock = a1}):expect()
        local v3 = getAllHooksForDescribe(a1)
        local beforeAll = v3.beforeAll
        local afterAll = v3.afterAll
        if not (a1.mode == "skip") then
            for i, v in ipairs(beforeAll) do
                _callCircusHook({describeBlock = a1, hook = v}):expect()
            end
        end
        local v4 = tonumber(_G[RETRY_TIMES], 10)
        local v5 = if v4 == nil then 0 else v4
        local v6 = {}
        for i2, i3 in ipairs(a1.children) do
            if i3.type == "describeBlock" then
                _runTestsForDescribeBlock(i3):expect()
            elseif i3.type == "test" then
                v1 = #i3.errors > 0
                _runTest(i3, v2):expect()
                if not v1 and v5 > 0 and #i3.errors > 0 then
                    table.insert(v6, i3)
                end
            end
        end
        for i4, j in ipairs(v6) do
            v1 = v5
            while v1 > 0 do
                if not (#j.errors > 0) then
                    break
                end
                dispatch({name = "test_retry", test = j}):expect()
                _runTest(j, v2):expect()
                v1 = v1 - 1
            end
        end
        if not v2 then
            for i5, k in ipairs(afterAll) do
                _callCircusHook({describeBlock = a1, hook = k}):expect()
            end
        end
        dispatch({name = "run_describe_finish", describeBlock = a1}):expect()
    end)
end

function _runTest(a1, a2) -- Line: 114
    -- upvalues: promise (val), dispatch (val), getState (val), getTestID (val), getEachHooksForTest (val)
    -- upvalues: _callCircusHook (ref), _callCircusTest (ref)
    return (promise.resolve()):andThen(function() -- Line: 115
        -- upvalues: dispatch (upval), a1 (val), getState (upval), a2 (val), getTestID (upval)
        -- upvalues: getEachHooksForTest (upval), _callCircusHook (upval), _callCircusTest (upval)
        dispatch({name = "test_start", test = a1}):expect()
        local v1 = {}
        local v2 = getState()
        local hasFocusedTests = v2.hasFocusedTests
        local testNamePattern = v2.testNamePattern
        local v3 = a2
        if not v3 then
            v3 = true
            if a1.mode ~= "skip" then
                if not hasFocusedTests then
                    v3 = testNamePattern and not testNamePattern:test((getTestID(a1)))
                else
                    v3 = true
                    if a1.mode == "only" then
                        v3 = testNamePattern and not testNamePattern:test((getTestID(a1)))
                    end
                end
            end
        end
        if v3 then
            dispatch({name = "test_skip", test = a1}):expect()
            return
        end
        if a1.mode == "todo" then
            dispatch({name = "test_todo", test = a1}):expect()
            return
        end
        local v4 = getEachHooksForTest(a1)
        local afterEach = v4.afterEach
        for i, v in ipairs(v4.beforeEach) do
            if #a1.errors > 0 then
                break
            end
            _callCircusHook({hook = v, test = a1, testContext = v1}):expect()
        end
        _callCircusTest(a1, v1):expect()
        for i2, i3 in ipairs(afterEach) do
            _callCircusHook({hook = i3, test = a1, testContext = v1}):expect()
        end
        dispatch({name = "test_done", test = a1}):expect()
    end)
end

function _callCircusHook(a1) -- Line: 165
    -- upvalues: promise (val), dispatch (val), Boolean (val), getState (val), callAsyncCircusFn (val)
    local hook = a1.hook
    local test = a1.test
    local describeBlock = a1.describeBlock
    local testContext = a1.testContext
    return (promise.resolve()):andThen(function() -- Line: 172
        -- upvalues: dispatch (upval), hook (val), Boolean (upval), getState (upval), callAsyncCircusFn (upval)
        -- upvalues: testContext (val), describeBlock (val), test (val)
        dispatch({name = "hook_start", hook = hook}):expect()
        local timeout = if not Boolean.toJSBoolean(hook.timeout) then getState().testTimeout else if hook.timeout == nil then getState().testTimeout else hook.timeout
        local success, result = pcall(function() -- Line: 178
            -- upvalues: callAsyncCircusFn (upval), hook (upval), testContext (upval), timeout (val), dispatch (upval)
            -- upvalues: describeBlock (upval), test (upval)
            callAsyncCircusFn(hook, testContext, {isHook = true, timeout = timeout}):expect()
            dispatch({name = "hook_success", describeBlock = describeBlock, hook = hook, test = test}):expect()
        end)
        if not success then
            dispatch({
                name = "hook_failure",
                describeBlock = describeBlock,
                error = result,
                hook = hook,
                test = test,
            }):expect()
        end
    end)
end

function _callCircusTest(a1, a2) -- Line: 199
    -- upvalues: promise (val), dispatch (val), Boolean (val), getState (val), invariant (val), callAsyncCircusFn (val)
    return (promise.resolve()):andThen(function() -- Line: 200
        -- upvalues: dispatch (upval), a1 (val), Boolean (upval), getState (upval), invariant (upval)
        -- upvalues: callAsyncCircusFn (upval), a2 (val)
        local timeout
        dispatch({name = "test_fn_start", test = a1}):expect()
        if not Boolean.toJSBoolean(a1.timeout) then
            timeout = getState().testTimeout
        else
            timeout = a1.timeout
            if not timeout then
                timeout = getState().testTimeout
            end
        end
        invariant(a1.fn, "Tests with no 'fn' should have 'mode' set to 'skipped'")
        if #a1.errors > 0 then
            return
        end
        local success, result = pcall(function() -- Line: 208 -- upvalues: callAsyncCircusFn (upval), a1 (upval), a2 (upval), timeout (val), dispatch (upval)
            callAsyncCircusFn(a1, a2, {isHook = false, timeout = timeout}):expect()
            if not a1.failing then
                dispatch({name = "test_fn_success", test = a1}):expect()
                return
            end
            a1.asyncError.message = "Failing test passed even though it was supposed to fail. Remove `.failing` to remove error."
            dispatch({name = "test_fn_failure", error = a1.asyncError, test = a1})
        end)
        if not success then
            if a1.failing then
                dispatch({name = "test_fn_success", test = a1})
                return
            end
            dispatch({name = "test_fn_failure", error = result, test = a1}):expect()
        end
    end)
end

function v1.default() -- Line: 42
    -- upvalues: promise (val), getState (val), dispatch (val), _runTestsForDescribeBlock (ref), makeRunResult (val)
    return (promise.resolve()):andThen(function() -- Line: 43
        -- upvalues: getState (upval), dispatch (upval), _runTestsForDescribeBlock (upval), makeRunResult (upval)
        local rootDescribeBlock = getState().rootDescribeBlock
        dispatch({name = "run_start"}):expect()
        _runTestsForDescribeBlock(rootDescribeBlock):expect()
        dispatch({name = "run_finish"}):expect()
        return makeRunResult(getState().rootDescribeBlock, getState().unhandledErrors)
    end)
end

return v1