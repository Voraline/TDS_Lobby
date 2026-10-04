-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-circus@3.10.0.jest-circus.circus.formatNodeAssertErrors
-- Decompile time: 12.77 ms

local v1 = require(script.Parent.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local instanceof = v1.instanceof
local v2 = require(script.Parent.Parent.Parent:WaitForChild("jest-roblox-shared"))
local escapePatternCharacters = v2.escapePatternCharacters
local normalizePromiseError = v2.normalizePromiseError
local Error = v1.Error
local cleanLoadStringStack = v2.cleanLoadStringStack
local v3 = {}
local AssertionError = v1.AssertionError
local chalk = require(script.Parent.Parent.Parent:WaitForChild("chalk"))
require(script.Parent.Parent.Parent:WaitForChild("jest-types"))
local v4 = require(script.Parent.Parent.Parent:WaitForChild("jest-matcher-utils"))
local diff = v4.diff
local printExpected = v4.printExpected
local printReceived = v4.printReceived
local format = (require((script.Parent.Parent.Parent:WaitForChild("pretty-format")))).format
local assertionErrorMessage = nil
local isAssertionError = nil
local buildHintString = nil
local u81 = {["!="] = "notEqual", ["!=="] = "notStrictEqual", ["=="] = "equal", ["==="] = "strictEqual"}
local u86 = {
    deepEqual = "to deeply equal",
    deepStrictEqual = "to deeply and strictly equal",
    equal = "to be equal",
    notDeepEqual = "not to deeply equal",
    notDeepStrictEqual = "not to deeply and strictly equal",
    notEqual = "to not be equal",
    notStrictEqual = "not be strictly equal",
    strictEqual = "to strictly be equal",
}

local function getOperatorName(a1, a2) -- Line: 105
    -- upvalues: Boolean (val), u81 (val)
    if typeof(a1) == "string" then
        if Boolean.toJSBoolean(u81[a1]) then
            return u81[a1]
        end
        return a1
    end
    if a2:match("%.doesNotThrow") ~= nil then
        return "doesNotThrow"
    end
    if a2:match("%.throws") ~= nil then
        return "throws"
    end
    if a2:match("%.fail") ~= nil then
        return "fail"
    end
    return ""
end

local function operatorMessage(a1) -- Line: 122
    -- upvalues: getOperatorName (ref), u86 (val), Boolean (val)
    local v1 = getOperatorName(a1, "")
    local v2 = u86[v1]
    if typeof(a1) == "string" then
        return (("%s to:\n"):format(if not Boolean.toJSBoolean(v2) then v1 else v2))
    end
    return ""
end

local function assertThrowingMatcherHint(a1) -- Line: 133 -- upvalues: Boolean (val), chalk (val) -- types: a1: string
    if Boolean.toJSBoolean(a1) then
        return (chalk.dim("assert")) .. (chalk.dim("." .. a1 .. "(")) .. (chalk.red("function")) .. chalk.dim(")")
    end
    return ""
end

local function assertMatcherHint(a1, a2, a3) -- Line: 139
    -- upvalues: chalk (val), Boolean (val)
    local v1 = ""
    if a1 == "==" and a3 == true then
        return (chalk.dim("assert")) .. (chalk.dim("(")) .. (chalk.red("received")) .. chalk.dim(")")
    end
    if Boolean.toJSBoolean(a2) then
        v1 = (chalk.dim("assert")) .. (chalk.dim("." .. a2 .. "(")) .. (chalk.red("received")) .. (chalk.dim(", ")) .. (chalk.green("expected")) .. chalk.dim(")")
    end
    return v1
end

function assertionErrorMessage(a1, a2) -- Line: 156
    -- upvalues: diff (val), Boolean (val), getOperatorName (ref), escapePatternCharacters (val), buildHintString (ref)
    -- upvalues: assertThrowingMatcherHint (ref), chalk (val), printReceived (val), assertMatcherHint (ref)
    -- upvalues: operatorMessage (ref), printExpected (val)
    local v1, v2, v3, v4
    local expected = a1.expected
    local actual = a1.actual
    local generatedMessage = a1.generatedMessage
    local message = a1.message
    local operator = a1.operator
    local stack = a1.stack
    local v5 = diff(expected, actual, a2)
    local v6 = not Boolean.toJSBoolean(generatedMessage)
    local v7 = getOperatorName(operator, stack)
    local v8 = ((stack:gsub(escapePatternCharacters(message), "", 1)):gsub("^AssertionError([^\n]*)", "")):gsub("^Error([^\n]*)", "")
    if v7 == "doesNotThrow" then
        v1 = buildHintString(assertThrowingMatcherHint(v7))
        v2 = chalk.reset("Expected the function not to throw an error.\n")
        v3 = chalk.reset("Instead, it threw:\n")
        v4 = ("  %s"):format((printReceived(actual)))
        local reset = chalk.reset
        return v1 .. v2 .. v3 .. v4 .. (reset(if not Boolean.toJSBoolean(v6) then "" else "\n\nMessage:\n  " .. tostring(message))) .. v8
    end
    if v7 == "throws" then
        v1 = buildHintString(assertThrowingMatcherHint(v7))
        v2 = chalk.reset("Expected the function to throw an error.\n")
        v3 = chalk.reset("But it didn't throw anything.")
        local reset_2 = chalk.reset
        return v1 .. v2 .. v3 .. (reset_2(if not v6 then "" else "\n\nMessage:\n  " .. message)) .. v8
    end
    if v7 == "fail" then
        v1 = buildHintString(assertMatcherHint(operator, v7, expected))
        local reset_3 = chalk.reset
        return v1 .. (reset_3(if not v6 then "" else "Message:\n  " .. tostring(message))) .. v8
    end
    v1 = buildHintString(assertMatcherHint(operator, v7, expected))
    v2 = chalk.reset(("Expected value %s"):format((operatorMessage(operator))))
    v3 = ("  %s\n"):format((printExpected(expected)))
    v4 = chalk.reset("Received:\n")
    local v9 = ("  %s"):format((printReceived(actual)))
    local v10 = chalk.reset(if not v6 then "" else "\n\nMessage:\n  " .. tostring(message))
    return v1 .. v2 .. v3 .. v4 .. v9 .. v10 .. (if not Boolean.toJSBoolean(v5) then "" else if v5 == nil then "" else ("\n\nDifference:\n\n%s"):format(v5)) .. v8
end

function isAssertionError(a1) -- Line: 206 -- upvalues: instanceof (val), AssertionError (val)
    local v1 = a1
    if v1 then
        v1 = instanceof(a1, AssertionError)
        if not v1 then
            v1 = true
            if a1.name ~= AssertionError.name then
                v1 = a1.code == "ERR_ASSERTION"
            end
        end
    end
    return v1
end

function buildHintString(a1) -- Line: 211 -- upvalues: Boolean (val) -- types: a1: string
    if Boolean.toJSBoolean(a1) then
        return (tostring(a1)) .. "\n\n"
    end
    return ""
end

function v3.default(a1, a2, a3) -- Line: 70
    -- upvalues: Array (val), normalizePromiseError (val), Boolean (val), format (val), Error (val)
    -- upvalues: isAssertionError (ref), assertionErrorMessage (ref)
    if a2.name == "test_done" then
        a2.test.errors = Array.map(a2.test.errors, function(a1) -- Line: 72
            -- upvalues: Array (upval), normalizePromiseError (upval), Boolean (upval), format (upval), Error (upval)
            -- upvalues: isAssertionError (upval), assertionErrorMessage (upval), a3 (val)
            local v1
            if not Array.isArray(a1) then
                v1 = a1
            else
                local v2, v3 = table.unpack(a1, 1, 2)
                if v2 == nil then
                    v1 = v3
                elseif v2.kind == "ExecutionError" then
                    v1 = normalizePromiseError(v2)
                elseif Boolean.toJSBoolean(v2.stack) then
                    v1 = v2
                else
                    v1 = v3
                    local message = if not Boolean.toJSBoolean(v2.message) then ("thrown: %s"):format((format(v2, {maxDepth = 3}))) else v2.message
                    v1.message = message
                    Error.__recalculateStacktrace(v1)
                end
            end
            if isAssertionError(v1) then
                return {message = assertionErrorMessage(v1, {expand = a3.expand})}
            end
            return a1
        end)
    end
end

return v3