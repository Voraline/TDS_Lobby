-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_expect@3.10.0.expect
-- Decompile time: 10.39 ms

local assertions, hasAssertions
local v1 = require(script.Parent:WaitForChild("luau-polyfill"))
local Boolean = v1.Boolean
local Error = v1.Error
local Object = v1.Object
local promise = require(script.Parent:WaitForChild("promise"))
local u26 = require(script.Parent:WaitForChild("jest-matcher-utils"))
local asymmetricMatchers = require(script:WaitForChild("asymmetricMatchers"))
local any = asymmetricMatchers.any
local anything = asymmetricMatchers.anything
local arrayContaining = asymmetricMatchers.arrayContaining
local arrayNotContaining = asymmetricMatchers.arrayNotContaining
local closeTo = asymmetricMatchers.closeTo
local notCloseTo = asymmetricMatchers.notCloseTo
local nothing = asymmetricMatchers.nothing
local objectContaining = asymmetricMatchers.objectContaining
local objectNotContaining = asymmetricMatchers.objectNotContaining
local stringContaining = asymmetricMatchers.stringContaining
local stringMatching = asymmetricMatchers.stringMatching
local stringNotContaining = asymmetricMatchers.stringNotContaining
local stringNotMatching = asymmetricMatchers.stringNotMatching
local default = (require((script:WaitForChild("extractExpectedAssertionsErrors")))).default
local equals = (require((script:WaitForChild("jasmineUtils")))).equals
local jestMatchersObject = require(script:WaitForChild("jestMatchersObject"))
local getMatchers = jestMatchersObject.getMatchers
local getState = jestMatchersObject.getState
local setMatchers = jestMatchersObject.setMatchers
local setState = jestMatchersObject.setState
local matchers = require(script:WaitForChild("matchers"))
local spyMatchers = require(script:WaitForChild("spyMatchers"))
local toThrowMatchers = require(script:WaitForChild("toThrowMatchers"))
local matchers_2 = toThrowMatchers.matchers
local createMatcher = toThrowMatchers.createMatcher
require(script:WaitForChild("types"))
local utils = require(script:WaitForChild("utils"))
local iterableEquality = utils.iterableEquality
local subsetEquality = utils.subsetEquality
local makeThrowingMatcher = nil
local _validateResult = nil
local v2 = {__index = Error}
local u118 = setmetatable({}, v2)
u118.__index = u118

function u118.new(a1) -- Line: 95 -- upvalues: Error (val), u118 (val) -- types: a1: string?
    return (setmetatable(Error.new(a1), u118))
end

local function isPromise(a1) -- Line: 100 -- upvalues: Boolean (val)
    local v1 = not not Boolean.toJSBoolean(a1)
    if v1 then
        if typeof(a1) == "table" then
            v1 = typeof(a1.andThen) == "function"
        else
            v1 = false
            if typeof(a1) == "function" then
                v1 = typeof(a1.andThen) == "function"
            end
        end
    end
    return v1
end

local function createToThrowErrorMatchingSnapshotMatcher(a1) -- Line: 108
    return function(a1_2, a2, a3) -- Line: 109 -- upvalues: a1 (val) -- types: a3: string?
        return a1(a1_2, table.unpack({a2, a3, true}))
    end
end

local function getPromiseMatcher(a1, a2) -- Line: 114 -- upvalues: createMatcher (val) -- types: a1: string
    if a1 ~= "toThrow" and a1 ~= "toThrowError" then
        if a1 ~= "toThrowErrorMatchingSnapshot" and a1 ~= "toThrowErrorMatchingInlineSnapshot" then
            return nil
        end
        return function(a1, a2_2, a3) -- Line: 109 -- upvalues: a2 (val) -- types: a3: string?
            return a2(a1, table.unpack({a2_2, a3, true}))
        end
    end
    return createMatcher(a1, true)
end

local makeResolveMatcher = nil
local makeRejectMatcher = nil

local function getMessage(a1) -- Line: 157 -- upvalues: u26 (val) -- types: a1: function?
    if a1 then
        return (a1())
    end
    return (u26.RECEIVED_COLOR("No message was specified for this matcher."))
end

function makeResolveMatcher(a1, a2, a3, a4, a5) -- Line: 161
    -- upvalues: Boolean (val), u118 (val), u26 (val), makeThrowingMatcher (ref), promise (val)
    return function(...) -- Line: 168
        -- upvalues: a3 (val), a4 (val), Boolean (upval), u118 (upval), u26 (upval), a1 (val)
        -- upvalues: makeThrowingMatcher (upval), a2 (val), a5 (val), promise (upval)
        local u0 = {}
        u0[1] = ...
        local u2 = {promise = "resolves", isNot = a3}
        local v1 = a4
        local v2 = not not Boolean.toJSBoolean(v1)
        if v2 then
            if typeof(v1) == "table" then
                v2 = typeof(v1.andThen) == "function"
            else
                v2 = false
                if typeof(v1) == "function" then
                    v2 = typeof(v1.andThen) == "function"
                end
            end
        end
        if not v2 then
            error(u118.new(u26.matcherErrorMessage(
                u26.matcherHint(a1, nil, "", u2),
                ("%s value must be a promise"):format((tostring((u26.RECEIVED_COLOR("received"))))),
                u26.printWithType("Received", a4, u26.printReceived)
            )))
        end
        local u61 = u118.new()
        return a4:andThen(function(a1) -- Line: 183 -- upvalues: makeThrowingMatcher (upval), a2 (upval), a3 (upval), u61 (val), u0 (val)
            return makeThrowingMatcher(a2, a3, "resolves", a1, u61)(table.unpack(u0))
        end, function(a1_2) -- Line: 185 -- upvalues: a5 (upval), u26 (upval), a1 (upval), u2 (val), promise (upval)
            local v1 = a1
            a5.message = (tostring((u26.matcherHint(v1, nil, "", u2)))) .. "\n\n" .. "Received promise rejected instead of resolved\n" .. ("Rejected to value: %s"):format((u26.printReceived(a1_2)))
            return promise.reject(a5)
        end)
    end
end

function makeRejectMatcher(a1, a2, a3, a4, a5) -- Line: 195
    -- upvalues: Boolean (val), u118 (val), u26 (val), promise (val), makeThrowingMatcher (ref)
    return function(...) -- Line: 202
        -- upvalues: a3 (val), a4 (val), Boolean (upval), u118 (upval), u26 (upval), a1 (val), a5 (val), promise (upval)
        -- upvalues: makeThrowingMatcher (upval), a2 (val)
        local u0 = {}
        u0[1] = ...
        local u2 = {promise = "rejects", isNot = a3}
        local v1 = if typeof(a4) ~= "function" then a4 else a4()
        local v2 = not not Boolean.toJSBoolean(v1)
        if v2 then
            if typeof(v1) == "table" then
                v2 = typeof(v1.andThen) == "function"
            else
                v2 = false
                if typeof(v1) == "function" then
                    v2 = typeof(v1.andThen) == "function"
                end
            end
        end
        if not v2 then
            error(u118.new(u26.matcherErrorMessage(
                u26.matcherHint(a1, nil, "", u2),
                ("%s value must be a promise or a function returning a promise"):format((tostring((u26.RECEIVED_COLOR("received"))))),
                u26.printWithType("Received", a4, u26.printReceived)
            )))
        end
        local u68 = u118.new()
        return v1:andThen(function(a1_2) -- Line: 220 -- upvalues: a5 (upval), u26 (upval), a1 (upval), u2 (val), promise (upval)
            local v1 = a1
            a5.message = (tostring((u26.matcherHint(v1, nil, "", u2)))) .. "\n\n" .. "Received promise resolved instead of rejected\n" .. ("Resolved to value: %s"):format((u26.printReceived(a1_2)))
            return promise.reject(a5)
        end, function(a1) -- Line: 226 -- upvalues: makeThrowingMatcher (upval), a2 (upval), a3 (upval), u68 (val), u0 (val)
            return makeThrowingMatcher(a2, a3, "rejects", a1, u68)(table.unpack(u0))
        end)
    end
end

function makeThrowingMatcher(a1, a2, a3, a4, a5) -- Line: 234
    -- upvalues: Object (val), iterableEquality (val), subsetEquality (val), u26 (val), equals (val), getState (val)
    -- upvalues: _validateResult (ref), u118 (val), Error (val)
    local throwingMatcher

    function throwingMatcher(...) -- Line: 241
        -- upvalues: Object (upval), iterableEquality (upval), subsetEquality (upval), u26 (upval), equals (upval)
        -- upvalues: a5 (val), a2 (val), a3 (val), getState (upval), _validateResult (upval), u118 (upval)
        -- upvalues: Error (upval), throwingMatcher (val), a1 (val), a4 (val)
        local u0 = true
        local v1 = Object.assign({iterableEquality = iterableEquality, subsetEquality = subsetEquality}, u26)
        local u8 = {}

        function u8.dontThrow() -- Line: 256 -- upvalues: u0 (ref)
            u0 = false
        end

        u8.equals = equals
        u8.error = a5
        u8.isNot = a2
        u8.promise = a3
        u8.utils = v1
        Object.assign(u8, getState())

        local function processResult(a1, a2_2) -- Line: 267
            -- upvalues: _validateResult (upval), getState (upval), a2 (upval), u26 (upval), a5 (upval), u118 (upval)
            -- upvalues: Object (upval), u0 (ref)
            local message, v1, v2
            _validateResult(a1)
            getState().assertionCalls = getState().assertionCalls + 1
            if a1.pass and a2 then
                message = a1.message
                v1 = if not message then u26.RECEIVED_COLOR("No message was specified for this matcher.") else message()
                v2 = nil
                if a5 then
                    a5.message = v1
                elseif not a2_2 then
                    v2 = u118.new(v1)
                else
                    error("Currently async is not implemented")
                end
                v2.matcherResult = Object.assign({}, a1, {message = v1})
                if u0 then
                    error(v2)
                    return
                end
                table.insert((getState()).suppressedErrors, v2)
                return
            end
            if not a1.pass and not a2 then
                message = a1.message
                v1 = if not message then u26.RECEIVED_COLOR("No message was specified for this matcher.") else message()
                v2 = nil
                if a5 then
                    a5.message = v1
                elseif not a2_2 then
                    v2 = u118.new(v1)
                else
                    error("Currently async is not implemented")
                end
                v2.matcherResult = Object.assign({}, a1, {message = v1})
                if u0 then
                    error(v2)
                    return
                end
                table.insert((getState()).suppressedErrors, v2)
            end
        end

        local function handleError(a1) -- Line: 306 -- upvalues: Error (upval), throwingMatcher (upval)
            if Error.captureStackTrace and typeof(a1) == "table" then
                Error.captureStackTrace(a1, throwingMatcher)
            end
            error(a1)
        end

        local success, result = pcall(function(...) -- Line: 323 -- upvalues: a1 (upval), u8 (val), a4 (upval), processResult (val)
            processResult((a1(u8, a4, ...)))
        end, ...)
        if not success then
            if Error.captureStackTrace and typeof(result) == "table" then
                Error.captureStackTrace(result, throwingMatcher)
            end
            error(result)
        end
    end

    return throwingMatcher
end

function _validateResult(a1) -- Line: 339 -- upvalues: u26 (val)
    if typeof(a1) ~= "table"
        or typeof(a1.pass) ~= "boolean"
        or a1.message and typeof(a1.message) ~= "string" and typeof(a1.message) ~= "function" then
        error("Unexpected return from a matcher function.\n" .. "Matcher functions should " .. "return an object in the following format:\n" .. "  {message?: string | function, pass: boolean}\n" .. (u26.stringify(a1)) .. " was returned")
    end
end

local u131 = {}

function u131.extend(a1) -- Line: 363 -- upvalues: setMatchers (val), u131 (val)
    setMatchers(a1, false, u131)
end

u131.anything = anything
u131.any = any
u131.nothing = nothing
u131.never = {
    arrayContaining = arrayNotContaining,
    closeTo = notCloseTo,
    objectContaining = objectNotContaining,
    stringContaining = stringNotContaining,
    stringMatching = stringNotMatching,
}
u131.objectContaining = objectContaining
u131.arrayContaining = arrayContaining
u131.closeTo = closeTo
u131.stringContaining = stringContaining
u131.stringMatching = stringMatching

function assertions(a1) -- Line: 391 -- upvalues: Error (val), assertions (val), setState (val) -- types: a1: number
    local v1 = Error.new()
    if Error.captureStackTrace then
        Error.captureStackTrace(v1, assertions)
    end
    setState({expectedAssertionsNumber = a1, expectedAssertionsNumberError = v1})
end

function hasAssertions(...) -- Line: 398 -- upvalues: Error (val), hasAssertions (val), u26 (val), setState (val)
    local v1 = {...}
    local v2 = Error.new()
    if Error.captureStackTrace then
        Error.captureStackTrace(v2, hasAssertions)
    end
    u26.ensureNoExpected(v1[1], ".hasAssertions")
    setState({isExpectingAssertions = true, isExpectingAssertionsError = v2})
end

setMatchers(matchers, true, u131)
setMatchers(spyMatchers, true, u131)
setMatchers(matchers_2, true, u131)
u131.addSnapshotSerializer = require(script.Parent:WaitForChild("jest-snapshot")).plugins.addSerializer
u131.assertions = assertions
u131.hasAssertions = hasAssertions
u131.getState = getState
u131.setState = setState
u131.extractExpectedAssertionsErrors = default
local v3 = require(script.Parent:WaitForChild("jest-snapshot"))
setMatchers({
    toMatchSnapshot = v3.toMatchSnapshot,
    toThrowErrorMatchingSnapshot = v3.toThrowErrorMatchingSnapshot,
}, false, u131)
local v4 = {
    __call = function(a1, a2, ...) -- Line: 126
        -- upvalues: getMatchers (val), u118 (val), createMatcher (val), Boolean (val), makeThrowingMatcher (ref)
        -- upvalues: makeResolveMatcher (ref), makeRejectMatcher (ref)
        local v1, v2
        local v3 = {...}
        if #v3 ~= 0 then
            error("Expect takes at most one argument.")
        end
        local v4 = getMatchers()
        local v5 = {never = {}, rejects = {never = {}}, resolves = {never = {}}}
        local v6 = u118.new()
        local v7 = a2
        for k, v in pairs(v4) do
            v1 = if k == "toThrow" then createMatcher(k, true) else if k ~= "toThrowError" then if k == "toThrowErrorMatchingSnapshot" then function(a1, a2, a3) -- Line: 109 -- upvalues: v (val) -- types: a3: string?
                return v(a1, table.unpack({a2, a3, true}))
            end else if k ~= "toThrowErrorMatchingInlineSnapshot" then nil else function(a1, a2, a3) -- Line: 109 -- upvalues: v (val) -- types: a3: string?
                return v(a1, table.unpack({a2, a3, true}))
            end else createMatcher(k, true)
            v2 = Boolean.toJSBoolean(v1) and v1 or v
            v5[k] = (makeThrowingMatcher(v, false, "", v7))
            v5.never[k] = (makeThrowingMatcher(v, true, "", v7))
            v5.resolves[k] = (makeResolveMatcher(k, v2, false, v7, v6))
            v5.resolves.never[k] = (makeResolveMatcher(k, v2, true, v7, v6))
            v5.rejects[k] = (makeRejectMatcher(k, v2, false, v7, v6))
            v5.rejects.never[k] = (makeRejectMatcher(k, v2, true, v7, v6))
        end
        return v5
    end,
}
setmetatable(u131, v4)
return u131