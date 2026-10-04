-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-matcher-utils@3.10.0.jest-matcher-utils
-- Decompile time: 24.10 ms

local stringify
local v1 = require(script.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Error = v1.Error
local Number = v1.Number
local Symbol = v1.Symbol
local chalk = require(script.Parent:WaitForChild("chalk"))
local v2 = require(script.Parent:WaitForChild("jest-diff"))
local DIFF_DELETE = v2.DIFF_DELETE
local DIFF_EQUAL = v2.DIFF_EQUAL
local DIFF_INSERT = v2.DIFF_INSERT
local diff = v2.diff
local diffStringsRaw = v2.diffStringsRaw
local diffStringsUnified = v2.diffStringsUnified
local v3 = require(script.Parent:WaitForChild("jest-get-type"))
local getType = v3.getType
local isPrimitive = v3.isPrimitive
local v4 = require(script.Parent:WaitForChild("pretty-format"))
local format = v4.format
local Replaceable = require(script:WaitForChild("Replaceable"))
local deepCyclicCopyReplaceable = require(script:WaitForChild("deepCyclicCopyReplaceable"))
local plugins = v4.plugins
local u68 = {plugins.AsymmetricMatcher, plugins.RobloxInstance}
local green = chalk.green
local red = chalk.red
local inverse = chalk.inverse
local bold = chalk.bold
local dim = chalk.dim
local u78 = utf8.char(183)
local u79 = {
    "zero",
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight",
    "nine",
    "ten",
    "eleven",
    "twelve",
    "thirteen",
}
local replaceMatchedToAsymmetricMatcher = nil
local isAsymmetricMatcher = nil
local matcherErrorMessage = nil
local matcherHint = nil

function stringify(a1, a2, a3) -- Line: 96
    -- upvalues: Symbol (val), format (val), u68 (val), stringify (val)
    local v1
    if a1 == Symbol.for_("$$nil") then
        a1 = nil
    end
    local u10 = if a2 == nil then 10 else a2
    local u14 = if a3 == nil then 10 else a3
    local u30 = nil
    if not pcall(function() -- Line: 108 -- upvalues: u30 (ref), format (upval), a1 (ref), u10 (val), u14 (val), u68 (upval)
        local v0, v1, v2
        v0 = format
        v1 = a1
        v2 = {min = true}
        v2.maxDepth = u10
        v2.maxWidth = u14
        v2.plugins = u68
        u30 = v0(v1, v2)
        return
    end) then
        u30 = format(a1, {
            callToJSON = false,
            min = true,
            maxDepth = u10,
            maxWidth = u14,
            plugins = u68,
        })
    end
    if #u30 >= 10000 and u10 > 1 then
        v1 = stringify
        local v2 = math.floor(u10 / 2)
        v1 = v1(a1, v2, u14)
        return v1
    end
    if #u30 >= 10000 and u14 > 1 then
        v1 = stringify
        local v3 = math.floor(u14 / 2)
        v1 = v1(a1, u10, v3)
        return v1
    end
    return u30
end

local function replaceTrailingSpaces(a1) -- Line: 155 -- upvalues: u78 (val) -- types: a1: string
    return a1:gsub("%s+$", function(a1) -- Line: 156 -- upvalues: u78 (upval)
        return string.rep(u78, #a1)
    end)
end

local function printReceived(a1) -- Line: 161 -- upvalues: red (val), replaceTrailingSpaces (ref), stringify (val)
    return red(replaceTrailingSpaces(stringify(a1)))
end

local function printExpected(a1) -- Line: 165 -- upvalues: green (val), replaceTrailingSpaces (ref), stringify (val)
    return green(replaceTrailingSpaces(stringify(a1)))
end

local function printWithType(a1, a2, a3) -- Line: 169 -- upvalues: getType (val) -- types: a1: string, a3: function
    local v1 = getType(a2)
    return (if v1 == "nil" then "" else string.format("%s has type:  %s\n", a1, v1)) .. (string.format("%s has value: %s", a1, a3(a2)))
end

local function ensureActualIsNumber(a1, a2, a3) -- Line: 208
    -- upvalues: Error (val), matcherErrorMessage (ref), matcherHint (ref), red (val), printWithType (val)
    -- upvalues: printReceived (val)
    if typeof(a1) ~= "number" then
        local v1 = a2
        if not a3 then
            v1 = "[.never]" .. v1
        end
        error(Error(matcherErrorMessage(
            matcherHint(v1, nil, nil, a3),
            (red("received")) .. " value must be a number",
            (printWithType("Received", a1, printReceived))
        )))
    end
end

local function ensureExpectedIsNumber(a1, a2, a3) -- Line: 231
    -- upvalues: Error (val), matcherErrorMessage (ref), matcherHint (ref), green (val), printWithType (val)
    -- upvalues: printExpected (val)
    if typeof(a1) ~= "number" then
        local v1 = a2
        if not a3 then
            v1 = "[.never]" .. v1
        end
        error(Error(matcherErrorMessage(
            matcherHint(v1, nil, nil, a3),
            (green("expected")) .. " value must be a number",
            (printWithType("Expected", a1, printExpected))
        )))
    end
end

local function getCommonAndChangedSubstrings(a1, a2, a3) -- Line: 284
    -- upvalues: Array (val), DIFF_EQUAL (val), inverse (val)
    return Array.reduce(a1, function(a1, a2_2) -- Line: 285
        -- upvalues: DIFF_EQUAL (upval), a2 (val), a3 (val), inverse (upval)
        if a2_2[1] == DIFF_EQUAL then
            return a1 .. a2_2[2]
        end
        if a2_2[1] ~= a2 then
            return a1
        end
        if a3 then
            return a1 .. inverse(a2_2[2])
        end
        return a1 .. a2_2[2]
    end, "")
end

local function isLineDiffable(a1, a2) -- Line: 298 -- upvalues: getType (val), isPrimitive (val)
    local v1 = getType(a1)
    local v2 = getType(a2)
    if v1 ~= v2 then
        return false
    end
    if not isPrimitive(a1) then
        if v1 ~= "DateTime" and v1 ~= "function" then
            if v1 == "table" and typeof(a1.asymmetricMatch) == "function" then
                return false
            end
            if v2 == "table" and typeof(a2.asymmetricMatch) == "function" then
                return false
            end
            return true
        end
        return false
    end
    local v3 = false
    if typeof(a1) == "string" then
        v3 = false
        if typeof(a2) == "string" then
            v3 = false
            if #a1 ~= 0 then
                v3 = false
                if #a2 ~= 0 then
                    local v4 = string.find(a1, "\n") or string.find(a2, "\n")
                    v3 = not not v4
                end
            end
        end
    end
    return v3
end

function printDiffOrStringify(a1, a2, a3, a4, a5) -- Line: 336
    -- upvalues: diffStringsUnified (val), chalk (val), diffStringsRaw (val), Array (val), DIFF_EQUAL (val)
    -- upvalues: getCommonAndChangedSubstrings (ref), DIFF_DELETE (val), green (val), replaceTrailingSpaces (ref)
    -- upvalues: stringify (val), DIFF_INSERT (val), red (val), isLineDiffable (ref)
    -- upvalues: replaceMatchedToAsymmetricMatcher (ref), deepCyclicCopyReplaceable (val), diff (val)
    local v1, v2, v3, v4
    if typeof(a1) == "string"
        and typeof(a2) == "string"
        and #a1 ~= 0
        and #a2 ~= 0
        and #a1 <= 20000
        and #a2 <= 20000
        and a1 ~= a2 then
        if not string.find(a1, "\n") and not string.find(a2, "\n") then
            v1 = diffStringsRaw(a1, a2, true)
            v2 = Array.some(v1, function(a1) -- Line: 365 -- upvalues: DIFF_EQUAL (upval)
                return a1[1] == DIFF_EQUAL
            end)
            v3 = getLabelPrinter(a3, a4)
            local v5 = v3(a3)
            local v6 = getCommonAndChangedSubstrings(v1, DIFF_DELETE, v2)
            v4 = v5 .. green(replaceTrailingSpaces(stringify(v6)))
            local v7 = v3(a4)
            local v8 = getCommonAndChangedSubstrings(v1, DIFF_INSERT, v2)
            return v4 .. "\n" .. v7 .. red(replaceTrailingSpaces(stringify(v8)))
        end
        return diffStringsUnified(a1, a2, {
            includeChangeCounts = true,
            aAnnotation = a3,
            bAnnotation = a4,
            changeLineTrailingSpaceColor = chalk.bgYellow,
            commonLineTrailingSpaceColor = chalk.bgYellow,
            emptyFirstOrLastLinePlaceholder = utf8.char(8629),
            expand = a5,
        })
    end
    if isLineDiffable(a1, a2) then
        v1 = replaceMatchedToAsymmetricMatcher(deepCyclicCopyReplaceable(a1), deepCyclicCopyReplaceable(a2), {}, {})
        v4 = diff(v1.replacedExpected, v1.replacedReceived, {includeChangeCounts = true, aAnnotation = a3, bAnnotation = a4, expand = a5})
        if typeof(v4) == "string" and string.find(v4, "%- " .. a3) and string.find(v4, "%+ " .. a4) then
            return v4
        end
    end
    v1 = getLabelPrinter(a3, a4)
    v2 = (v1(a3)) .. green(replaceTrailingSpaces(stringify(a1)))
    v3 = if (stringify(a1)) ~= stringify(a2) then (v1(a4)) .. red(replaceTrailingSpaces(stringify(a2))) else (v1(a4)) .. "serializes to the same string"
    return v2 .. "\n" .. v3
end

local function shouldPrintDiff(a1, a2) -- Line: 419
    if typeof(a1) == "number" and typeof(a2) == "number" then
        return false
    end
    if typeof(a1) == "boolean" and typeof(a2) == "boolean" then
        return false
    end
    return true
end

function replaceMatchedToAsymmetricMatcher(a1, a2, a3, a4) -- Line: 433
    -- upvalues: Replaceable (val), Array (val), isAsymmetricMatcher (ref), replaceMatchedToAsymmetricMatcher (ref)
    if not Replaceable.isReplaceable(a1, a2) then
        return {replacedExpected = a1, replacedReceived = a2}
    end
    if Array.indexOf(a3, a1) == -1 and Array.indexOf(a4, a2) == -1 then
        table.insert(a3, a1)
        table.insert(a4, a2)
        local u31 = Replaceable.new(a1)
        local u35 = Replaceable.new(a2)
        u31:forEach(function(a1, a2) -- Line: 462
            -- upvalues: u35 (val), isAsymmetricMatcher (upval), u31 (val), Replaceable (upval)
            -- upvalues: replaceMatchedToAsymmetricMatcher (upval), a3 (val), a4 (val)
            local v1 = u35:get(a2)
            if isAsymmetricMatcher(a1) then
                if not a1:asymmetricMatch(v1) then
                    return
                end
                u35:set(a2, a1)
                return
            end
            if isAsymmetricMatcher(v1) then
                if not v1:asymmetricMatch(a1) then
                    return
                end
                u31:set(a2, v1)
                return
            end
            if Replaceable.isReplaceable(a1, v1) then
                local v2 = replaceMatchedToAsymmetricMatcher(a1, v1, a3, a4)
                u31:set(a2, v2.replacedExpected)
                u35:set(a2, v2.replacedReceived)
            end
        end)
        return {replacedExpected = u31.object, replacedReceived = u35.object}
    end
    return {replacedExpected = a1, replacedReceived = a2}
end

function isAsymmetricMatcher(a1) -- Line: 489 -- upvalues: getType (val)
    local v1 = false
    if (getType(a1)) == "table" then
        v1 = typeof(a1.asymmetricMatch) == "function"
    end
    return v1
end

function pluralize(a1, a2) -- Line: 502 -- upvalues: u79 (val) -- types: a1: string, a2: number
    if a2 == 1 then
        return (u79[a2 + 1] or a2) .. " " .. a1
    end
    return (u79[a2 + 1] or a2) .. " " .. a1 .. "s"
end

function getLabelPrinter(...) -- Line: 518 -- upvalues: Array (val)
    local u7 = Array.reduce({...}, function(a1, a2) -- Line: 521
        return (math.max(#a2, a1))
    end, 0)
    return function(a1) -- Line: 525 -- upvalues: u7 (val) -- types: a1: string
        if u7 < #a1 then
            error("Cannot print label for string with length larger than the max allowed of " .. u7)
        end
        return string.format("%s: %s", a1, string.rep(" ", u7 - #a1))
    end
end

function matcherErrorMessage(a1, a2, a3) -- Line: 536
    -- upvalues: bold (val)
    if typeof(a3) == "string" then
        return string.format("%s\n\n%s: %s%s", a1, bold("Matcher error"), a2, "\n\n" .. a3)
    end
    return string.format("%s\n\n%s: %s%s", a1, bold("Matcher error"), a2, "")
end

function matcherHint(a1, a2, a3, a4) -- Line: 551
    -- upvalues: green (val), red (val), dim (val)
    local v1 = a2 or "received"
    local v2 = a3 or "expected"
    local v3 = a4 or {}
    local v4 = nil
    local v5 = nil
    local v6 = nil
    local v7 = nil
    local v8 = nil
    local v9 = nil
    local v10 = nil
    local v11 = nil
    if v3 then
        v4 = v3.comment or ""
        v5 = v3.expectedColor or green
        v6 = v3.isDirectExpectCall or false
        v7 = v3.isNot or false
        v8 = v3.promise or ""
        v9 = v3.receivedColor or red
        v10 = v3.secondArgument or ""
        v11 = v3.secondArgumentColor or green
    end
    local v12 = ""
    local v13 = "expect"
    if not v6 and v1 ~= "" then
        v12 = v12 .. (dim(v13 .. "(")) .. v9(v1)
        v13 = ")"
    end
    if v8 ~= "" then
        v12 = v12 .. (dim(v13 .. ".")) .. v8
        v13 = ""
    end
    if v7 then
        v12 = v12 .. (dim(v13 .. ".")) .. "never"
        v13 = ""
    end
    if not string.find(a1, "%.") then
        v12 = v12 .. (dim(v13 .. ".")) .. a1
        v13 = ""
    else
        v13 = v13 .. a1
    end
    if v2 ~= "" then
        v12 = v12 .. (dim(v13 .. "(")) .. v5(v2)
        if v10 ~= "" then
            v12 = v12 .. (dim(", ")) .. v11(v10)
        end
        v13 = ")"
    else
        v13 = v13 .. "()"
    end
    if v4 ~= "" then
        v13 = v13 .. " -- " .. v4
    end
    if v13 ~= "" then
        v12 = v12 .. dim(v13)
    end
    return v12
end

return {
    SUGGEST_TO_CONTAIN_EQUAL = "Looks like you wanted to test for object/array equality with the stricter `toContain` matcher. You probably need to use `toContainEqual` instead.",
    EXPECTED_COLOR = green,
    RECEIVED_COLOR = red,
    INVERTED_COLOR = inverse,
    BOLD_WEIGHT = bold,
    DIM_COLOR = dim,
    stringify = stringify,
    highlightTrailingWhitespace = function(a1) -- Line: 148 -- upvalues: inverse (val) -- types: a1: string
        return a1:gsub("%s+$", function(a1) -- Line: 149 -- upvalues: inverse (upval)
            return inverse(a1)
        end)
    end,
    printReceived = printReceived,
    printExpected = printExpected,
    printWithType = printWithType,
    ensureNoExpected = function(a1, a2, a3) -- Line: 186
        -- upvalues: Error (val), matcherErrorMessage (ref), matcherHint (ref), printWithType (val), printExpected (val)
        if typeof(a1) ~= "nil" then
            local v1 = a2
            if not a3 then
                v1 = "[.never]" .. v1
            end
            error(Error(matcherErrorMessage(
                matcherHint(v1, nil, "", a3),
                "this matcher must not have an expected argument",
                (printWithType("Expected", a1, printExpected))
            )))
        end
    end,
    ensureActualIsNumber = ensureActualIsNumber,
    ensureExpectedIsNumber = ensureExpectedIsNumber,
    ensureNumbers = function(a1, a2, a3, a4) -- Line: 254
        -- upvalues: ensureActualIsNumber (val), ensureExpectedIsNumber (val)
        ensureActualIsNumber(a1, a3, a4)
        ensureExpectedIsNumber(a2, a3, a4)
    end,
    ensureExpectedIsNonNegativeInteger = function(a1, a2, a3) -- Line: 259
        -- upvalues: Number (val), Error (val), matcherErrorMessage (ref), matcherHint (ref), green (val)
        -- upvalues: printWithType (val), printExpected (val)
        if typeof(a1) ~= "number" or not Number.isSafeInteger(a1) or a1 < 0 then
            local v1 = a2
            if not a3 then
                v1 = "[.never]" .. v1
            end
            error(Error(matcherErrorMessage(
                matcherHint(v1, nil, nil, a3),
                (green("expected")) .. " value must be a non-negative integer",
                (printWithType("Expected", a1, printExpected))
            )))
        end
    end,
    printDiffOrStringify = printDiffOrStringify,
    diff = function(a1, a2, a3) -- Line: 494 -- upvalues: shouldPrintDiff (ref), diff (val)
        return shouldPrintDiff(a1, a2) and diff(a1, a2, a3) or nil
    end,
    pluralize = pluralize,
    getLabelPrinter = getLabelPrinter,
    matcherErrorMessage = matcherErrorMessage,
    matcherHint = matcherHint,
}