-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_expect@3.10.0.expect.spyMatchers
-- Decompile time: 197.08 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Error = v1.Error
local Number = v1.Number
local String = v1.String
local Symbol = v1.Symbol
local getType = require(script.Parent.Parent:WaitForChild("jest-get-type")).getType
local isPrimitive = require(script.Parent.Parent:WaitForChild("jest-get-type")).isPrimitive
local v2 = require(script.Parent.Parent:WaitForChild("jest-matcher-utils"))
local DIM_COLOR = v2.DIM_COLOR
local EXPECTED_COLOR = v2.EXPECTED_COLOR
local RECEIVED_COLOR = v2.RECEIVED_COLOR
local diff = v2.diff
local ensureExpectedIsNonNegativeInteger = v2.ensureExpectedIsNonNegativeInteger
local ensureNoExpected = v2.ensureNoExpected
local matcherErrorMessage = v2.matcherErrorMessage
local matcherHint = v2.matcherHint
local printExpected = v2.printExpected
local printReceived = v2.printReceived
local printWithType = v2.printWithType
local stringify = v2.stringify
local equals = (require((script.Parent:WaitForChild("jasmineUtils")))).equals
local iterableEquality = (require((script.Parent:WaitForChild("utils")))).iterableEquality
local printCommon = nil
local isEqualValue = nil
local printDiffCall = nil
local isLineDiffableCall = nil
local isLineDiffableArg = nil
local isSpy = nil
local ensureMockOrSpy = nil
local ensureMock = nil

local function isExpand(a1) -- Line: 52 -- types: a1: boolean?
    return a1 ~= false
end

local function printExpectedArgs(a1) -- Line: 60 -- upvalues: Array (val), printExpected (val)
    if #a1 == 0 then
        return "called with 0 arguments"
    end
    return Array.join(Array.map(a1, function(a1) -- Line: 65 -- upvalues: printExpected (upval)
        return printExpected(a1)
    end), ", ")
end

local function printReceivedArgs(a1, a2) -- Line: 73
    -- upvalues: Array (val), isEqualValue (ref), printCommon (ref), printReceived (val)
    local u3 = a2
    if not u3 then
        u3 = {}
    end
    if #a1 == 0 then
        return "called with 0 arguments"
    end
    return Array.join(Array.map(a1, function(a1, a2) -- Line: 79
        -- upvalues: Array (upval), u3 (val), isEqualValue (upval), printCommon (upval), printReceived (upval)
        if Array.isArray(u3) and a2 <= #u3 and isEqualValue(u3[a2], a1) then
            return printCommon(a1)
        end
        return printReceived(a1)
    end), ", ")
end

function printCommon(a1) -- Line: 91 -- upvalues: DIM_COLOR (val), stringify (val)
    return DIM_COLOR(stringify(a1))
end

function isEqualValue(a1, a2) -- Line: 95 -- upvalues: equals (val), iterableEquality (val)
    return equals(a1, a2, {iterableEquality})
end

local function isEqualCall(a1, a2) -- Line: 99 -- upvalues: isEqualValue (ref)
    return isEqualValue(a1, a2)
end

local function isEqualReturn(a1, a2) -- Line: 103 -- upvalues: isEqualValue (ref)
    local v1 = false
    if a2.type == "return" then
        v1 = isEqualValue(a1, a2.value)
    end
    return v1
end

local function countReturns(a1) -- Line: 107 -- upvalues: Array (val)
    return Array.reduce(a1, function(a1, a2) -- Line: 108 -- types: a1: number
        if a2.type == "return" then
            return a1 + 1
        end
        return a1
    end, 0)
end

local function printNumberOfReturns(a1, a2) -- Line: 117
    -- upvalues: printReceived (val)
    local v1 = string.format("\nNumber of returns: %s", printReceived(a1))
    if a2 ~= a1 then
        v1 = v1 .. string.format("\nNumber of calls:   %s", printReceived(a2))
    end
    return v1
end

local function getRightAlignedPrinter(a1) -- Line: 130 -- types: a1: string
    local u4 = a1:find(":")
    local u8 = a1:sub(u4)
    return function(a1, a2) -- Line: 135 -- upvalues: u4 (val), u8 (val) -- types: a1: string, a2: boolean
        return (if not a2 then string.rep(" ", (math.max(0, u4 - 1 - #a1))) else "->" .. string.rep(" ", (math.max(0, u4 - 3 - #a1)))) .. a1 .. u8
    end
end

local function printReceivedCallsNegative(a1, a2, a3, a4) -- Line: 150
    -- upvalues: printReceivedArgs (ref), getRightAlignedPrinter (ref), Array (val)
    if #a2 == 0 then
        return ""
    end
    if a3 then
        return "Received:       " .. (printReceivedArgs(a2[1], a1)) .. "\n"
    end
    local u15 = getRightAlignedPrinter("Received:       ")
    return "Received\n" .. Array.reduce(a2, function(a1_2, a2) -- Line: 169
        -- upvalues: u15 (val), a4 (val), printReceivedArgs (upval), a1 (val)
        local v1 = a2[1]
        local v2 = a2[2]
        return a1_2 .. (u15(tostring(v1), v1 == a4)) .. (printReceivedArgs(v2, a1)) .. "\n"
    end, "")
end

local function printExpectedReceivedCallsPositive(a1, a2, a3, a4, a5) -- Line: 177
    -- upvalues: printExpectedArgs (ref), isLineDiffableCall (ref), EXPECTED_COLOR (val), RECEIVED_COLOR (val)
    -- upvalues: isEqualValue (ref), printCommon (ref), isLineDiffableArg (ref), diff (val), Array (val)
    -- upvalues: stringify (val), printReceivedArgs (ref), getRightAlignedPrinter (ref), printDiffCall (ref)
    local u208, v1, v2, v3, v4
    local v5 = string.format("Expected: %s\n", printExpectedArgs(a1))
    if #a2 == 0 then
        return v5
    end
    if not a4 then
        u208 = getRightAlignedPrinter("Received: ")
        return v5 .. "Received\n" .. Array.reduce(a2, function(a1_2, a2) -- Line: 251
            -- upvalues: u208 (val), a5 (val), isLineDiffableCall (upval), a1 (val), printDiffCall (upval), a3 (val)
            -- upvalues: printReceivedArgs (upval)
            local v1 = a2[1]
            local v2 = a2[2]
            local v3 = u208(tostring(v1), v1 == a5)
            if v1 ~= a5 and a5 ~= nil then
                return a1_2 .. v3 .. (printReceivedArgs(v2, a1)) .. "\n"
            end
            if isLineDiffableCall(a1, v2) then
                return a1_2 .. (v3:sub(1, (v3:find(":")) - 1)) .. "\n" .. (v3:sub(v3:find(":") + 1, #v3)) .. (printDiffCall(a1, v2, a3)) .. "\n"
            end
            return a1_2 .. v3 .. (printReceivedArgs(v2, a1)) .. "\n"
        end, "")
    end
    if a5 ~= 1 and a5 ~= nil then
        u208 = getRightAlignedPrinter("Received: ")
        return v5 .. "Received\n" .. Array.reduce(a2, function(a1_2, a2) -- Line: 251
            -- upvalues: u208 (val), a5 (val), isLineDiffableCall (upval), a1 (val), printDiffCall (upval), a3 (val)
            -- upvalues: printReceivedArgs (upval)
            local v1 = a2[1]
            local v2 = a2[2]
            local v3 = u208(tostring(v1), v1 == a5)
            if v1 ~= a5 and a5 ~= nil then
                return a1_2 .. v3 .. (printReceivedArgs(v2, a1)) .. "\n"
            end
            if isLineDiffableCall(a1, v2) then
                return a1_2 .. (v3:sub(1, (v3:find(":")) - 1)) .. "\n" .. (v3:sub(v3:find(":") + 1, #v3)) .. (printDiffCall(a1, v2, a3)) .. "\n"
            end
            return a1_2 .. v3 .. (printReceivedArgs(v2, a1)) .. "\n"
        end, "")
    end
    local v6 = a2[1][2]
    if not isLineDiffableCall(a1, v6) then
        return v5 .. "Received: " .. (printReceivedArgs(v6, a1)) .. "\n"
    end
    local v7 = {EXPECTED_COLOR("- Expected"), RECEIVED_COLOR("+ Received"), ""}
    for i = 1, (math.max(#a1, #v6)) do
        v1 = i
        v2 = false
        if v1 <= #a1 and v1 <= #v6 then
            if isEqualValue(a1[v1], v6[v1]) then
                table.insert(v7, "  " .. (printCommon(v6[v1])) .. ",")
                v2 = true
            end
            if not v2 and isLineDiffableArg(a1[v1], v6[v1]) then
                v3 = diff(a1[v1], v6[v1], {a3})
                if typeof(v3) == "string" and v3:find("%- Expected") and v3:find("%+ Received") then
                    v4 = {}
                    for j in v3:gmatch("[^\n]+") do
                        table.insert(v4, j)
                    end
                    table.insert(v7, (Array.join(Array.slice(v4, 3), "\n")) .. ",")
                    v2 = true
                end
            end
        end
        if not v2 then
            if v1 <= #a1 then
                table.insert(v7, (EXPECTED_COLOR("- " .. stringify(a1[v1]))) .. ",")
            end
            if v1 <= #v6 then
                table.insert(v7, (RECEIVED_COLOR("+ " .. stringify(v6[v1]))) .. ",")
            end
        end
        v1 = v1 + 1
    end
    return (table.concat(v7, "\n")) .. "\n"
end

local u110 = string.gsub("Received", "[a-zA-Z0-9_]", " ")

function printDiffCall(a1, a2, a3) -- Line: 272
    -- upvalues: Array (val), isEqualValue (ref), u110 (val), printCommon (ref), isLineDiffableArg (ref), diff (val)
    -- upvalues: printReceived (val), RECEIVED_COLOR (val), stringify (val)
    return Array.join(Array.map(a2, function(a1_2, a2) -- Line: 274
        -- upvalues: a1 (val), isEqualValue (upval), u110 (upval), printCommon (upval), isLineDiffableArg (upval)
        -- upvalues: diff (upval), a3 (val), Array (upval), printReceived (upval), RECEIVED_COLOR (upval)
        -- upvalues: stringify (upval)
        local v1
        if a2 <= #a1 then
            if isEqualValue(a1[a2], a1_2) then
                return u110 .. "  " .. (printCommon(a1_2)) .. ","
            end
            local v2 = isLineDiffableArg
            v1 = a1[a2]
            if v2(v1, a1_2) then
                v2 = diff(a1[a2], a1_2, {expand = a3})
                if typeof(v2) == "string" and v2:find("%- Expected") and v2:find("%+ Received") then
                    v1 = {}
                    for i in v2:gmatch("[^\n]+") do
                        table.insert(v1, i)
                    end
                    return (Array.join(Array.map(Array.slice(v1, 3), function(a1) -- Line: 296 -- upvalues: u110 (upval)
                        return u110 .. a1
                    end), "\n")) .. ","
                end
            end
        end
        v1 = u110
        local v3 = if not (a2 <= #a1) then RECEIVED_COLOR("+ " .. stringify(a1_2)) else "  " .. printReceived(a1_2)
        return v1 .. v3 .. ","
    end), "\n")
end

function isLineDiffableCall(a1, a2) -- Line: 320 -- upvalues: Array (val), isLineDiffableArg (ref)
    return Array.some(a1, function(a1, a2_2) -- Line: 321 -- upvalues: a2 (val), isLineDiffableArg (upval)
        local v1 = false
        if a2_2 <= #a2 then
            v1 = isLineDiffableArg(a1, a2[a2_2])
        end
        return v1
    end)
end

function isLineDiffableArg(a1, a2) -- Line: 328 -- upvalues: getType (val), isPrimitive (val)
    local v1 = getType(a1)
    local v2 = getType(a2)
    if v1 ~= v2 or isPrimitive(a1) then
        return false
    end
    if v1 ~= "date" and v1 ~= "function" and v1 ~= "regexp" and v1 ~= "error" then
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

local function printResult(a1, a2) -- Line: 359 -- upvalues: isEqualValue (ref), printCommon (ref), printReceived (val)
    if a1.type == "throw" then
        return "function call threw an error"
    end
    if a1.type == "incomplete" then
        return "function call has not returned yet"
    end
    if isEqualValue(a2, a1.value) then
        return printCommon(a1.value)
    end
    return printReceived(a1.value)
end

local function printReceivedResults(a1, a2, a3, a4, a5) -- Line: 377
    -- upvalues: printResult (ref), getRightAlignedPrinter (ref), String (val), Array (val)
    local u21, v1
    if #a3 == 0 then
        return ""
    end
    if not a4 then
        u21 = getRightAlignedPrinter(a1)
        v1 = a1:find(":") or 1
        return (String.trim((a1:sub(1, v1 - 1)) .. a1:sub(v1 + 1, #a1))) .. "\n" .. Array.reduce(a3, function(a1, a2_2) -- Line: 400 -- upvalues: u21 (val), a5 (val), printResult (upval), a2 (val) -- types: a1: string
            local v1 = a2_2[1]
            local v2 = a2_2[2]
            return a1 .. (u21(tostring(v1), v1 == a5)) .. (printResult(v2, a2)) .. "\n"
        end, "")
    end
    if a5 ~= 1 and a5 ~= nil then
        u21 = getRightAlignedPrinter(a1)
        v1 = a1:find(":") or 1
        return (String.trim((a1:sub(1, v1 - 1)) .. a1:sub(v1 + 1, #a1))) .. "\n" .. Array.reduce(a3, function(a1, a2_2) -- Line: 400 -- upvalues: u21 (val), a5 (val), printResult (upval), a2 (val) -- types: a1: string
            local v1 = a2_2[1]
            local v2 = a2_2[2]
            return a1 .. (u21(tostring(v1), v1 == a5)) .. (printResult(v2, a2)) .. "\n"
        end, "")
    end
    return a1 .. (printResult(a3[1][2], a2)) .. "\n"
end

local function createToBeCalledMatcher(a1) -- Line: 407
    -- upvalues: ensureNoExpected (val), ensureMockOrSpy (ref), isSpy (ref), Array (val), matcherHint (val)
    -- upvalues: printExpected (val), printReceived (val), printReceivedArgs (ref)
    return function(a1_2, a2, a3) -- Line: 408
        -- upvalues: ensureNoExpected (upval), a1 (val), ensureMockOrSpy (upval), isSpy (upval), Array (upval)
        -- upvalues: matcherHint (upval), printExpected (upval), printReceived (upval), printReceivedArgs (upval)
        local v1
        local u3 = {isNot = a1_2.isNot, promise = a1_2.promise}
        ensureNoExpected(a3, a1, u3)
        ensureMockOrSpy(a2, a1, "", u3)
        local v2 = isSpy(a2)
        local u24 = if not v2 then a2.getMockName() else "spy"
        local u35 = if not v2 then #a2.mock.calls else a2.calls:count()
        local calls = if not v2 then a2.mock.calls else Array.map(a2.calls:all(), function(a1) -- Line: 435
            return a1.args
        end)
        return {
            message = if not (u35 > 0) then function() -- Line: 462
                -- upvalues: matcherHint (upval), a1 (upval), u24 (ref), u3 (val), printExpected (upval)
                -- upvalues: printReceived (upval), u35 (ref)
                return (matcherHint(a1, u24, "", u3)) .. "\n\n" .. (("Expected number of calls: >= %s\n"):format((printExpected(1)))) .. ("Received number of calls:    %s"):format((printReceived(u35)))
            end else function() -- Line: 445
                -- upvalues: matcherHint (upval), a1 (upval), u24 (ref), u3 (val), printExpected (upval)
                -- upvalues: printReceived (upval), u35 (ref), Array (upval), calls (ref), printReceivedArgs (upval)
                local v1 = matcherHint(a1, u24, "", u3)
                local v2 = ("Expected number of calls: %s\n"):format((printExpected(0)))
                local v3 = ("Received number of calls: %s\n\n"):format((printReceived(u35)))
                local v4 = calls
                return v1 .. "\n\n" .. v2 .. v3 .. Array.join(Array.reduce(v4, function(a1, a2, a3) -- Line: 451 -- upvalues: printReceivedArgs (upval) -- types: a3: number
                    if #a1 < 3 then
                        table.insert(a1, (("%s: %s"):format(tostring(a3), (printReceivedArgs(a2)))))
                    end
                    return a1
                end, {}), "\n")
            end,
            pass = v1,
        }
    end
end

local function createToReturnMatcher(a1) -- Line: 474
    -- upvalues: ensureNoExpected (val), ensureMock (ref), Array (val), matcherHint (val), printExpected (val)
    -- upvalues: printReceived (val)
    return function(a1_2, a2, a3) -- Line: 475
        -- upvalues: ensureNoExpected (upval), a1 (val), ensureMock (upval), Array (upval), matcherHint (upval)
        -- upvalues: printExpected (upval), printReceived (upval)
        local v1
        local u3 = {isNot = a1_2.isNot, promise = a1_2.promise}
        ensureNoExpected(a3, a1, u3)
        ensureMock(a2, a1, "", u3)
        local u18 = a2.getMockName()
        local u25 = Array.reduce(a2.mock.results, function(a1, a2) -- Line: 488 -- types: a1: number
            if a2.type == "return" then
                return a1 + 1
            end
            return a1
        end, 0)
        return {
            message = if not (u25 > 0) then function() -- Line: 522
                -- upvalues: matcherHint (upval), a1 (upval), u18 (val), u3 (val), printExpected (upval)
                -- upvalues: printReceived (upval), u25 (val), a2 (val)
                local v1 = (matcherHint(a1, u18, "", u3)) .. "\n\n" .. (("Expected number of returns: >= %s\n"):format((printExpected(1)))) .. ("Received number of returns:    %s"):format((printReceived(u25)))
                if #a2.mock.calls ~= u25 then
                    v1 = v1 .. ("\nReceived number of calls:      %s"):format((printReceived(#a2.mock.calls)))
                end
                return v1
            end else function() -- Line: 499
                -- upvalues: matcherHint (upval), a1 (upval), u18 (val), u3 (val), printExpected (upval)
                -- upvalues: printReceived (upval), u25 (val), Array (upval), a2 (val)
                local v1 = (matcherHint(a1, u18, "", u3)) .. "\n\n" .. (("Expected number of returns: %s\n"):format((printExpected(0)))) .. (("Received number of returns: %s\n\n"):format((printReceived(u25)))) .. Array.join(Array.reduce(a2.mock.results, function(a1, a2, a3) -- Line: 505 -- upvalues: printReceived (upval) -- types: a3: number
                    if a2.type == "return" and #a1 < 3 then
                        table.insert(a1, (("%s: %s"):format(tostring(a3), (printReceived(a2.value)))))
                    end
                    return a1
                end, {}), "\n")
                if #a2.mock.calls ~= u25 then
                    v1 = v1 .. "\n\nReceived number of calls:   " .. printReceived(#a2.mock.calls)
                end
                return v1
            end,
            pass = v1,
        }
    end
end

local function createToBeCalledTimesMatcher(a1) -- Line: 540
    -- upvalues: ensureExpectedIsNonNegativeInteger (val), ensureMockOrSpy (ref), isSpy (ref), matcherHint (val)
    -- upvalues: printExpected (val), printReceived (val)
    return function(a1_2, a2, a3) -- Line: 541
        -- upvalues: ensureExpectedIsNonNegativeInteger (upval), a1 (val), ensureMockOrSpy (upval), isSpy (upval)
        -- upvalues: matcherHint (upval), printExpected (upval), printReceived (upval)
        local v1
        local u3 = {isNot = a1_2.isNot, promise = a1_2.promise}
        ensureExpectedIsNonNegativeInteger(a3, a1, u3)
        ensureMockOrSpy(a2, a1, "expected", u3)
        local v2 = isSpy(a2)
        local u24 = if not v2 then a2.getMockName() else "spy"
        local u35 = if not v2 then #a2.mock.calls else a2.calls:count()
        return {
            message = if not (u35 == a3) then function() -- Line: 576
                -- upvalues: matcherHint (upval), a1 (upval), u24 (ref), u3 (val), printExpected (upval), a3 (val)
                -- upvalues: printReceived (upval), u35 (ref)
                return (matcherHint(a1, u24, "expected", u3)) .. "\n\n" .. (("Expected number of calls: %s\n"):format((printExpected(a3)))) .. ("Received number of calls: %s"):format((printReceived(u35)))
            end else function() -- Line: 570
                -- upvalues: matcherHint (upval), a1 (upval), u24 (ref), u3 (val), printExpected (upval), a3 (val)
                return (matcherHint(a1, u24, "expected", u3)) .. "\n\n" .. ("Expected number of calls: never %s"):format((printExpected(a3)))
            end,
            pass = v1,
        }
    end
end

local function createToReturnTimesMatcher(a1) -- Line: 588
    -- upvalues: ensureExpectedIsNonNegativeInteger (val), ensureMock (ref), Array (val), matcherHint (val)
    -- upvalues: printExpected (val), printReceived (val)
    return function(a1_2, a2, a3) -- Line: 589
        -- upvalues: ensureExpectedIsNonNegativeInteger (upval), a1 (val), ensureMock (upval), Array (upval)
        -- upvalues: matcherHint (upval), printExpected (upval), printReceived (upval)
        local v1
        local u3 = {isNot = a1_2.isNot, promise = a1_2.promise}
        ensureExpectedIsNonNegativeInteger(a3, a1, u3)
        ensureMock(a2, a1, "expected", u3)
        local u18 = a2.getMockName()
        local u25 = Array.reduce(a2.mock.results, function(a1, a2) -- Line: 602 -- types: a1: number
            if a2.type == "return" then
                return a1 + 1
            end
            return a1
        end, 0)
        return {
            message = if not (u25 == a3) then function() -- Line: 627
                -- upvalues: matcherHint (upval), a1 (upval), u18 (val), u3 (val), printExpected (upval), a3 (val)
                -- upvalues: printReceived (upval), u25 (val), a2 (val)
                local v1 = (matcherHint(a1, u18, "expected", u3)) .. "\n\n" .. (("Expected number of returns: %s\n"):format((printExpected(a3)))) .. ("Received number of returns: %s"):format((printReceived(u25)))
                if #a2.mock.calls ~= u25 then
                    v1 = v1 .. ("\nReceived number of calls:   %s"):format((printReceived(#a2.mock.calls)))
                end
                return v1
            end else function() -- Line: 614
                -- upvalues: matcherHint (upval), a1 (upval), u18 (val), u3 (val), printExpected (upval), a3 (val)
                -- upvalues: a2 (val), u25 (val), printReceived (upval)
                local v1 = (matcherHint(a1, u18, "expected", u3)) .. "\n\n" .. ("Expected number of returns: never %s"):format((printExpected(a3)))
                if #a2.mock.calls ~= u25 then
                    v1 = v1 .. ("\n\nReceived number of calls:         %s"):format((printReceived(#a2.mock.calls)))
                end
                return v1
            end,
            pass = v1,
        }
    end
end

local function createToBeCalledWithMatcher(a1) -- Line: 645
    -- upvalues: Symbol (val), ensureMockOrSpy (ref), isSpy (ref), Array (val), isEqualCall (ref), matcherHint (val)
    -- upvalues: printExpectedArgs (ref), stringify (val), printReceivedCallsNegative (ref), printReceived (val)
    -- upvalues: printExpectedReceivedCallsPositive (ref), isExpand (ref)
    return function(a1_2, a2, ...) -- Line: 646
        -- upvalues: Symbol (upval), ensureMockOrSpy (upval), a1 (val), isSpy (upval), Array (upval)
        -- upvalues: isEqualCall (upval), matcherHint (upval), printExpectedArgs (upval), stringify (upval)
        -- upvalues: printReceivedCallsNegative (upval), printReceived (upval)
        -- upvalues: printExpectedReceivedCallsPositive (upval), isExpand (upval)
        local u27 = {}
        u27[1] = ...
        for i = 1, (select("#", ...)) do
            if u27[i] == nil then
                u27[i] = (Symbol.for_("$$nil"))
            end
        end
        local u28 = {isNot = a1_2.isNot, promise = a1_2.promise}
        ensureMockOrSpy(a2, a1, "...expected", u28)
        local v1 = isSpy(a2)
        local u50 = if not v1 then a2.getMockName() else "spy"
        local calls = if not v1 then a2.mock.calls else Array.map(a2.calls:all(), function(a1) -- Line: 674
            return a1.args
        end)
        local v2 = calls
        local v3 = Array.some(v2, function(a1) -- Line: 681 -- upvalues: isEqualCall (upval), u27 (val)
            return isEqualCall(u27, a1)
        end)
        return {
            message = if not v3 then function() -- Line: 710
                -- upvalues: calls (ref), matcherHint (upval), a1 (upval), u50 (ref), u28 (val)
                -- upvalues: printExpectedReceivedCallsPositive (upval), u27 (val), isExpand (upval), a1_2 (val)
                -- upvalues: printReceived (upval)
                local v1 = {}
                local v2 = 1
                while v2 <= #calls do
                    if not (#v1 < 3) then
                        break
                    end
                    table.insert(v1, {v2, calls[v2]})
                    v2 = v2 + 1
                end
                return (matcherHint(a1, u50, "...expected", u28)) .. "\n\n" .. (printExpectedReceivedCallsPositive(u27, v1, isExpand(a1_2.expand), #calls == 1)) .. ("\nNumber of calls: %s"):format((printReceived(#calls)))
            end else function() -- Line: 687
                -- upvalues: calls (ref), isEqualCall (upval), u27 (val), matcherHint (upval), a1 (upval), u50 (ref)
                -- upvalues: u28 (val), printExpectedArgs (upval), stringify (upval), printReceivedCallsNegative (upval)
                -- upvalues: printReceived (upval)
                local v1 = {}
                local v2 = 1
                while v2 <= #calls do
                    if not (#v1 < 3) then
                        break
                    end
                    if isEqualCall(u27, calls[v2]) then
                        table.insert(v1, {v2, calls[v2]})
                    end
                    v2 = v2 + 1
                end
                local v3 = (matcherHint(a1, u50, "...expected", u28)) .. "\n\n" .. ("Expected: never %s\n"):format((printExpectedArgs(u27)))
                if #calls ~= 1 or (stringify(calls[1])) ~= stringify(u27) then
                    local v4 = printReceivedCallsNegative
                    v3 = v3 .. v4(u27, v1, #calls == 1)
                end
                return v3 .. ("\nNumber of calls: %s"):format((printReceived(#calls)))
            end,
            pass = v3,
        }
    end
end

local function createToReturnWithMatcher(a1) -- Line: 729
    -- upvalues: ensureMock (ref), Array (val), isEqualReturn (ref), matcherHint (val), printExpected (val)
    -- upvalues: stringify (val), printReceivedResults (ref), printNumberOfReturns (ref), countReturns (ref)
    return function(a1_2, a2, a3) -- Line: 730
        -- upvalues: ensureMock (upval), a1 (val), Array (upval), isEqualReturn (upval), matcherHint (upval)
        -- upvalues: printExpected (upval), stringify (upval), printReceivedResults (upval)
        -- upvalues: printNumberOfReturns (upval), countReturns (upval)
        local u3 = {isNot = a1_2.isNot, promise = a1_2.promise}
        ensureMock(a2, a1, "expected", u3)
        local u13 = a2.getMockName()
        local mock = a2.mock
        local calls = mock.calls
        local results = mock.results
        local v1 = Array.some(results, function(a1) -- Line: 743 -- upvalues: isEqualReturn (upval), a3 (val)
            return isEqualReturn(a3, a1)
        end)
        return {
            message = if not v1 then function() -- Line: 779
                -- upvalues: results (val), matcherHint (upval), a1 (upval), u13 (val), u3 (val), printExpected (upval)
                -- upvalues: a3 (val), printReceivedResults (upval), printNumberOfReturns (upval), countReturns (upval)
                -- upvalues: calls (val)
                local v1 = {}
                local v2 = 1
                while v2 <= #results do
                    if not (#v1 < 3) then
                        break
                    end
                    table.insert(v1, {v2, results[v2]})
                    v2 = v2 + 1
                end
                return (matcherHint(a1, u13, "expected", u3)) .. "\n\n" .. (("Expected: %s\n"):format((printExpected(a3)))) .. (printReceivedResults("Received: ", a3, v1, #results == 1)) .. printNumberOfReturns(countReturns(results), #calls)
            end else function() -- Line: 749
                -- upvalues: results (val), isEqualReturn (upval), a3 (val), matcherHint (upval), a1 (upval), u13 (val)
                -- upvalues: u3 (val), printExpected (upval), stringify (upval), printReceivedResults (upval)
                -- upvalues: printNumberOfReturns (upval), countReturns (upval), calls (val)
                local v1 = {}
                local v2 = 1
                while v2 <= #results do
                    if not (#v1 < 3) then
                        break
                    end
                    if isEqualReturn(a3, results[v2]) then
                        table.insert(v1, {v2, results[v2]})
                    end
                    v2 = v2 + 1
                end
                local v3 = (matcherHint(a1, u13, "expected", u3)) .. "\n\n" .. ("Expected: never %s\n"):format((printExpected(a3)))
                if #results ~= 1 or results[1].type ~= "return" or (stringify(results[1].value)) ~= stringify(a3) then
                    local v4 = printReceivedResults
                    v3 = v3 .. v4("Received:       ", a3, v1, #results == 1)
                end
                return v3 .. printNumberOfReturns(countReturns(results), #calls)
            end,
            pass = v1,
        }
    end
end

local function createLastCalledWithMatcher(a1) -- Line: 800
    -- upvalues: Symbol (val), ensureMockOrSpy (ref), isSpy (ref), Array (val), isEqualCall (ref), matcherHint (val)
    -- upvalues: printExpectedArgs (ref), stringify (val), printReceivedCallsNegative (ref), printReceived (val)
    -- upvalues: printExpectedReceivedCallsPositive (ref), isExpand (ref)
    return function(a1_2, a2, ...) -- Line: 801
        -- upvalues: Symbol (upval), ensureMockOrSpy (upval), a1 (val), isSpy (upval), Array (upval)
        -- upvalues: isEqualCall (upval), matcherHint (upval), printExpectedArgs (upval), stringify (upval)
        -- upvalues: printReceivedCallsNegative (upval), printReceived (upval)
        -- upvalues: printExpectedReceivedCallsPositive (upval), isExpand (upval)
        local u27 = {}
        u27[1] = ...
        for i = 1, (select("#", ...)) do
            if u27[i] == nil then
                u27[i] = (Symbol.for_("$$nil"))
            end
        end
        local u28 = {isNot = a1_2.isNot, promise = a1_2.promise}
        ensureMockOrSpy(a2, a1, "...expected", u28)
        local v1 = isSpy(a2)
        local u50 = if not v1 then a2.getMockName() else "spy"
        local calls = if not v1 then a2.mock.calls else Array.map(a2.calls:all(), function(a1) -- Line: 829
            return a1.args
        end)
        local u66 = #calls
        local v2 = false
        if u66 >= 1 then
            v2 = isEqualCall(u27, calls[u66])
        end
        return {
            message = if not v2 then function() -- Line: 864
                -- upvalues: u66 (val), isEqualCall (upval), u27 (val), calls (ref), matcherHint (upval), a1 (upval)
                -- upvalues: u50 (ref), u28 (val), printExpectedReceivedCallsPositive (upval), isExpand (upval)
                -- upvalues: a1_2 (val), printReceived (upval)
                local v1 = {}
                if u66 >= 1 then
                    if u66 > 1 then
                        local v2 = u66 - 1
                        while v2 >= 1 do
                            if isEqualCall(u27, calls[v2]) then
                                break
                            end
                            v2 = v2 - 1
                        end
                        if v2 < 1 then
                            v2 = u66 - 1
                        end
                        table.insert(v1, {v2, calls[v2]})
                    end
                    table.insert(v1, {u66, calls[u66]})
                end
                return (matcherHint(a1, u50, "...expected", u28)) .. "\n\n" .. (printExpectedReceivedCallsPositive(u27, v1, isExpand(a1_2.expand), #calls == 1, u66)) .. ("\nNumber of calls: %s"):format((printReceived(#calls)))
            end else function() -- Line: 842
                -- upvalues: u66 (val), calls (ref), matcherHint (upval), a1 (upval), u50 (ref), u28 (val)
                -- upvalues: printExpectedArgs (upval), u27 (val), stringify (upval), printReceivedCallsNegative (upval)
                -- upvalues: printReceived (upval)
                local v1 = {}
                if u66 > 1 then
                    table.insert(v1, {u66 - 1, calls[u66 - 1]})
                end
                local v2 = {u66, calls[u66]}
                table.insert(v1, v2)
                local v3 = (matcherHint(a1, u50, "...expected", u28)) .. "\n\n" .. ("Expected: never %s\n"):format((printExpectedArgs(u27)))
                if #calls ~= 1 or (stringify(calls[1])) ~= stringify(u27) then
                    v2 = printReceivedCallsNegative
                    v3 = v3 .. v2(u27, v1, #calls == 1, u66)
                end
                return v3 .. ("\nNumber of calls: %s"):format((printReceived(#calls)))
            end,
            pass = v2,
        }
    end
end

local function createLastReturnedMatcher(a1) -- Line: 900
    -- upvalues: ensureMock (ref), isEqualReturn (ref), matcherHint (val), printExpected (val), stringify (val)
    -- upvalues: printReceivedResults (ref), printNumberOfReturns (ref), countReturns (ref)
    return function(a1_2, a2, a3) -- Line: 901
        -- upvalues: ensureMock (upval), a1 (val), isEqualReturn (upval), matcherHint (upval), printExpected (upval)
        -- upvalues: stringify (upval), printReceivedResults (upval), printNumberOfReturns (upval), countReturns (upval)
        local u3 = {isNot = a1_2.isNot, promise = a1_2.promise}
        ensureMock(a2, a1, "expected", u3)
        local u13 = a2.getMockName()
        local mock = a2.mock
        local calls = mock.calls
        local results = mock.results
        local u17 = #results
        local v1 = false
        if u17 >= 1 then
            v1 = isEqualReturn(a3, results[u17])
        end
        return {
            message = if not v1 then function() -- Line: 950
                -- upvalues: u17 (val), isEqualReturn (upval), a3 (val), results (val), matcherHint (upval), a1 (upval)
                -- upvalues: u13 (val), u3 (val), printExpected (upval), printReceivedResults (upval)
                -- upvalues: printNumberOfReturns (upval), countReturns (upval), calls (val)
                local v1 = {}
                if u17 >= 1 then
                    if u17 > 1 then
                        local v2 = u17 - 1
                        while v2 >= 1 do
                            if isEqualReturn(a3, results[v2]) then
                                break
                            end
                            v2 = v2 - 1
                        end
                        if v2 < 1 then
                            v2 = u17 - 1
                        end
                        table.insert(v1, {v2, results[v2]})
                    end
                    table.insert(v1, {u17, results[u17]})
                end
                return (matcherHint(a1, u13, "expected", u3)) .. "\n\n" .. (("Expected: %s\n"):format((printExpected(a3)))) .. (printReceivedResults("Received: ", a3, v1, #results == 1, u17)) .. printNumberOfReturns(countReturns(results), #calls)
            end else function() -- Line: 921
                -- upvalues: u17 (val), results (val), matcherHint (upval), a1 (upval), u13 (val), u3 (val)
                -- upvalues: printExpected (upval), a3 (val), stringify (upval), printReceivedResults (upval)
                -- upvalues: printNumberOfReturns (upval), countReturns (upval), calls (val)
                local v1 = {}
                if u17 > 1 then
                    table.insert(v1, {u17 - 1, results[u17 - 1]})
                end
                local v2 = {u17, results[u17]}
                table.insert(v1, v2)
                local v3 = (matcherHint(a1, u13, "expected", u3)) .. "\n\n" .. ("Expected: never %s\n"):format((printExpected(a3)))
                if #results ~= 1 or results[1].type ~= "return" or (stringify(results[1].value)) ~= stringify(a3) then
                    v2 = printReceivedResults
                    v3 = v3 .. v2("Received:       ", a3, v1, #results == 1, u17)
                end
                return v3 .. printNumberOfReturns(countReturns(results), #calls)
            end,
            pass = v1,
        }
    end
end

local function createNthCalledWithMatcher(a1) -- Line: 983
    -- upvalues: Symbol (val), ensureMockOrSpy (ref), Number (val), Error (val), matcherErrorMessage (val)
    -- upvalues: matcherHint (val), printWithType (val), stringify (val), isSpy (ref), Array (val), isEqualCall (ref)
    -- upvalues: printExpectedArgs (ref), printReceivedCallsNegative (ref), printReceived (val)
    -- upvalues: printExpectedReceivedCallsPositive (ref), isExpand (ref)
    return function(a1_2, a2, a3, ...) -- Line: 984
        -- upvalues: Symbol (upval), ensureMockOrSpy (upval), a1 (val), Number (upval), Error (upval)
        -- upvalues: matcherErrorMessage (upval), matcherHint (upval), printWithType (upval), stringify (upval)
        -- upvalues: isSpy (upval), Array (upval), isEqualCall (upval), printExpectedArgs (upval)
        -- upvalues: printReceivedCallsNegative (upval), printReceived (upval)
        -- upvalues: printExpectedReceivedCallsPositive (upval), isExpand (upval)
        local u28 = {}
        u28[1] = ...
        for i = 1, (select("#", ...)) do
            if u28[i] == nil then
                u28[i] = (Symbol.for_("$$nil"))
            end
        end
        local u29 = {secondArgument = "...expected"}

        function u29.expectedColor(a1) -- Line: 996
            return a1
        end

        u29.isNot = a1_2.isNot
        u29.promise = a1_2.promise
        ensureMockOrSpy(a2, a1, "n", u29)
        if not Number.isSafeInteger(a3) or a3 < 1 then
            error(Error(matcherErrorMessage(
                matcherHint(a1, nil, "n", u29),
                ("%s must be a positive integer"):format("n"),
                printWithType("n", a3, stringify)
            )))
        end
        local v1 = isSpy(a2)
        local u86 = if not v1 then a2.getMockName() else "spy"
        local calls = if not v1 then a2.mock.calls else Array.map(a2.calls:all(), function(a1) -- Line: 1029
            return a1.args
        end)
        local u102 = #calls
        local v2 = false
        if a3 <= u102 then
            v2 = isEqualCall(u28, calls[a3])
        end
        return {
            message = if not v2 then function() -- Line: 1070
                -- upvalues: a3 (val), u102 (val), isEqualCall (upval), u28 (val), calls (ref), matcherHint (upval)
                -- upvalues: a1 (upval), u86 (ref), u29 (val), a3 (val), printExpectedReceivedCallsPositive (upval)
                -- upvalues: isExpand (upval), a1_2 (val), printReceived (upval)
                local v1
                local v2 = {}
                if a3 <= u102 then
                    v1 = a3 - 1
                    if v1 >= 1 then
                        v1 = a3 - 1
                        while v1 >= 1 do
                            if isEqualCall(u28, calls[v1]) then
                                break
                            end
                            v1 = v1 - 1
                        end
                        if v1 < 1 then
                            v1 = a3 - 1
                        end
                        table.insert(v2, {v1, calls[v1]})
                    end
                    table.insert(v2, {a3, calls[a3]})
                    v1 = a3 + 1
                    if v1 <= u102 then
                        v1 = a3 + 1
                        while v1 <= u102 do
                            if isEqualCall(u28, calls[v1]) then
                                break
                            end
                            v1 = v1 + 1
                        end
                        if u102 <= v1 then
                            v1 = a3 + 1
                        end
                        table.insert(v2, {v1, calls[v1]})
                    end
                elseif u102 > 1 then
                    v1 = u102 - 1
                    while v1 >= 1 do
                        if isEqualCall(u28, calls[v1]) then
                            break
                        end
                        v1 = v1 - 1
                    end
                    if v1 < 1 then
                        v1 = u102 - 1
                    end
                    table.insert(v2, {v1, calls[v1]})
                end
                return (matcherHint(a1, u86, "n", u29)) .. "\n\n" .. (("n: %s\n"):format((tostring(a3)))) .. (printExpectedReceivedCallsPositive(u28, v2, isExpand(a1_2.expand), #calls == 1, a3)) .. ("\nNumber of calls: %s"):format((printReceived(#calls)))
            end else function() -- Line: 1042
                -- upvalues: a3 (val), calls (ref), u102 (val), matcherHint (upval), a1 (upval), u86 (ref), u29 (val)
                -- upvalues: a3 (val), printExpectedArgs (upval), u28 (val), stringify (upval)
                -- upvalues: printReceivedCallsNegative (upval), printReceived (upval)
                local v1 = {}
                if 1 <= a3 - 1 then
                    table.insert(v1, {a3 - 1, calls[a3 - 1]})
                end
                local v2 = {a3, calls[a3]}
                table.insert(v1, v2)
                if a3 + 1 <= u102 then
                    table.insert(v1, {a3 + 1, calls[a3 + 1]})
                end
                local v3 = (matcherHint(a1, u86, "n", u29)) .. "\n\n" .. (("n: %s\n"):format((tostring(a3)))) .. ("Expected: never %s\n"):format((printExpectedArgs(u28)))
                if #calls ~= 1 or (stringify(calls[1])) ~= stringify(u28) then
                    v2 = printReceivedCallsNegative
                    v3 = v3 .. v2(u28, v1, #calls == 1, a3)
                end
                return v3 .. ("\nNumber of calls: %s"):format((printReceived(#calls)))
            end,
            pass = v2,
        }
    end
end

local function createNthReturnedWithMatcher(a1) -- Line: 1139
    -- upvalues: ensureMock (ref), Number (val), Error (val), matcherErrorMessage (val), matcherHint (val)
    -- upvalues: printWithType (val), stringify (val), isEqualReturn (ref), printExpected (val)
    -- upvalues: printReceivedResults (ref), printNumberOfReturns (ref), countReturns (ref)
    return function(a1_2, a2, a3, a4) -- Line: 1140
        -- upvalues: ensureMock (upval), a1 (val), Number (upval), Error (upval), matcherErrorMessage (upval)
        -- upvalues: matcherHint (upval), printWithType (upval), stringify (upval), isEqualReturn (upval)
        -- upvalues: printExpected (upval), printReceivedResults (upval), printNumberOfReturns (upval)
        -- upvalues: countReturns (upval)
        local u4 = {secondArgument = "expected"}

        function u4.expectedColor(a1) -- Line: 1143
            return a1
        end

        u4.isNot = a1_2.isNot
        u4.promise = a1_2.promise
        ensureMock(a2, a1, "n", u4)
        if not Number.isSafeInteger(a3) or a3 < 1 then
            error(Error(matcherErrorMessage(
                matcherHint(a1, nil, "n", u4),
                ("%s must be a positive integer"):format("n"),
                printWithType("n", a3, stringify)
            )))
        end
        local u46 = a2.getMockName()
        local mock = a2.mock
        local calls = mock.calls
        local results = mock.results
        local u50 = #results
        local v1 = false
        if a3 <= u50 then
            v1 = isEqualReturn(a4, results[a3])
        end
        return {
            message = if not v1 then function() -- Line: 1209
                -- upvalues: a3 (val), u50 (val), isEqualReturn (upval), a4 (val), results (val), matcherHint (upval)
                -- upvalues: a1 (upval), u46 (val), u4 (val), a3 (val), printExpected (upval)
                -- upvalues: printReceivedResults (upval), printNumberOfReturns (upval), countReturns (upval)
                -- upvalues: calls (val)
                local v1
                local v2 = {}
                if a3 <= u50 then
                    v1 = a3 - 1
                    if v1 >= 1 then
                        v1 = a3 - 1
                        while v1 >= 1 do
                            if isEqualReturn(a4, results[v1]) then
                                break
                            end
                            v1 = v1 - 1
                        end
                        if v1 < 1 then
                            v1 = a3 - 1
                        end
                        table.insert(v2, {v1, results[v1]})
                    end
                    table.insert(v2, {a3, results[a3]})
                    v1 = a3 + 1
                    if v1 <= u50 then
                        v1 = a3 + 1
                        while v1 <= u50 do
                            if isEqualReturn(a4, results[v1]) then
                                break
                            end
                            v1 = v1 + 1
                        end
                        if u50 < v1 then
                            v1 = a3 + 1
                        end
                        table.insert(v2, {v1, results[v1]})
                    end
                elseif u50 > 0 then
                    v1 = u50
                    while v1 >= 1 do
                        if isEqualReturn(a4, results[v1]) then
                            break
                        end
                        v1 = v1 - 1
                    end
                    if v1 < 1 then
                        v1 = u50 - 1
                    end
                    table.insert(v2, {v1, results[v1]})
                end
                return (matcherHint(a1, u46, "n", u4)) .. "\n\n" .. (("n: %s\n"):format((tostring(a3)))) .. (("Expected: %s\n"):format((printExpected(a4)))) .. (printReceivedResults("Received: ", a4, v2, #results == 1, a3)) .. printNumberOfReturns(countReturns(results), #calls)
            end else function() -- Line: 1177
                -- upvalues: a3 (val), results (val), u50 (val), matcherHint (upval), a1 (upval), u46 (val), u4 (val)
                -- upvalues: a3 (val), printExpected (upval), a4 (val), stringify (upval), printReceivedResults (upval)
                -- upvalues: printNumberOfReturns (upval), countReturns (upval), calls (val)
                local v1 = {}
                if 1 <= a3 - 1 then
                    table.insert(v1, {a3 - 1, results[a3 - 1]})
                end
                local v2 = {a3, results[a3]}
                table.insert(v1, v2)
                if a3 + 1 <= u50 then
                    table.insert(v1, {a3 + 1, results[a3 + 1]})
                end
                local v3 = (matcherHint(a1, u46, "n", u4)) .. "\n\n" .. (("n: %s\n"):format((tostring(a3)))) .. ("Expected: never %s\n"):format((printExpected(a4)))
                if #results ~= 1 or results[1].type ~= "return" or (stringify(results[1].value)) ~= stringify(a4) then
                    v2 = printReceivedResults
                    v3 = v3 .. v2("Received:       ", a4, v1, #results == 1, a3)
                end
                return v3 .. printNumberOfReturns(countReturns(results), #calls)
            end,
            pass = v1,
        }
    end
end

local v3 = {}
local u127 = "lastCalledWith"

function v3.lastCalledWith(a1, a2, ...) -- Line: 801
    -- upvalues: Symbol (val), ensureMockOrSpy (ref), u127 (val), isSpy (ref), Array (val), isEqualCall (ref)
    -- upvalues: matcherHint (val), printExpectedArgs (ref), stringify (val), printReceivedCallsNegative (ref)
    -- upvalues: printReceived (val), printExpectedReceivedCallsPositive (ref), isExpand (ref)
    local u27 = {}
    u27[1] = ...
    for i = 1, (select("#", ...)) do
        if u27[i] == nil then
            u27[i] = (Symbol.for_("$$nil"))
        end
    end
    local u28 = {isNot = a1.isNot, promise = a1.promise}
    ensureMockOrSpy(a2, u127, "...expected", u28)
    local v1 = isSpy(a2)
    local u50 = if not v1 then a2.getMockName() else "spy"
    local calls = if not v1 then a2.mock.calls else Array.map(a2.calls:all(), function(a1) -- Line: 829
        return a1.args
    end)
    local u66 = #calls
    local v2 = false
    if u66 >= 1 then
        v2 = isEqualCall(u27, calls[u66])
    end
    return {
        message = if not v2 then function() -- Line: 864
            -- upvalues: u66 (val), isEqualCall (upval), u27 (val), calls (ref), matcherHint (upval), u127 (upval)
            -- upvalues: u50 (ref), u28 (val), printExpectedReceivedCallsPositive (upval), isExpand (upval), a1 (val)
            -- upvalues: printReceived (upval)
            local v1 = {}
            if u66 >= 1 then
                if u66 > 1 then
                    local v2 = u66 - 1
                    while v2 >= 1 do
                        if isEqualCall(u27, calls[v2]) then
                            break
                        end
                        v2 = v2 - 1
                    end
                    if v2 < 1 then
                        v2 = u66 - 1
                    end
                    table.insert(v1, {v2, calls[v2]})
                end
                table.insert(v1, {u66, calls[u66]})
            end
            return (matcherHint(u127, u50, "...expected", u28)) .. "\n\n" .. (printExpectedReceivedCallsPositive(u27, v1, isExpand(a1.expand), #calls == 1, u66)) .. ("\nNumber of calls: %s"):format((printReceived(#calls)))
        end else function() -- Line: 842
            -- upvalues: u66 (val), calls (ref), matcherHint (upval), u127 (upval), u50 (ref), u28 (val)
            -- upvalues: printExpectedArgs (upval), u27 (val), stringify (upval), printReceivedCallsNegative (upval)
            -- upvalues: printReceived (upval)
            local v1 = {}
            if u66 > 1 then
                table.insert(v1, {u66 - 1, calls[u66 - 1]})
            end
            local v2 = {u66, calls[u66]}
            table.insert(v1, v2)
            local v3 = (matcherHint(u127, u50, "...expected", u28)) .. "\n\n" .. ("Expected: never %s\n"):format((printExpectedArgs(u27)))
            if #calls ~= 1 or (stringify(calls[1])) ~= stringify(u27) then
                v2 = printReceivedCallsNegative
                v3 = v3 .. v2(u27, v1, #calls == 1, u66)
            end
            return v3 .. ("\nNumber of calls: %s"):format((printReceived(#calls)))
        end,
        pass = v2,
    }
end

local u129 = "lastReturnedWith"

function v3.lastReturnedWith(a1, a2, a3) -- Line: 901
    -- upvalues: ensureMock (ref), u129 (val), isEqualReturn (ref), matcherHint (val), printExpected (val)
    -- upvalues: stringify (val), printReceivedResults (ref), printNumberOfReturns (ref), countReturns (ref)
    local u3 = {isNot = a1.isNot, promise = a1.promise}
    ensureMock(a2, u129, "expected", u3)
    local u13 = a2.getMockName()
    local mock = a2.mock
    local calls = mock.calls
    local results = mock.results
    local u17 = #results
    local v1 = false
    if u17 >= 1 then
        v1 = isEqualReturn(a3, results[u17])
    end
    return {
        message = if not v1 then function() -- Line: 950
            -- upvalues: u17 (val), isEqualReturn (upval), a3 (val), results (val), matcherHint (upval), u129 (upval)
            -- upvalues: u13 (val), u3 (val), printExpected (upval), printReceivedResults (upval)
            -- upvalues: printNumberOfReturns (upval), countReturns (upval), calls (val)
            local v1 = {}
            if u17 >= 1 then
                if u17 > 1 then
                    local v2 = u17 - 1
                    while v2 >= 1 do
                        if isEqualReturn(a3, results[v2]) then
                            break
                        end
                        v2 = v2 - 1
                    end
                    if v2 < 1 then
                        v2 = u17 - 1
                    end
                    table.insert(v1, {v2, results[v2]})
                end
                table.insert(v1, {u17, results[u17]})
            end
            return (matcherHint(u129, u13, "expected", u3)) .. "\n\n" .. (("Expected: %s\n"):format((printExpected(a3)))) .. (printReceivedResults("Received: ", a3, v1, #results == 1, u17)) .. printNumberOfReturns(countReturns(results), #calls)
        end else function() -- Line: 921
            -- upvalues: u17 (val), results (val), matcherHint (upval), u129 (upval), u13 (val), u3 (val)
            -- upvalues: printExpected (upval), a3 (val), stringify (upval), printReceivedResults (upval)
            -- upvalues: printNumberOfReturns (upval), countReturns (upval), calls (val)
            local v1 = {}
            if u17 > 1 then
                table.insert(v1, {u17 - 1, results[u17 - 1]})
            end
            local v2 = {u17, results[u17]}
            table.insert(v1, v2)
            local v3 = (matcherHint(u129, u13, "expected", u3)) .. "\n\n" .. ("Expected: never %s\n"):format((printExpected(a3)))
            if #results ~= 1 or results[1].type ~= "return" or (stringify(results[1].value)) ~= stringify(a3) then
                v2 = printReceivedResults
                v3 = v3 .. v2("Received:       ", a3, v1, #results == 1, u17)
            end
            return v3 .. printNumberOfReturns(countReturns(results), #calls)
        end,
        pass = v1,
    }
end

local u131 = "nthCalledWith"

function v3.nthCalledWith(a1, a2, a3, ...) -- Line: 984
    -- upvalues: Symbol (val), ensureMockOrSpy (ref), u131 (val), Number (val), Error (val), matcherErrorMessage (val)
    -- upvalues: matcherHint (val), printWithType (val), stringify (val), isSpy (ref), Array (val), isEqualCall (ref)
    -- upvalues: printExpectedArgs (ref), printReceivedCallsNegative (ref), printReceived (val)
    -- upvalues: printExpectedReceivedCallsPositive (ref), isExpand (ref)
    local u28 = {}
    u28[1] = ...
    for i = 1, (select("#", ...)) do
        if u28[i] == nil then
            u28[i] = (Symbol.for_("$$nil"))
        end
    end
    local u29 = {secondArgument = "...expected"}

    function u29.expectedColor(a1) -- Line: 996
        return a1
    end

    u29.isNot = a1.isNot
    u29.promise = a1.promise
    ensureMockOrSpy(a2, u131, "n", u29)
    if not Number.isSafeInteger(a3) or a3 < 1 then
        error(Error(matcherErrorMessage(
            matcherHint(u131, nil, "n", u29),
            ("%s must be a positive integer"):format("n"),
            printWithType("n", a3, stringify)
        )))
    end
    local v1 = isSpy(a2)
    local u86 = if not v1 then a2.getMockName() else "spy"
    local calls = if not v1 then a2.mock.calls else Array.map(a2.calls:all(), function(a1) -- Line: 1029
        return a1.args
    end)
    local u102 = #calls
    local v2 = false
    if a3 <= u102 then
        v2 = isEqualCall(u28, calls[a3])
    end
    return {
        message = if not v2 then function() -- Line: 1070
            -- upvalues: a3 (val), u102 (val), isEqualCall (upval), u28 (val), calls (ref), matcherHint (upval)
            -- upvalues: u131 (upval), u86 (ref), u29 (val), a3 (val), printExpectedReceivedCallsPositive (upval)
            -- upvalues: isExpand (upval), a1 (val), printReceived (upval)
            local v1
            local v2 = {}
            if a3 <= u102 then
                v1 = a3 - 1
                if v1 >= 1 then
                    v1 = a3 - 1
                    while v1 >= 1 do
                        if isEqualCall(u28, calls[v1]) then
                            break
                        end
                        v1 = v1 - 1
                    end
                    if v1 < 1 then
                        v1 = a3 - 1
                    end
                    table.insert(v2, {v1, calls[v1]})
                end
                table.insert(v2, {a3, calls[a3]})
                v1 = a3 + 1
                if v1 <= u102 then
                    v1 = a3 + 1
                    while v1 <= u102 do
                        if isEqualCall(u28, calls[v1]) then
                            break
                        end
                        v1 = v1 + 1
                    end
                    if u102 <= v1 then
                        v1 = a3 + 1
                    end
                    table.insert(v2, {v1, calls[v1]})
                end
            elseif u102 > 1 then
                v1 = u102 - 1
                while v1 >= 1 do
                    if isEqualCall(u28, calls[v1]) then
                        break
                    end
                    v1 = v1 - 1
                end
                if v1 < 1 then
                    v1 = u102 - 1
                end
                table.insert(v2, {v1, calls[v1]})
            end
            return (matcherHint(u131, u86, "n", u29)) .. "\n\n" .. (("n: %s\n"):format((tostring(a3)))) .. (printExpectedReceivedCallsPositive(u28, v2, isExpand(a1.expand), #calls == 1, a3)) .. ("\nNumber of calls: %s"):format((printReceived(#calls)))
        end else function() -- Line: 1042
            -- upvalues: a3 (val), calls (ref), u102 (val), matcherHint (upval), u131 (upval), u86 (ref), u29 (val)
            -- upvalues: a3 (val), printExpectedArgs (upval), u28 (val), stringify (upval)
            -- upvalues: printReceivedCallsNegative (upval), printReceived (upval)
            local v1 = {}
            if 1 <= a3 - 1 then
                table.insert(v1, {a3 - 1, calls[a3 - 1]})
            end
            local v2 = {a3, calls[a3]}
            table.insert(v1, v2)
            if a3 + 1 <= u102 then
                table.insert(v1, {a3 + 1, calls[a3 + 1]})
            end
            local v3 = (matcherHint(u131, u86, "n", u29)) .. "\n\n" .. (("n: %s\n"):format((tostring(a3)))) .. ("Expected: never %s\n"):format((printExpectedArgs(u28)))
            if #calls ~= 1 or (stringify(calls[1])) ~= stringify(u28) then
                v2 = printReceivedCallsNegative
                v3 = v3 .. v2(u28, v1, #calls == 1, a3)
            end
            return v3 .. ("\nNumber of calls: %s"):format((printReceived(#calls)))
        end,
        pass = v2,
    }
end

local u133 = "nthReturnedWith"

function v3.nthReturnedWith(a1, a2, a3, a4) -- Line: 1140
    -- upvalues: ensureMock (ref), u133 (val), Number (val), Error (val), matcherErrorMessage (val), matcherHint (val)
    -- upvalues: printWithType (val), stringify (val), isEqualReturn (ref), printExpected (val)
    -- upvalues: printReceivedResults (ref), printNumberOfReturns (ref), countReturns (ref)
    local u4 = {secondArgument = "expected"}

    function u4.expectedColor(a1) -- Line: 1143
        return a1
    end

    u4.isNot = a1.isNot
    u4.promise = a1.promise
    ensureMock(a2, u133, "n", u4)
    if not Number.isSafeInteger(a3) or a3 < 1 then
        error(Error(matcherErrorMessage(
            matcherHint(u133, nil, "n", u4),
            ("%s must be a positive integer"):format("n"),
            printWithType("n", a3, stringify)
        )))
    end
    local u46 = a2.getMockName()
    local mock = a2.mock
    local calls = mock.calls
    local results = mock.results
    local u50 = #results
    local v1 = false
    if a3 <= u50 then
        v1 = isEqualReturn(a4, results[a3])
    end
    return {
        message = if not v1 then function() -- Line: 1209
            -- upvalues: a3 (val), u50 (val), isEqualReturn (upval), a4 (val), results (val), matcherHint (upval)
            -- upvalues: u133 (upval), u46 (val), u4 (val), a3 (val), printExpected (upval)
            -- upvalues: printReceivedResults (upval), printNumberOfReturns (upval), countReturns (upval), calls (val)
            local v1
            local v2 = {}
            if a3 <= u50 then
                v1 = a3 - 1
                if v1 >= 1 then
                    v1 = a3 - 1
                    while v1 >= 1 do
                        if isEqualReturn(a4, results[v1]) then
                            break
                        end
                        v1 = v1 - 1
                    end
                    if v1 < 1 then
                        v1 = a3 - 1
                    end
                    table.insert(v2, {v1, results[v1]})
                end
                table.insert(v2, {a3, results[a3]})
                v1 = a3 + 1
                if v1 <= u50 then
                    v1 = a3 + 1
                    while v1 <= u50 do
                        if isEqualReturn(a4, results[v1]) then
                            break
                        end
                        v1 = v1 + 1
                    end
                    if u50 < v1 then
                        v1 = a3 + 1
                    end
                    table.insert(v2, {v1, results[v1]})
                end
            elseif u50 > 0 then
                v1 = u50
                while v1 >= 1 do
                    if isEqualReturn(a4, results[v1]) then
                        break
                    end
                    v1 = v1 - 1
                end
                if v1 < 1 then
                    v1 = u50 - 1
                end
                table.insert(v2, {v1, results[v1]})
            end
            return (matcherHint(u133, u46, "n", u4)) .. "\n\n" .. (("n: %s\n"):format((tostring(a3)))) .. (("Expected: %s\n"):format((printExpected(a4)))) .. (printReceivedResults("Received: ", a4, v2, #results == 1, a3)) .. printNumberOfReturns(countReturns(results), #calls)
        end else function() -- Line: 1177
            -- upvalues: a3 (val), results (val), u50 (val), matcherHint (upval), u133 (upval), u46 (val), u4 (val)
            -- upvalues: a3 (val), printExpected (upval), a4 (val), stringify (upval), printReceivedResults (upval)
            -- upvalues: printNumberOfReturns (upval), countReturns (upval), calls (val)
            local v1 = {}
            if 1 <= a3 - 1 then
                table.insert(v1, {a3 - 1, results[a3 - 1]})
            end
            local v2 = {a3, results[a3]}
            table.insert(v1, v2)
            if a3 + 1 <= u50 then
                table.insert(v1, {a3 + 1, results[a3 + 1]})
            end
            local v3 = (matcherHint(u133, u46, "n", u4)) .. "\n\n" .. (("n: %s\n"):format((tostring(a3)))) .. ("Expected: never %s\n"):format((printExpected(a4)))
            if #results ~= 1 or results[1].type ~= "return" or (stringify(results[1].value)) ~= stringify(a4) then
                v2 = printReceivedResults
                v3 = v3 .. v2("Received:       ", a4, v1, #results == 1, a3)
            end
            return v3 .. printNumberOfReturns(countReturns(results), #calls)
        end,
        pass = v1,
    }
end

local u135 = "toBeCalled"

function v3.toBeCalled(a1, a2, a3) -- Line: 408
    -- upvalues: ensureNoExpected (val), u135 (val), ensureMockOrSpy (ref), isSpy (ref), Array (val), matcherHint (val)
    -- upvalues: printExpected (val), printReceived (val), printReceivedArgs (ref)
    local v1
    local u3 = {isNot = a1.isNot, promise = a1.promise}
    ensureNoExpected(a3, u135, u3)
    ensureMockOrSpy(a2, u135, "", u3)
    local v2 = isSpy(a2)
    local u24 = if not v2 then a2.getMockName() else "spy"
    local u35 = if not v2 then #a2.mock.calls else a2.calls:count()
    local calls = if not v2 then a2.mock.calls else Array.map(a2.calls:all(), function(a1) -- Line: 435
        return a1.args
    end)
    return {
        message = if not (u35 > 0) then function() -- Line: 462
            -- upvalues: matcherHint (upval), u135 (upval), u24 (ref), u3 (val), printExpected (upval)
            -- upvalues: printReceived (upval), u35 (ref)
            return (matcherHint(u135, u24, "", u3)) .. "\n\n" .. (("Expected number of calls: >= %s\n"):format((printExpected(1)))) .. ("Received number of calls:    %s"):format((printReceived(u35)))
        end else function() -- Line: 445
            -- upvalues: matcherHint (upval), u135 (upval), u24 (ref), u3 (val), printExpected (upval)
            -- upvalues: printReceived (upval), u35 (ref), Array (upval), calls (ref), printReceivedArgs (upval)
            local v1 = matcherHint(u135, u24, "", u3)
            local v2 = ("Expected number of calls: %s\n"):format((printExpected(0)))
            local v3 = ("Received number of calls: %s\n\n"):format((printReceived(u35)))
            local v4 = calls
            return v1 .. "\n\n" .. v2 .. v3 .. Array.join(Array.reduce(v4, function(a1, a2, a3) -- Line: 451 -- upvalues: printReceivedArgs (upval) -- types: a3: number
                if #a1 < 3 then
                    table.insert(a1, (("%s: %s"):format(tostring(a3), (printReceivedArgs(a2)))))
                end
                return a1
            end, {}), "\n")
        end,
        pass = v1,
    }
end

local u137 = "toBeCalledTimes"

function v3.toBeCalledTimes(a1, a2, a3) -- Line: 541
    -- upvalues: ensureExpectedIsNonNegativeInteger (val), u137 (val), ensureMockOrSpy (ref), isSpy (ref)
    -- upvalues: matcherHint (val), printExpected (val), printReceived (val)
    local v1
    local u3 = {isNot = a1.isNot, promise = a1.promise}
    ensureExpectedIsNonNegativeInteger(a3, u137, u3)
    ensureMockOrSpy(a2, u137, "expected", u3)
    local v2 = isSpy(a2)
    local u24 = if not v2 then a2.getMockName() else "spy"
    local u35 = if not v2 then #a2.mock.calls else a2.calls:count()
    return {
        message = if not (u35 == a3) then function() -- Line: 576
            -- upvalues: matcherHint (upval), u137 (upval), u24 (ref), u3 (val), printExpected (upval), a3 (val)
            -- upvalues: printReceived (upval), u35 (ref)
            return (matcherHint(u137, u24, "expected", u3)) .. "\n\n" .. (("Expected number of calls: %s\n"):format((printExpected(a3)))) .. ("Received number of calls: %s"):format((printReceived(u35)))
        end else function() -- Line: 570
            -- upvalues: matcherHint (upval), u137 (upval), u24 (ref), u3 (val), printExpected (upval), a3 (val)
            return (matcherHint(u137, u24, "expected", u3)) .. "\n\n" .. ("Expected number of calls: never %s"):format((printExpected(a3)))
        end,
        pass = v1,
    }
end

local u139 = "toBeCalledWith"

function v3.toBeCalledWith(a1, a2, ...) -- Line: 646
    -- upvalues: Symbol (val), ensureMockOrSpy (ref), u139 (val), isSpy (ref), Array (val), isEqualCall (ref)
    -- upvalues: matcherHint (val), printExpectedArgs (ref), stringify (val), printReceivedCallsNegative (ref)
    -- upvalues: printReceived (val), printExpectedReceivedCallsPositive (ref), isExpand (ref)
    local u27 = {}
    u27[1] = ...
    for i = 1, (select("#", ...)) do
        if u27[i] == nil then
            u27[i] = (Symbol.for_("$$nil"))
        end
    end
    local u28 = {isNot = a1.isNot, promise = a1.promise}
    ensureMockOrSpy(a2, u139, "...expected", u28)
    local v1 = isSpy(a2)
    local u50 = if not v1 then a2.getMockName() else "spy"
    local calls = if not v1 then a2.mock.calls else Array.map(a2.calls:all(), function(a1) -- Line: 674
        return a1.args
    end)
    local v2 = Array.some(calls, function(a1) -- Line: 681 -- upvalues: isEqualCall (upval), u27 (val)
        return isEqualCall(u27, a1)
    end)
    return {
        message = if not v2 then function() -- Line: 710
            -- upvalues: calls (ref), matcherHint (upval), u139 (upval), u50 (ref), u28 (val)
            -- upvalues: printExpectedReceivedCallsPositive (upval), u27 (val), isExpand (upval), a1 (val)
            -- upvalues: printReceived (upval)
            local v1 = {}
            local v2 = 1
            while v2 <= #calls do
                if not (#v1 < 3) then
                    break
                end
                table.insert(v1, {v2, calls[v2]})
                v2 = v2 + 1
            end
            return (matcherHint(u139, u50, "...expected", u28)) .. "\n\n" .. (printExpectedReceivedCallsPositive(u27, v1, isExpand(a1.expand), #calls == 1)) .. ("\nNumber of calls: %s"):format((printReceived(#calls)))
        end else function() -- Line: 687
            -- upvalues: calls (ref), isEqualCall (upval), u27 (val), matcherHint (upval), u139 (upval), u50 (ref)
            -- upvalues: u28 (val), printExpectedArgs (upval), stringify (upval), printReceivedCallsNegative (upval)
            -- upvalues: printReceived (upval)
            local v1 = {}
            local v2 = 1
            while v2 <= #calls do
                if not (#v1 < 3) then
                    break
                end
                if isEqualCall(u27, calls[v2]) then
                    table.insert(v1, {v2, calls[v2]})
                end
                v2 = v2 + 1
            end
            local v3 = (matcherHint(u139, u50, "...expected", u28)) .. "\n\n" .. ("Expected: never %s\n"):format((printExpectedArgs(u27)))
            if #calls ~= 1 or (stringify(calls[1])) ~= stringify(u27) then
                local v4 = printReceivedCallsNegative
                v3 = v3 .. v4(u27, v1, #calls == 1)
            end
            return v3 .. ("\nNumber of calls: %s"):format((printReceived(#calls)))
        end,
        pass = v2,
    }
end

local u141 = "toHaveBeenCalled"

function v3.toHaveBeenCalled(a1, a2, a3) -- Line: 408
    -- upvalues: ensureNoExpected (val), u141 (val), ensureMockOrSpy (ref), isSpy (ref), Array (val), matcherHint (val)
    -- upvalues: printExpected (val), printReceived (val), printReceivedArgs (ref)
    local v1
    local u3 = {isNot = a1.isNot, promise = a1.promise}
    ensureNoExpected(a3, u141, u3)
    ensureMockOrSpy(a2, u141, "", u3)
    local v2 = isSpy(a2)
    local u24 = if not v2 then a2.getMockName() else "spy"
    local u35 = if not v2 then #a2.mock.calls else a2.calls:count()
    local calls = if not v2 then a2.mock.calls else Array.map(a2.calls:all(), function(a1) -- Line: 435
        return a1.args
    end)
    return {
        message = if not (u35 > 0) then function() -- Line: 462
            -- upvalues: matcherHint (upval), u141 (upval), u24 (ref), u3 (val), printExpected (upval)
            -- upvalues: printReceived (upval), u35 (ref)
            return (matcherHint(u141, u24, "", u3)) .. "\n\n" .. (("Expected number of calls: >= %s\n"):format((printExpected(1)))) .. ("Received number of calls:    %s"):format((printReceived(u35)))
        end else function() -- Line: 445
            -- upvalues: matcherHint (upval), u141 (upval), u24 (ref), u3 (val), printExpected (upval)
            -- upvalues: printReceived (upval), u35 (ref), Array (upval), calls (ref), printReceivedArgs (upval)
            local v1 = matcherHint(u141, u24, "", u3)
            local v2 = ("Expected number of calls: %s\n"):format((printExpected(0)))
            local v3 = ("Received number of calls: %s\n\n"):format((printReceived(u35)))
            local v4 = calls
            return v1 .. "\n\n" .. v2 .. v3 .. Array.join(Array.reduce(v4, function(a1, a2, a3) -- Line: 451 -- upvalues: printReceivedArgs (upval) -- types: a3: number
                if #a1 < 3 then
                    table.insert(a1, (("%s: %s"):format(tostring(a3), (printReceivedArgs(a2)))))
                end
                return a1
            end, {}), "\n")
        end,
        pass = v1,
    }
end

local u143 = "toHaveBeenCalledTimes"

function v3.toHaveBeenCalledTimes(a1, a2, a3) -- Line: 541
    -- upvalues: ensureExpectedIsNonNegativeInteger (val), u143 (val), ensureMockOrSpy (ref), isSpy (ref)
    -- upvalues: matcherHint (val), printExpected (val), printReceived (val)
    local v1
    local u3 = {isNot = a1.isNot, promise = a1.promise}
    ensureExpectedIsNonNegativeInteger(a3, u143, u3)
    ensureMockOrSpy(a2, u143, "expected", u3)
    local v2 = isSpy(a2)
    local u24 = if not v2 then a2.getMockName() else "spy"
    local u35 = if not v2 then #a2.mock.calls else a2.calls:count()
    return {
        message = if not (u35 == a3) then function() -- Line: 576
            -- upvalues: matcherHint (upval), u143 (upval), u24 (ref), u3 (val), printExpected (upval), a3 (val)
            -- upvalues: printReceived (upval), u35 (ref)
            return (matcherHint(u143, u24, "expected", u3)) .. "\n\n" .. (("Expected number of calls: %s\n"):format((printExpected(a3)))) .. ("Received number of calls: %s"):format((printReceived(u35)))
        end else function() -- Line: 570
            -- upvalues: matcherHint (upval), u143 (upval), u24 (ref), u3 (val), printExpected (upval), a3 (val)
            return (matcherHint(u143, u24, "expected", u3)) .. "\n\n" .. ("Expected number of calls: never %s"):format((printExpected(a3)))
        end,
        pass = v1,
    }
end

local u145 = "toHaveBeenCalledWith"

function v3.toHaveBeenCalledWith(a1, a2, ...) -- Line: 646
    -- upvalues: Symbol (val), ensureMockOrSpy (ref), u145 (val), isSpy (ref), Array (val), isEqualCall (ref)
    -- upvalues: matcherHint (val), printExpectedArgs (ref), stringify (val), printReceivedCallsNegative (ref)
    -- upvalues: printReceived (val), printExpectedReceivedCallsPositive (ref), isExpand (ref)
    local u27 = {}
    u27[1] = ...
    for i = 1, (select("#", ...)) do
        if u27[i] == nil then
            u27[i] = (Symbol.for_("$$nil"))
        end
    end
    local u28 = {isNot = a1.isNot, promise = a1.promise}
    ensureMockOrSpy(a2, u145, "...expected", u28)
    local v1 = isSpy(a2)
    local u50 = if not v1 then a2.getMockName() else "spy"
    local calls = if not v1 then a2.mock.calls else Array.map(a2.calls:all(), function(a1) -- Line: 674
        return a1.args
    end)
    local v2 = Array.some(calls, function(a1) -- Line: 681 -- upvalues: isEqualCall (upval), u27 (val)
        return isEqualCall(u27, a1)
    end)
    return {
        message = if not v2 then function() -- Line: 710
            -- upvalues: calls (ref), matcherHint (upval), u145 (upval), u50 (ref), u28 (val)
            -- upvalues: printExpectedReceivedCallsPositive (upval), u27 (val), isExpand (upval), a1 (val)
            -- upvalues: printReceived (upval)
            local v1 = {}
            local v2 = 1
            while v2 <= #calls do
                if not (#v1 < 3) then
                    break
                end
                table.insert(v1, {v2, calls[v2]})
                v2 = v2 + 1
            end
            return (matcherHint(u145, u50, "...expected", u28)) .. "\n\n" .. (printExpectedReceivedCallsPositive(u27, v1, isExpand(a1.expand), #calls == 1)) .. ("\nNumber of calls: %s"):format((printReceived(#calls)))
        end else function() -- Line: 687
            -- upvalues: calls (ref), isEqualCall (upval), u27 (val), matcherHint (upval), u145 (upval), u50 (ref)
            -- upvalues: u28 (val), printExpectedArgs (upval), stringify (upval), printReceivedCallsNegative (upval)
            -- upvalues: printReceived (upval)
            local v1 = {}
            local v2 = 1
            while v2 <= #calls do
                if not (#v1 < 3) then
                    break
                end
                if isEqualCall(u27, calls[v2]) then
                    table.insert(v1, {v2, calls[v2]})
                end
                v2 = v2 + 1
            end
            local v3 = (matcherHint(u145, u50, "...expected", u28)) .. "\n\n" .. ("Expected: never %s\n"):format((printExpectedArgs(u27)))
            if #calls ~= 1 or (stringify(calls[1])) ~= stringify(u27) then
                local v4 = printReceivedCallsNegative
                v3 = v3 .. v4(u27, v1, #calls == 1)
            end
            return v3 .. ("\nNumber of calls: %s"):format((printReceived(#calls)))
        end,
        pass = v2,
    }
end

local u147 = "toHaveBeenLastCalledWith"

function v3.toHaveBeenLastCalledWith(a1, a2, ...) -- Line: 801
    -- upvalues: Symbol (val), ensureMockOrSpy (ref), u147 (val), isSpy (ref), Array (val), isEqualCall (ref)
    -- upvalues: matcherHint (val), printExpectedArgs (ref), stringify (val), printReceivedCallsNegative (ref)
    -- upvalues: printReceived (val), printExpectedReceivedCallsPositive (ref), isExpand (ref)
    local u27 = {}
    u27[1] = ...
    for i = 1, (select("#", ...)) do
        if u27[i] == nil then
            u27[i] = (Symbol.for_("$$nil"))
        end
    end
    local u28 = {isNot = a1.isNot, promise = a1.promise}
    ensureMockOrSpy(a2, u147, "...expected", u28)
    local v1 = isSpy(a2)
    local u50 = if not v1 then a2.getMockName() else "spy"
    local calls = if not v1 then a2.mock.calls else Array.map(a2.calls:all(), function(a1) -- Line: 829
        return a1.args
    end)
    local u66 = #calls
    local v2 = false
    if u66 >= 1 then
        v2 = isEqualCall(u27, calls[u66])
    end
    return {
        message = if not v2 then function() -- Line: 864
            -- upvalues: u66 (val), isEqualCall (upval), u27 (val), calls (ref), matcherHint (upval), u147 (upval)
            -- upvalues: u50 (ref), u28 (val), printExpectedReceivedCallsPositive (upval), isExpand (upval), a1 (val)
            -- upvalues: printReceived (upval)
            local v1 = {}
            if u66 >= 1 then
                if u66 > 1 then
                    local v2 = u66 - 1
                    while v2 >= 1 do
                        if isEqualCall(u27, calls[v2]) then
                            break
                        end
                        v2 = v2 - 1
                    end
                    if v2 < 1 then
                        v2 = u66 - 1
                    end
                    table.insert(v1, {v2, calls[v2]})
                end
                table.insert(v1, {u66, calls[u66]})
            end
            return (matcherHint(u147, u50, "...expected", u28)) .. "\n\n" .. (printExpectedReceivedCallsPositive(u27, v1, isExpand(a1.expand), #calls == 1, u66)) .. ("\nNumber of calls: %s"):format((printReceived(#calls)))
        end else function() -- Line: 842
            -- upvalues: u66 (val), calls (ref), matcherHint (upval), u147 (upval), u50 (ref), u28 (val)
            -- upvalues: printExpectedArgs (upval), u27 (val), stringify (upval), printReceivedCallsNegative (upval)
            -- upvalues: printReceived (upval)
            local v1 = {}
            if u66 > 1 then
                table.insert(v1, {u66 - 1, calls[u66 - 1]})
            end
            local v2 = {u66, calls[u66]}
            table.insert(v1, v2)
            local v3 = (matcherHint(u147, u50, "...expected", u28)) .. "\n\n" .. ("Expected: never %s\n"):format((printExpectedArgs(u27)))
            if #calls ~= 1 or (stringify(calls[1])) ~= stringify(u27) then
                v2 = printReceivedCallsNegative
                v3 = v3 .. v2(u27, v1, #calls == 1, u66)
            end
            return v3 .. ("\nNumber of calls: %s"):format((printReceived(#calls)))
        end,
        pass = v2,
    }
end

local u149 = "toHaveBeenNthCalledWith"

function v3.toHaveBeenNthCalledWith(a1, a2, a3, ...) -- Line: 984
    -- upvalues: Symbol (val), ensureMockOrSpy (ref), u149 (val), Number (val), Error (val), matcherErrorMessage (val)
    -- upvalues: matcherHint (val), printWithType (val), stringify (val), isSpy (ref), Array (val), isEqualCall (ref)
    -- upvalues: printExpectedArgs (ref), printReceivedCallsNegative (ref), printReceived (val)
    -- upvalues: printExpectedReceivedCallsPositive (ref), isExpand (ref)
    local u28 = {}
    u28[1] = ...
    for i = 1, (select("#", ...)) do
        if u28[i] == nil then
            u28[i] = (Symbol.for_("$$nil"))
        end
    end
    local u29 = {secondArgument = "...expected"}

    function u29.expectedColor(a1) -- Line: 996
        return a1
    end

    u29.isNot = a1.isNot
    u29.promise = a1.promise
    ensureMockOrSpy(a2, u149, "n", u29)
    if not Number.isSafeInteger(a3) or a3 < 1 then
        error(Error(matcherErrorMessage(
            matcherHint(u149, nil, "n", u29),
            ("%s must be a positive integer"):format("n"),
            printWithType("n", a3, stringify)
        )))
    end
    local v1 = isSpy(a2)
    local u86 = if not v1 then a2.getMockName() else "spy"
    local calls = if not v1 then a2.mock.calls else Array.map(a2.calls:all(), function(a1) -- Line: 1029
        return a1.args
    end)
    local u102 = #calls
    local v2 = false
    if a3 <= u102 then
        v2 = isEqualCall(u28, calls[a3])
    end
    return {
        message = if not v2 then function() -- Line: 1070
            -- upvalues: a3 (val), u102 (val), isEqualCall (upval), u28 (val), calls (ref), matcherHint (upval)
            -- upvalues: u149 (upval), u86 (ref), u29 (val), a3 (val), printExpectedReceivedCallsPositive (upval)
            -- upvalues: isExpand (upval), a1 (val), printReceived (upval)
            local v1
            local v2 = {}
            if a3 <= u102 then
                v1 = a3 - 1
                if v1 >= 1 then
                    v1 = a3 - 1
                    while v1 >= 1 do
                        if isEqualCall(u28, calls[v1]) then
                            break
                        end
                        v1 = v1 - 1
                    end
                    if v1 < 1 then
                        v1 = a3 - 1
                    end
                    table.insert(v2, {v1, calls[v1]})
                end
                table.insert(v2, {a3, calls[a3]})
                v1 = a3 + 1
                if v1 <= u102 then
                    v1 = a3 + 1
                    while v1 <= u102 do
                        if isEqualCall(u28, calls[v1]) then
                            break
                        end
                        v1 = v1 + 1
                    end
                    if u102 <= v1 then
                        v1 = a3 + 1
                    end
                    table.insert(v2, {v1, calls[v1]})
                end
            elseif u102 > 1 then
                v1 = u102 - 1
                while v1 >= 1 do
                    if isEqualCall(u28, calls[v1]) then
                        break
                    end
                    v1 = v1 - 1
                end
                if v1 < 1 then
                    v1 = u102 - 1
                end
                table.insert(v2, {v1, calls[v1]})
            end
            return (matcherHint(u149, u86, "n", u29)) .. "\n\n" .. (("n: %s\n"):format((tostring(a3)))) .. (printExpectedReceivedCallsPositive(u28, v2, isExpand(a1.expand), #calls == 1, a3)) .. ("\nNumber of calls: %s"):format((printReceived(#calls)))
        end else function() -- Line: 1042
            -- upvalues: a3 (val), calls (ref), u102 (val), matcherHint (upval), u149 (upval), u86 (ref), u29 (val)
            -- upvalues: a3 (val), printExpectedArgs (upval), u28 (val), stringify (upval)
            -- upvalues: printReceivedCallsNegative (upval), printReceived (upval)
            local v1 = {}
            if 1 <= a3 - 1 then
                table.insert(v1, {a3 - 1, calls[a3 - 1]})
            end
            local v2 = {a3, calls[a3]}
            table.insert(v1, v2)
            if a3 + 1 <= u102 then
                table.insert(v1, {a3 + 1, calls[a3 + 1]})
            end
            local v3 = (matcherHint(u149, u86, "n", u29)) .. "\n\n" .. (("n: %s\n"):format((tostring(a3)))) .. ("Expected: never %s\n"):format((printExpectedArgs(u28)))
            if #calls ~= 1 or (stringify(calls[1])) ~= stringify(u28) then
                v2 = printReceivedCallsNegative
                v3 = v3 .. v2(u28, v1, #calls == 1, a3)
            end
            return v3 .. ("\nNumber of calls: %s"):format((printReceived(#calls)))
        end,
        pass = v2,
    }
end

local u151 = "toHaveLastReturnedWith"

function v3.toHaveLastReturnedWith(a1, a2, a3) -- Line: 901
    -- upvalues: ensureMock (ref), u151 (val), isEqualReturn (ref), matcherHint (val), printExpected (val)
    -- upvalues: stringify (val), printReceivedResults (ref), printNumberOfReturns (ref), countReturns (ref)
    local u3 = {isNot = a1.isNot, promise = a1.promise}
    ensureMock(a2, u151, "expected", u3)
    local u13 = a2.getMockName()
    local mock = a2.mock
    local calls = mock.calls
    local results = mock.results
    local u17 = #results
    local v1 = false
    if u17 >= 1 then
        v1 = isEqualReturn(a3, results[u17])
    end
    return {
        message = if not v1 then function() -- Line: 950
            -- upvalues: u17 (val), isEqualReturn (upval), a3 (val), results (val), matcherHint (upval), u151 (upval)
            -- upvalues: u13 (val), u3 (val), printExpected (upval), printReceivedResults (upval)
            -- upvalues: printNumberOfReturns (upval), countReturns (upval), calls (val)
            local v1 = {}
            if u17 >= 1 then
                if u17 > 1 then
                    local v2 = u17 - 1
                    while v2 >= 1 do
                        if isEqualReturn(a3, results[v2]) then
                            break
                        end
                        v2 = v2 - 1
                    end
                    if v2 < 1 then
                        v2 = u17 - 1
                    end
                    table.insert(v1, {v2, results[v2]})
                end
                table.insert(v1, {u17, results[u17]})
            end
            return (matcherHint(u151, u13, "expected", u3)) .. "\n\n" .. (("Expected: %s\n"):format((printExpected(a3)))) .. (printReceivedResults("Received: ", a3, v1, #results == 1, u17)) .. printNumberOfReturns(countReturns(results), #calls)
        end else function() -- Line: 921
            -- upvalues: u17 (val), results (val), matcherHint (upval), u151 (upval), u13 (val), u3 (val)
            -- upvalues: printExpected (upval), a3 (val), stringify (upval), printReceivedResults (upval)
            -- upvalues: printNumberOfReturns (upval), countReturns (upval), calls (val)
            local v1 = {}
            if u17 > 1 then
                table.insert(v1, {u17 - 1, results[u17 - 1]})
            end
            local v2 = {u17, results[u17]}
            table.insert(v1, v2)
            local v3 = (matcherHint(u151, u13, "expected", u3)) .. "\n\n" .. ("Expected: never %s\n"):format((printExpected(a3)))
            if #results ~= 1 or results[1].type ~= "return" or (stringify(results[1].value)) ~= stringify(a3) then
                v2 = printReceivedResults
                v3 = v3 .. v2("Received:       ", a3, v1, #results == 1, u17)
            end
            return v3 .. printNumberOfReturns(countReturns(results), #calls)
        end,
        pass = v1,
    }
end

local u153 = "toHaveNthReturnedWith"

function v3.toHaveNthReturnedWith(a1, a2, a3, a4) -- Line: 1140
    -- upvalues: ensureMock (ref), u153 (val), Number (val), Error (val), matcherErrorMessage (val), matcherHint (val)
    -- upvalues: printWithType (val), stringify (val), isEqualReturn (ref), printExpected (val)
    -- upvalues: printReceivedResults (ref), printNumberOfReturns (ref), countReturns (ref)
    local u4 = {secondArgument = "expected"}

    function u4.expectedColor(a1) -- Line: 1143
        return a1
    end

    u4.isNot = a1.isNot
    u4.promise = a1.promise
    ensureMock(a2, u153, "n", u4)
    if not Number.isSafeInteger(a3) or a3 < 1 then
        error(Error(matcherErrorMessage(
            matcherHint(u153, nil, "n", u4),
            ("%s must be a positive integer"):format("n"),
            printWithType("n", a3, stringify)
        )))
    end
    local u46 = a2.getMockName()
    local mock = a2.mock
    local calls = mock.calls
    local results = mock.results
    local u50 = #results
    local v1 = false
    if a3 <= u50 then
        v1 = isEqualReturn(a4, results[a3])
    end
    return {
        message = if not v1 then function() -- Line: 1209
            -- upvalues: a3 (val), u50 (val), isEqualReturn (upval), a4 (val), results (val), matcherHint (upval)
            -- upvalues: u153 (upval), u46 (val), u4 (val), a3 (val), printExpected (upval)
            -- upvalues: printReceivedResults (upval), printNumberOfReturns (upval), countReturns (upval), calls (val)
            local v1
            local v2 = {}
            if a3 <= u50 then
                v1 = a3 - 1
                if v1 >= 1 then
                    v1 = a3 - 1
                    while v1 >= 1 do
                        if isEqualReturn(a4, results[v1]) then
                            break
                        end
                        v1 = v1 - 1
                    end
                    if v1 < 1 then
                        v1 = a3 - 1
                    end
                    table.insert(v2, {v1, results[v1]})
                end
                table.insert(v2, {a3, results[a3]})
                v1 = a3 + 1
                if v1 <= u50 then
                    v1 = a3 + 1
                    while v1 <= u50 do
                        if isEqualReturn(a4, results[v1]) then
                            break
                        end
                        v1 = v1 + 1
                    end
                    if u50 < v1 then
                        v1 = a3 + 1
                    end
                    table.insert(v2, {v1, results[v1]})
                end
            elseif u50 > 0 then
                v1 = u50
                while v1 >= 1 do
                    if isEqualReturn(a4, results[v1]) then
                        break
                    end
                    v1 = v1 - 1
                end
                if v1 < 1 then
                    v1 = u50 - 1
                end
                table.insert(v2, {v1, results[v1]})
            end
            return (matcherHint(u153, u46, "n", u4)) .. "\n\n" .. (("n: %s\n"):format((tostring(a3)))) .. (("Expected: %s\n"):format((printExpected(a4)))) .. (printReceivedResults("Received: ", a4, v2, #results == 1, a3)) .. printNumberOfReturns(countReturns(results), #calls)
        end else function() -- Line: 1177
            -- upvalues: a3 (val), results (val), u50 (val), matcherHint (upval), u153 (upval), u46 (val), u4 (val)
            -- upvalues: a3 (val), printExpected (upval), a4 (val), stringify (upval), printReceivedResults (upval)
            -- upvalues: printNumberOfReturns (upval), countReturns (upval), calls (val)
            local v1 = {}
            if 1 <= a3 - 1 then
                table.insert(v1, {a3 - 1, results[a3 - 1]})
            end
            local v2 = {a3, results[a3]}
            table.insert(v1, v2)
            if a3 + 1 <= u50 then
                table.insert(v1, {a3 + 1, results[a3 + 1]})
            end
            local v3 = (matcherHint(u153, u46, "n", u4)) .. "\n\n" .. (("n: %s\n"):format((tostring(a3)))) .. ("Expected: never %s\n"):format((printExpected(a4)))
            if #results ~= 1 or results[1].type ~= "return" or (stringify(results[1].value)) ~= stringify(a4) then
                v2 = printReceivedResults
                v3 = v3 .. v2("Received:       ", a4, v1, #results == 1, a3)
            end
            return v3 .. printNumberOfReturns(countReturns(results), #calls)
        end,
        pass = v1,
    }
end

local u155 = "toHaveReturned"

function v3.toHaveReturned(a1, a2, a3) -- Line: 475
    -- upvalues: ensureNoExpected (val), u155 (val), ensureMock (ref), Array (val), matcherHint (val)
    -- upvalues: printExpected (val), printReceived (val)
    local v1
    local u3 = {isNot = a1.isNot, promise = a1.promise}
    ensureNoExpected(a3, u155, u3)
    ensureMock(a2, u155, "", u3)
    local u18 = a2.getMockName()
    local u25 = Array.reduce(a2.mock.results, function(a1, a2) -- Line: 488 -- types: a1: number
        if a2.type == "return" then
            return a1 + 1
        end
        return a1
    end, 0)
    return {
        message = if not (u25 > 0) then function() -- Line: 522
            -- upvalues: matcherHint (upval), u155 (upval), u18 (val), u3 (val), printExpected (upval)
            -- upvalues: printReceived (upval), u25 (val), a2 (val)
            local v1 = (matcherHint(u155, u18, "", u3)) .. "\n\n" .. (("Expected number of returns: >= %s\n"):format((printExpected(1)))) .. ("Received number of returns:    %s"):format((printReceived(u25)))
            if #a2.mock.calls ~= u25 then
                v1 = v1 .. ("\nReceived number of calls:      %s"):format((printReceived(#a2.mock.calls)))
            end
            return v1
        end else function() -- Line: 499
            -- upvalues: matcherHint (upval), u155 (upval), u18 (val), u3 (val), printExpected (upval)
            -- upvalues: printReceived (upval), u25 (val), Array (upval), a2 (val)
            local v1 = (matcherHint(u155, u18, "", u3)) .. "\n\n" .. (("Expected number of returns: %s\n"):format((printExpected(0)))) .. (("Received number of returns: %s\n\n"):format((printReceived(u25)))) .. Array.join(Array.reduce(a2.mock.results, function(a1, a2, a3) -- Line: 505 -- upvalues: printReceived (upval) -- types: a3: number
                if a2.type == "return" and #a1 < 3 then
                    table.insert(a1, (("%s: %s"):format(tostring(a3), (printReceived(a2.value)))))
                end
                return a1
            end, {}), "\n")
            if #a2.mock.calls ~= u25 then
                v1 = v1 .. "\n\nReceived number of calls:   " .. printReceived(#a2.mock.calls)
            end
            return v1
        end,
        pass = v1,
    }
end

local u157 = "toHaveReturnedTimes"

function v3.toHaveReturnedTimes(a1, a2, a3) -- Line: 589
    -- upvalues: ensureExpectedIsNonNegativeInteger (val), u157 (val), ensureMock (ref), Array (val), matcherHint (val)
    -- upvalues: printExpected (val), printReceived (val)
    local v1
    local u3 = {isNot = a1.isNot, promise = a1.promise}
    ensureExpectedIsNonNegativeInteger(a3, u157, u3)
    ensureMock(a2, u157, "expected", u3)
    local u18 = a2.getMockName()
    local u25 = Array.reduce(a2.mock.results, function(a1, a2) -- Line: 602 -- types: a1: number
        if a2.type == "return" then
            return a1 + 1
        end
        return a1
    end, 0)
    return {
        message = if not (u25 == a3) then function() -- Line: 627
            -- upvalues: matcherHint (upval), u157 (upval), u18 (val), u3 (val), printExpected (upval), a3 (val)
            -- upvalues: printReceived (upval), u25 (val), a2 (val)
            local v1 = (matcherHint(u157, u18, "expected", u3)) .. "\n\n" .. (("Expected number of returns: %s\n"):format((printExpected(a3)))) .. ("Received number of returns: %s"):format((printReceived(u25)))
            if #a2.mock.calls ~= u25 then
                v1 = v1 .. ("\nReceived number of calls:   %s"):format((printReceived(#a2.mock.calls)))
            end
            return v1
        end else function() -- Line: 614
            -- upvalues: matcherHint (upval), u157 (upval), u18 (val), u3 (val), printExpected (upval), a3 (val)
            -- upvalues: a2 (val), u25 (val), printReceived (upval)
            local v1 = (matcherHint(u157, u18, "expected", u3)) .. "\n\n" .. ("Expected number of returns: never %s"):format((printExpected(a3)))
            if #a2.mock.calls ~= u25 then
                v1 = v1 .. ("\n\nReceived number of calls:         %s"):format((printReceived(#a2.mock.calls)))
            end
            return v1
        end,
        pass = v1,
    }
end

local u159 = "toHaveReturnedWith"

function v3.toHaveReturnedWith(a1, a2, a3) -- Line: 730
    -- upvalues: ensureMock (ref), u159 (val), Array (val), isEqualReturn (ref), matcherHint (val), printExpected (val)
    -- upvalues: stringify (val), printReceivedResults (ref), printNumberOfReturns (ref), countReturns (ref)
    local u3 = {isNot = a1.isNot, promise = a1.promise}
    ensureMock(a2, u159, "expected", u3)
    local u13 = a2.getMockName()
    local mock = a2.mock
    local calls = mock.calls
    local results = mock.results
    local v1 = Array.some(results, function(a1) -- Line: 743 -- upvalues: isEqualReturn (upval), a3 (val)
        return isEqualReturn(a3, a1)
    end)
    return {
        message = if not v1 then function() -- Line: 779
            -- upvalues: results (val), matcherHint (upval), u159 (upval), u13 (val), u3 (val), printExpected (upval)
            -- upvalues: a3 (val), printReceivedResults (upval), printNumberOfReturns (upval), countReturns (upval)
            -- upvalues: calls (val)
            local v1 = {}
            local v2 = 1
            while v2 <= #results do
                if not (#v1 < 3) then
                    break
                end
                table.insert(v1, {v2, results[v2]})
                v2 = v2 + 1
            end
            return (matcherHint(u159, u13, "expected", u3)) .. "\n\n" .. (("Expected: %s\n"):format((printExpected(a3)))) .. (printReceivedResults("Received: ", a3, v1, #results == 1)) .. printNumberOfReturns(countReturns(results), #calls)
        end else function() -- Line: 749
            -- upvalues: results (val), isEqualReturn (upval), a3 (val), matcherHint (upval), u159 (upval), u13 (val)
            -- upvalues: u3 (val), printExpected (upval), stringify (upval), printReceivedResults (upval)
            -- upvalues: printNumberOfReturns (upval), countReturns (upval), calls (val)
            local v1 = {}
            local v2 = 1
            while v2 <= #results do
                if not (#v1 < 3) then
                    break
                end
                if isEqualReturn(a3, results[v2]) then
                    table.insert(v1, {v2, results[v2]})
                end
                v2 = v2 + 1
            end
            local v3 = (matcherHint(u159, u13, "expected", u3)) .. "\n\n" .. ("Expected: never %s\n"):format((printExpected(a3)))
            if #results ~= 1 or results[1].type ~= "return" or (stringify(results[1].value)) ~= stringify(a3) then
                local v4 = printReceivedResults
                v3 = v3 .. v4("Received:       ", a3, v1, #results == 1)
            end
            return v3 .. printNumberOfReturns(countReturns(results), #calls)
        end,
        pass = v1,
    }
end

local u161 = "toReturn"

function v3.toReturn(a1, a2, a3) -- Line: 475
    -- upvalues: ensureNoExpected (val), u161 (val), ensureMock (ref), Array (val), matcherHint (val)
    -- upvalues: printExpected (val), printReceived (val)
    local v1
    local u3 = {isNot = a1.isNot, promise = a1.promise}
    ensureNoExpected(a3, u161, u3)
    ensureMock(a2, u161, "", u3)
    local u18 = a2.getMockName()
    local u25 = Array.reduce(a2.mock.results, function(a1, a2) -- Line: 488 -- types: a1: number
        if a2.type == "return" then
            return a1 + 1
        end
        return a1
    end, 0)
    return {
        message = if not (u25 > 0) then function() -- Line: 522
            -- upvalues: matcherHint (upval), u161 (upval), u18 (val), u3 (val), printExpected (upval)
            -- upvalues: printReceived (upval), u25 (val), a2 (val)
            local v1 = (matcherHint(u161, u18, "", u3)) .. "\n\n" .. (("Expected number of returns: >= %s\n"):format((printExpected(1)))) .. ("Received number of returns:    %s"):format((printReceived(u25)))
            if #a2.mock.calls ~= u25 then
                v1 = v1 .. ("\nReceived number of calls:      %s"):format((printReceived(#a2.mock.calls)))
            end
            return v1
        end else function() -- Line: 499
            -- upvalues: matcherHint (upval), u161 (upval), u18 (val), u3 (val), printExpected (upval)
            -- upvalues: printReceived (upval), u25 (val), Array (upval), a2 (val)
            local v1 = (matcherHint(u161, u18, "", u3)) .. "\n\n" .. (("Expected number of returns: %s\n"):format((printExpected(0)))) .. (("Received number of returns: %s\n\n"):format((printReceived(u25)))) .. Array.join(Array.reduce(a2.mock.results, function(a1, a2, a3) -- Line: 505 -- upvalues: printReceived (upval) -- types: a3: number
                if a2.type == "return" and #a1 < 3 then
                    table.insert(a1, (("%s: %s"):format(tostring(a3), (printReceived(a2.value)))))
                end
                return a1
            end, {}), "\n")
            if #a2.mock.calls ~= u25 then
                v1 = v1 .. "\n\nReceived number of calls:   " .. printReceived(#a2.mock.calls)
            end
            return v1
        end,
        pass = v1,
    }
end

local u163 = "toReturnTimes"

function v3.toReturnTimes(a1, a2, a3) -- Line: 589
    -- upvalues: ensureExpectedIsNonNegativeInteger (val), u163 (val), ensureMock (ref), Array (val), matcherHint (val)
    -- upvalues: printExpected (val), printReceived (val)
    local v1
    local u3 = {isNot = a1.isNot, promise = a1.promise}
    ensureExpectedIsNonNegativeInteger(a3, u163, u3)
    ensureMock(a2, u163, "expected", u3)
    local u18 = a2.getMockName()
    local u25 = Array.reduce(a2.mock.results, function(a1, a2) -- Line: 602 -- types: a1: number
        if a2.type == "return" then
            return a1 + 1
        end
        return a1
    end, 0)
    return {
        message = if not (u25 == a3) then function() -- Line: 627
            -- upvalues: matcherHint (upval), u163 (upval), u18 (val), u3 (val), printExpected (upval), a3 (val)
            -- upvalues: printReceived (upval), u25 (val), a2 (val)
            local v1 = (matcherHint(u163, u18, "expected", u3)) .. "\n\n" .. (("Expected number of returns: %s\n"):format((printExpected(a3)))) .. ("Received number of returns: %s"):format((printReceived(u25)))
            if #a2.mock.calls ~= u25 then
                v1 = v1 .. ("\nReceived number of calls:   %s"):format((printReceived(#a2.mock.calls)))
            end
            return v1
        end else function() -- Line: 614
            -- upvalues: matcherHint (upval), u163 (upval), u18 (val), u3 (val), printExpected (upval), a3 (val)
            -- upvalues: a2 (val), u25 (val), printReceived (upval)
            local v1 = (matcherHint(u163, u18, "expected", u3)) .. "\n\n" .. ("Expected number of returns: never %s"):format((printExpected(a3)))
            if #a2.mock.calls ~= u25 then
                v1 = v1 .. ("\n\nReceived number of calls:         %s"):format((printReceived(#a2.mock.calls)))
            end
            return v1
        end,
        pass = v1,
    }
end

local u165 = "toReturnWith"

function v3.toReturnWith(a1, a2, a3) -- Line: 730
    -- upvalues: ensureMock (ref), u165 (val), Array (val), isEqualReturn (ref), matcherHint (val), printExpected (val)
    -- upvalues: stringify (val), printReceivedResults (ref), printNumberOfReturns (ref), countReturns (ref)
    local u3 = {isNot = a1.isNot, promise = a1.promise}
    ensureMock(a2, u165, "expected", u3)
    local u13 = a2.getMockName()
    local mock = a2.mock
    local calls = mock.calls
    local results = mock.results
    local v1 = Array.some(results, function(a1) -- Line: 743 -- upvalues: isEqualReturn (upval), a3 (val)
        return isEqualReturn(a3, a1)
    end)
    return {
        message = if not v1 then function() -- Line: 779
            -- upvalues: results (val), matcherHint (upval), u165 (upval), u13 (val), u3 (val), printExpected (upval)
            -- upvalues: a3 (val), printReceivedResults (upval), printNumberOfReturns (upval), countReturns (upval)
            -- upvalues: calls (val)
            local v1 = {}
            local v2 = 1
            while v2 <= #results do
                if not (#v1 < 3) then
                    break
                end
                table.insert(v1, {v2, results[v2]})
                v2 = v2 + 1
            end
            return (matcherHint(u165, u13, "expected", u3)) .. "\n\n" .. (("Expected: %s\n"):format((printExpected(a3)))) .. (printReceivedResults("Received: ", a3, v1, #results == 1)) .. printNumberOfReturns(countReturns(results), #calls)
        end else function() -- Line: 749
            -- upvalues: results (val), isEqualReturn (upval), a3 (val), matcherHint (upval), u165 (upval), u13 (val)
            -- upvalues: u3 (val), printExpected (upval), stringify (upval), printReceivedResults (upval)
            -- upvalues: printNumberOfReturns (upval), countReturns (upval), calls (val)
            local v1 = {}
            local v2 = 1
            while v2 <= #results do
                if not (#v1 < 3) then
                    break
                end
                if isEqualReturn(a3, results[v2]) then
                    table.insert(v1, {v2, results[v2]})
                end
                v2 = v2 + 1
            end
            local v3 = (matcherHint(u165, u13, "expected", u3)) .. "\n\n" .. ("Expected: never %s\n"):format((printExpected(a3)))
            if #results ~= 1 or results[1].type ~= "return" or (stringify(results[1].value)) ~= stringify(a3) then
                local v4 = printReceivedResults
                v3 = v3 .. v4("Received:       ", a3, v1, #results == 1)
            end
            return v3 .. printNumberOfReturns(countReturns(results), #calls)
        end,
        pass = v1,
    }
end

local function isMock(a1) -- Line: 1300
    local v1 = false
    if a1 ~= nil then
        v1 = false
        if typeof(a1) == "table" then
            v1 = a1._isMockFunction == true
        end
    end
    return v1
end

function isSpy(a1) -- Line: 1304
    local v1 = false
    if a1 ~= nil then
        v1 = false
        if typeof(a1) == "table" then
            v1 = false
            if a1.calls ~= nil then
                v1 = false
                if typeof(a1.calls.all) == "function" then
                    v1 = typeof(a1.calls.count) == "function"
                end
            end
        end
    end
    return v1
end

function ensureMockOrSpy(a1, a2, a3, a4) -- Line: 1313
    -- upvalues: isMock (ref), isSpy (ref), Error (val), matcherErrorMessage (val), matcherHint (val)
    -- upvalues: RECEIVED_COLOR (val), printWithType (val), printReceived (val)
    if not isMock(a1) and not isSpy(a1) then
        error(Error(matcherErrorMessage(
            matcherHint(a2, nil, a3, a4),
            ("%s value must be a mock or spy function"):format((RECEIVED_COLOR("received"))),
            printWithType("Received", a1, printReceived)
        )))
    end
end

function ensureMock(a1, a2, a3, a4) -- Line: 1333
    -- upvalues: isMock (ref), Error (val), matcherErrorMessage (val), matcherHint (val), RECEIVED_COLOR (val)
    -- upvalues: printWithType (val), printReceived (val)
    if not isMock(a1) then
        error(Error(matcherErrorMessage(
            matcherHint(a2, nil, a3, a4),
            ("%s value must be a mock function"):format((RECEIVED_COLOR("received"))),
            printWithType("Received", a1, printReceived)
        )))
    end
end

return v3