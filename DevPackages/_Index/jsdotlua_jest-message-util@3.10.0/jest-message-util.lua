-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-message-util@3.10.0.jest-message-util
-- Decompile time: 5.94 ms

local v1 = require(script.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local Error = v1.Error
local String = v1.String
local u19 = require(script.Parent:WaitForChild("luau-regexp"))
local v2 = {}
local chalk = require(script.Parent:WaitForChild("chalk"))
require(script.Parent:WaitForChild("jest-types"))
local format = require(script.Parent:WaitForChild("pretty-format")).format
local v3 = require(script.Parent:WaitForChild("jest-roblox-shared"))
local normalizePromiseError = v3.normalizePromiseError
local cleanLoadStringStack = v3.cleanLoadStringStack
local formatStackTrace = nil
local separateMessageFromStack = nil
local u61 = chalk.bold("● ")
local dim = chalk.dim

function v2.indentAllLines(a1, a2) -- Line: 82 -- types: a1: string, a2: string?
    local v1 = string.split(a1, "\n")
    for i, j in v1 do
        v1[i] = (a2 or "") .. j
    end
    return table.concat(v1, "\n")
end

local function trim(a1) -- Line: 93 -- upvalues: String (val) -- types: a1: string
    return String.trim(a1 or "")
end

local function trimPaths(a1) -- Line: 101 -- upvalues: trim (val) -- types: a1: string
    if not a1:find("%s*at.*%(?:%d*:%d*%)?") and not a1:find("%s*at.*%(?native%)?") then
        return a1
    end
    return trim(a1)
end

local u66 = {}

function u66.test(a1, a2) -- Line: 112 -- types: a2: string
    return string.match(a2, "%S") == nil
end

local function checkForCommonEnvironmentErrors(a1) -- Line: 118
    return a1
end

function v2.formatExecError(a1, a2, a3, a4, a5) -- Line: 151
    -- upvalues: Boolean (val), Error (val), normalizePromiseError (val), format (val), separateMessageFromStack (ref)
    -- upvalues: String (val), formatStackTrace (ref), u66 (val), u61 (val)
    local message, stack_2
    if not Boolean.toJSBoolean(a1) or typeof(a1) == "number" then
        a1 = Error.new(("Expected an Error, but \"%s\" was thrown"):format((tostring(a1))))
        a1.stack = ""
    end
    if typeof(a1) == "string" or not Boolean.toJSBoolean(a1) then
        if not Boolean.toJSBoolean(a1) then
            a1 = "EMPTY ERROR"
        end
        message = ""
        stack_2 = a1
    elseif a1 ~= nil then
        if a1.kind == "ExecutionError" then
            a1 = normalizePromiseError(a1)
        end
        message = a1.message
        stack_2 = if typeof(a1.stack) ~= "string" then ("thrown: %s"):format((format(a1, {maxDepth = 3}))) else a1.stack
    else
        if not Boolean.toJSBoolean(a1) then
            a1 = "EMPTY ERROR"
        end
        message = ""
        stack_2 = a1
    end
    local v1 = separateMessageFromStack(Boolean.toJSBoolean(stack_2) and stack_2 or "")
    local stack_3 = v1.stack
    if string.find(v1.message, String.trim(message or ""), 1, true) ~= nil then
        message = v1.message
    end
    local v2 = string.split(message, "\n")
    for i, j in v2 do
        v2[i] = "    " .. j
    end
    local v3 = table.concat(v2, "\n")
    local v4 = if not Boolean.toJSBoolean(stack_3) then "" else if a3.noStackTrace then "" else "\n" .. formatStackTrace(stack_3, a2, a3, a4)
    if typeof(v4) ~= "string" or u66:test(v3) and u66:test(v4) then
        v3 = ("thrown: %s"):format((tostring((format(a1, {maxDepth = 3})))))
    end
    return "  " .. u61 .. (if not a5 then ("%s\n\n%s"):format("Test suite failed to run", v3) else (" %s"):format((String.trim(v3)))) .. v4 .. "\n"
end

local function removeInternalStackEntries(a1, a2) -- Line: 223 -- upvalues: Array (val) -- types: a1: table, a2: table
    local u2 = 0
    return (Array.filter(a1, function(a1) -- Line: 226 -- upvalues: u2 (ref), a2 (val)
        if a1:find("^%s+at <anonymous>.*$") then
            return false
        end
        if not a1:find("^%s+at Promise %(<anonymous>%).*$")
            and not a1:find("^%s+at new Promise %(<anonymous>%).*$") then
            if a1:find("^%s+at Generator.next %(<anonymous>%).*$") or a1:find("^%s+at next %(native%).*$") then
                return false
            end
            if a1:find("%s*at.*%(?:%d*:%d*%)?") and a1:find("%s*at.*%(?native%)?") then
                if not a1:find("%s+at(.jasmine%-)") and not a1:find("%s+at(%s+jasmine%.buildExpectationResult)") then
                    u2 = u2 + 1
                    if u2 == 1 then
                        return true
                    end
                    if a2.noStackTrace then
                        return false
                    end
                    return true
                end
                return false
            end
            return true
        end
        return false
    end))
end

local function formatPaths(a1, a2, a3) -- Line: 276 -- upvalues: cleanLoadStringStack (val) -- types: a3: string
    return cleanLoadStringStack(a3)
end

local function getStackTraceLines(a1, a2) -- Line: 281
    -- upvalues: removeInternalStackEntries (val)
    if a2 == nil then
        a2 = {noCodeFrame = false, noStackTrace = false}
    end
    return removeInternalStackEntries(string.split(a1, "\n"), a2)
end

v2.getStackTraceLines = getStackTraceLines

function formatStackTrace(a1, a2, a3, a4) -- Line: 289
    -- upvalues: getStackTraceLines (ref), Array (val), Boolean (val), String (val), cleanLoadStringStack (val)
    local v1 = getStackTraceLines(a1, a3)
    local u9 = nil
    if a4 then
        u9 = "unsupported"
    end
    return (string.format("\n%s", (table.concat(Array.map(Array.filter(v1, Boolean.toJSBoolean), function(a1) -- Line: 298 -- upvalues: a2 (val), u9 (ref), String (upval), cleanLoadStringStack (upval)
        local v1 = if a1:find("%s*at.*%(?:%d*:%d*%)?") then String.trim(a1 or "") else if not a1:find("%s*at.*%(?native%)?") then a1 else String.trim(a1 or "")
        return "      " .. cleanLoadStringStack(v1)
    end), "\n"))))
end

v2.formatStackTrace = formatStackTrace

function v2.formatResultsErrors(a1, a2, a3, a4) -- Line: 313
    -- upvalues: Array (val), separateMessageFromStack (ref), dim (val), formatStackTrace (ref), chalk (val), u61 (val)
    local v1 = Array.reduce(a1, function(a1, a2) -- Line: 319 -- upvalues: Array (upval)
        Array.forEach(a2.failureMessages, function(a1_2) -- Line: 320 -- upvalues: a1 (val), a2 (val)
            table.insert(a1, {content = a1_2, result = a2})
        end)
        return a1
    end, {})
    if not (#v1 > 0) then
        return nil
    end
    return Array.join(Array.map(v1, function(a1) -- Line: 331
        -- upvalues: separateMessageFromStack (upval), a3 (val), dim (upval), formatStackTrace (upval), a2 (val)
        -- upvalues: a4 (val), chalk (upval), u61 (upval), Array (upval)
        local result = a1.result
        local content = a1.content
        local v1 = separateMessageFromStack(content)
        local message = v1.message
        local stack = v1.stack
        local v2 = if not a3.noStackTrace then (dim(formatStackTrace(stack, a2, a3, a4))) .. "\n" else ""
        local v3 = string.split(message, "\n")
        for i, j in v3 do
            v3[i] = "    " .. j
        end
        local v4 = table.concat(v3, "\n")
        local bold = chalk.bold
        local red = chalk.red
        local v5 = Array.join(result.ancestorTitles, " › ")
        local v6 = if not (#result.ancestorTitles > 0) then "" else " › "
        return ((bold(red("  " .. u61 .. v5 .. v6 .. result.title))) .. "\n") .. "\n" .. v4 .. "\n" .. v2
    end), "\n")
end

local function removeBlankErrorLine(a1) -- Line: 357 -- upvalues: String (val), Array (val) -- types: a1: string
    return String.trimRight(table.concat(Array.filter(String.split(a1, "\n"), function(a1) -- Line: 359
        return not a1:find("^Error:?%s*$")
    end), "\n"))
end

function separateMessageFromStack(a1) -- Line: 369
    -- upvalues: u19 (val), removeBlankErrorLine (val)
    if not a1 then
        return {message = "", stack = ""}
    end
    local v1 = u19("^(?:Error: )?([\\s\\S]*?(?=\\n\\s*.*:\\d*)|\\s*.*)([\\s\\S]*)$"):exec(a1)
    if not v1 then
        error("If you hit this error, the regex above is buggy.")
    end
    return {message = removeBlankErrorLine(v1[2]), stack = removeBlankErrorLine(v1[3])}
end

v2.separateMessageFromStack = separateMessageFromStack
return v2