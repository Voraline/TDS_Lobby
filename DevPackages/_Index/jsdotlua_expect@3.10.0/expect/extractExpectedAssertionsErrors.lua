-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_expect@3.10.0.expect.extractExpectedAssertionsErrors
-- Decompile time: 4.46 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Boolean = v1.Boolean
local Error = v1.Error
local Object = v1.Object
local v2 = {}
local v3 = require(script.Parent.Parent:WaitForChild("jest-matcher-utils"))
local EXPECTED_COLOR = v3.EXPECTED_COLOR
local RECEIVED_COLOR = v3.RECEIVED_COLOR
local matcherHint = v3.matcherHint
local pluralize = v3.pluralize
local jestMatchersObject = require(script.Parent:WaitForChild("jestMatchersObject"))
local getState = jestMatchersObject.getState
local setState = jestMatchersObject.setState
require(script.Parent:WaitForChild("types"))

local function resetAssertionsLocalState() -- Line: 25 -- upvalues: setState (val), Object (val)
    setState({assertionCalls = 0, isExpectingAssertions = false, expectedAssertionsNumber = Object.None})
end

function v2.default() -- Line: 33
    -- upvalues: getState (val), setState (val), Object (val), EXPECTED_COLOR (val), pluralize (val), matcherHint (val)
    -- upvalues: RECEIVED_COLOR (val), Boolean (val), Error (val)
    local v1 = {}
    local v2 = getState()
    local assertionCalls = v2.assertionCalls
    local expectedAssertionsNumber = v2.expectedAssertionsNumber
    local expectedAssertionsNumberError = v2.expectedAssertionsNumberError
    local isExpectingAssertions = v2.isExpectingAssertions
    local isExpectingAssertionsError = v2.isExpectingAssertionsError
    v2 = setState
    local v3 = {assertionCalls = 0, isExpectingAssertions = false, expectedAssertionsNumber = Object.None}
    v2(v3)
    if typeof(expectedAssertionsNumber) == "number" and assertionCalls ~= expectedAssertionsNumber then
        v2 = EXPECTED_COLOR((pluralize("assertion", expectedAssertionsNumber)))
        local v4 = matcherHint(".assertions", "", tostring(expectedAssertionsNumber), {isDirectExpectCall = true})
        local v5 = ("Expected %s to be called but received "):format((tostring(v2)))
        expectedAssertionsNumberError.message = v4 .. "\n\n" .. v5 .. (tostring((RECEIVED_COLOR((pluralize("assertion call", Boolean.toJSBoolean(assertionCalls) and assertionCalls or 0)))))) .. "."
        if typeof(Error.__recalculateStacktrace) == "function" then
            Error.__recalculateStacktrace(expectedAssertionsNumberError)
        end
        table.insert(v1, {
            actual = tostring(assertionCalls),
            error = expectedAssertionsNumberError,
            expected = tostring(expectedAssertionsNumber),
        })
    end
    if isExpectingAssertions and assertionCalls == 0 then
        v2 = EXPECTED_COLOR("at least one assertion")
        v3 = RECEIVED_COLOR("received none")
        isExpectingAssertionsError.message = (tostring((matcherHint(".hasAssertions", "", "", {isDirectExpectCall = true})))) .. "\n\n" .. ("Expected %s to be called but %s."):format(tostring(v2), (tostring(v3)))
        if typeof(Error.__recalculateStacktrace) == "function" then
            Error.__recalculateStacktrace(isExpectingAssertionsError)
        end
        table.insert(v1, {actual = "none", expected = "at least one", error = isExpectingAssertionsError})
    end
    return v1
end

return v2