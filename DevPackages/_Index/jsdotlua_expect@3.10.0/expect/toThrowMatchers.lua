-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_expect@3.10.0.expect.toThrowMatchers
-- Decompile time: 95.75 ms

local getType = require(script.Parent.Parent:WaitForChild("jest-get-type")).getType
local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local instanceof = v1.instanceof
local Error = v1.Error
require(script.Parent.Parent:WaitForChild("luau-regexp"))
local v2 = require(script.Parent.Parent:WaitForChild("jest-matcher-utils"))
local EXPECTED_COLOR = v2.EXPECTED_COLOR
local RECEIVED_COLOR = v2.RECEIVED_COLOR
local matcherErrorMessage = v2.matcherErrorMessage
local matcherHint = v2.matcherHint
local printDiffOrStringify = v2.printDiffOrStringify
local printExpected = v2.printExpected
local printReceived = v2.printReceived
local printWithType = v2.printWithType
local stringify = v2.stringify
local formatStackTrace = (require((script.Parent.Parent:WaitForChild("jest-message-util")))).formatStackTrace
local print = require(script.Parent:WaitForChild("print"))
local printExpectedConstructorName = print.printExpectedConstructorName
local printExpectedConstructorNameNot = print.printExpectedConstructorNameNot
local printReceivedConstructorName = print.printReceivedConstructorName
local printReceivedConstructorNameNot = print.printReceivedConstructorNameNot
local printReceivedStringContainExpectedResult = print.printReceivedStringContainExpectedResult
local printReceivedStringContainExpectedSubstring = print.printReceivedStringContainExpectedSubstring
require(script.Parent:WaitForChild("types"))
local isError = require(script.Parent:WaitForChild("utils")).isError
local toThrowExpectedRegExp = nil
local toThrowExpectedAsymmetric = nil
local toThrowExpectedObject = nil
local toThrowExpectedClass = nil
local toThrowExpectedString = nil
local toThrow = nil
local formatExpected = nil
local formatReceived = nil
local formatStack = nil

local function getThrown(a1) -- Line: 65
    local v1 = false
    if a1 ~= nil then
        v1 = true
        if typeof(a1.message) ~= "string" then
            v1 = typeof(a1.message) == "table"
        end
    end
    if v1 and typeof(a1.name) == "string" and typeof(a1.stack) == "string" then
        return {isError = true, hasMessage = v1, message = a1.message, value = a1}
    end
    if v1 then
        return {isError = false, hasMessage = v1, message = a1.message, value = a1}
    end
    return {isError = false, hasMessage = v1, message = tostring(a1), value = a1}
end

local v3 = {}
local u101 = nil
local u102 = "toThrow"

function v3.toThrow(a1, a2, a3) -- Line: 99
    -- upvalues: u101 (val), isError (val), getThrown (val), Error (val), matcherErrorMessage (val), matcherHint (val)
    -- upvalues: u102 (val), RECEIVED_COLOR (val), printWithType (val), printReceived (val), getType (val)
    -- upvalues: stringify (val), toThrow (ref), toThrowExpectedAsymmetric (ref), toThrowExpectedString (ref)
    -- upvalues: toThrowExpectedRegExp (ref), toThrowExpectedClass (ref), toThrowExpectedObject (ref)
    -- upvalues: EXPECTED_COLOR (val), printExpected (val)
    local diffStack, getTopStackEntry, result, success, u65
    local v1 = {isNot = a1.isNot, promise = a1.promise}
    local v2 = nil
    if not u101 then
        if typeof(a2) == "function" then
            function getTopStackEntry(a1) -- Line: 146
                return string.match(a1, "[^\n]+")
            end

            function diffStack(a1, a2) -- Line: 152
                local v1 = ""
                local v2 = ""
                local v3 = string.match(a1, "[^\n]+")
                for i in string.gmatch(a2, "[^\n]+") do
                    if i == v3 then
                        return v2
                    end
                    v1 = v1 .. "\n" .. i
                end
                return nil
            end

            u65 = nil
            success, result = xpcall(function() -- Line: 171 -- upvalues: u65 (ref), a2 (val)
                u65 = debug.traceback(nil, 2)
                a2()
            end, function(a1) -- Line: 174 -- upvalues: getType (upval), diffStack (val), u65 (ref), stringify (upval), Error (upval)
                local v1, v2, v3
                if a1 == nil then
                    v2 = Error.new("nil")
                    Error.__captureStackTrace(v2, 3)
                    _, v3 = string.find(v2.stack, string.match(v2.stack, "[^\n]+"), 1, true)
                    v2.stack = string.sub(v2.stack, v3 + 1 + 1)
                    v2.stack = diffStack(u65, v2.stack)
                    v2["$$robloxInternalJestError"] = true
                    return v2
                end
                if getType(a1) == "error" then
                    if a1.stack == nil then
                        a1.stack = diffStack(u65, debug.traceback())
                        return a1
                    end
                    if not a1.stack:find("ThrowMatchers%-test%.js") then
                        a1.stack = diffStack(u65, a1.stack)
                    end
                    return a1
                end
                if typeof(a1) == "table" and a1.message then
                    if a1.stack == nil then
                        a1.stack = diffStack(u65, debug.traceback())
                        return a1
                    end
                    if not a1.stack:find("ThrowMatchers%-test%.js") then
                        a1.stack = diffStack(u65, a1.stack)
                    end
                    return a1
                end
                if typeof(a1) ~= "string" then
                    v1 = if typeof(a1) ~= "table" then a1 else stringify(a1)
                else
                    _, _, v3 = a1:find("[%S+\\.]+:[0-9]+:%s(.*)")
                    v1 = if v3 == nil then a1 else v3
                end
                v2 = Error.new(v1)
                Error.__captureStackTrace(v2, 3)
                _, v3 = string.find(v2.stack, string.match(v2.stack, "[^\n]+"), 1, true)
                v2.stack = string.sub(v2.stack, v3 + 1 + 1)
                v2.stack = diffStack(u65, v2.stack)
                v2["$$robloxInternalJestError"] = true
                return v2
            end)
            if not success then
                v2 = getThrown(result)
            end
        elseif typeof(a2) ~= "table" or not getmetatable(a2) then
            if not u101 then
                error(Error(matcherErrorMessage(
                    matcherHint(u102, nil, if a3 ~= nil then "expected" else "", v1),
                    (RECEIVED_COLOR("received")) .. " value must be a function",
                    printWithType("Received", a2, printReceived)
                )))
            end
        elseif getmetatable(a2).__call then
            function getTopStackEntry(a1) -- Line: 146
                return string.match(a1, "[^\n]+")
            end

            function diffStack(a1, a2) -- Line: 152
                local v1 = ""
                local v2 = ""
                local v3 = string.match(a1, "[^\n]+")
                for i in string.gmatch(a2, "[^\n]+") do
                    if i == v3 then
                        return v2
                    end
                    v1 = v1 .. "\n" .. i
                end
                return nil
            end

            u65 = nil
            success, result = xpcall(function() -- Line: 171 -- upvalues: u65 (ref), a2 (val)
                u65 = debug.traceback(nil, 2)
                a2()
            end, function(a1) -- Line: 174 -- upvalues: getType (upval), diffStack (val), u65 (ref), stringify (upval), Error (upval)
                local v1, v2, v3
                if a1 == nil then
                    v2 = Error.new("nil")
                    Error.__captureStackTrace(v2, 3)
                    _, v3 = string.find(v2.stack, string.match(v2.stack, "[^\n]+"), 1, true)
                    v2.stack = string.sub(v2.stack, v3 + 1 + 1)
                    v2.stack = diffStack(u65, v2.stack)
                    v2["$$robloxInternalJestError"] = true
                    return v2
                end
                if getType(a1) == "error" then
                    if a1.stack == nil then
                        a1.stack = diffStack(u65, debug.traceback())
                        return a1
                    end
                    if not a1.stack:find("ThrowMatchers%-test%.js") then
                        a1.stack = diffStack(u65, a1.stack)
                    end
                    return a1
                end
                if typeof(a1) == "table" and a1.message then
                    if a1.stack == nil then
                        a1.stack = diffStack(u65, debug.traceback())
                        return a1
                    end
                    if not a1.stack:find("ThrowMatchers%-test%.js") then
                        a1.stack = diffStack(u65, a1.stack)
                    end
                    return a1
                end
                if typeof(a1) ~= "string" then
                    v1 = if typeof(a1) ~= "table" then a1 else stringify(a1)
                else
                    _, _, v3 = a1:find("[%S+\\.]+:[0-9]+:%s(.*)")
                    v1 = if v3 == nil then a1 else v3
                end
                v2 = Error.new(v1)
                Error.__captureStackTrace(v2, 3)
                _, v3 = string.find(v2.stack, string.match(v2.stack, "[^\n]+"), 1, true)
                v2.stack = string.sub(v2.stack, v3 + 1 + 1)
                v2.stack = diffStack(u65, v2.stack)
                v2["$$robloxInternalJestError"] = true
                return v2
            end)
            if not success then
                v2 = getThrown(result)
            end
        elseif not u101 then
            error(Error(matcherErrorMessage(
                matcherHint(u102, nil, if a3 ~= nil then "expected" else "", v1),
                (RECEIVED_COLOR("received")) .. " value must be a function",
                printWithType("Received", a2, printReceived)
            )))
        end
    elseif isError(a2) then
        v2 = getThrown(a2)
    elseif typeof(a2) == "function" then
        function getTopStackEntry(a1) -- Line: 146
            return string.match(a1, "[^\n]+")
        end

        function diffStack(a1, a2) -- Line: 152
            local v1 = ""
            local v2 = ""
            local v3 = string.match(a1, "[^\n]+")
            for i in string.gmatch(a2, "[^\n]+") do
                if i == v3 then
                    return v2
                end
                v1 = v1 .. "\n" .. i
            end
            return nil
        end

        u65 = nil
        success, result = xpcall(function() -- Line: 171 -- upvalues: u65 (ref), a2 (val)
            u65 = debug.traceback(nil, 2)
            a2()
        end, function(a1) -- Line: 174 -- upvalues: getType (upval), diffStack (val), u65 (ref), stringify (upval), Error (upval)
            local v1, v2, v3
            if a1 == nil then
                v2 = Error.new("nil")
                Error.__captureStackTrace(v2, 3)
                _, v3 = string.find(v2.stack, string.match(v2.stack, "[^\n]+"), 1, true)
                v2.stack = string.sub(v2.stack, v3 + 1 + 1)
                v2.stack = diffStack(u65, v2.stack)
                v2["$$robloxInternalJestError"] = true
                return v2
            end
            if getType(a1) == "error" then
                if a1.stack == nil then
                    a1.stack = diffStack(u65, debug.traceback())
                    return a1
                end
                if not a1.stack:find("ThrowMatchers%-test%.js") then
                    a1.stack = diffStack(u65, a1.stack)
                end
                return a1
            end
            if typeof(a1) == "table" and a1.message then
                if a1.stack == nil then
                    a1.stack = diffStack(u65, debug.traceback())
                    return a1
                end
                if not a1.stack:find("ThrowMatchers%-test%.js") then
                    a1.stack = diffStack(u65, a1.stack)
                end
                return a1
            end
            if typeof(a1) ~= "string" then
                v1 = if typeof(a1) ~= "table" then a1 else stringify(a1)
            else
                _, _, v3 = a1:find("[%S+\\.]+:[0-9]+:%s(.*)")
                v1 = if v3 == nil then a1 else v3
            end
            v2 = Error.new(v1)
            Error.__captureStackTrace(v2, 3)
            _, v3 = string.find(v2.stack, string.match(v2.stack, "[^\n]+"), 1, true)
            v2.stack = string.sub(v2.stack, v3 + 1 + 1)
            v2.stack = diffStack(u65, v2.stack)
            v2["$$robloxInternalJestError"] = true
            return v2
        end)
        if not success then
            v2 = getThrown(result)
        end
    elseif typeof(a2) ~= "table" or not getmetatable(a2) then
        if not u101 then
            error(Error(matcherErrorMessage(
                matcherHint(u102, nil, if a3 ~= nil then "expected" else "", v1),
                (RECEIVED_COLOR("received")) .. " value must be a function",
                printWithType("Received", a2, printReceived)
            )))
        end
    elseif getmetatable(a2).__call then
        function getTopStackEntry(a1) -- Line: 146
            return string.match(a1, "[^\n]+")
        end

        function diffStack(a1, a2) -- Line: 152
            local v1 = ""
            local v2 = ""
            local v3 = string.match(a1, "[^\n]+")
            for i in string.gmatch(a2, "[^\n]+") do
                if i == v3 then
                    return v2
                end
                v1 = v1 .. "\n" .. i
            end
            return nil
        end

        u65 = nil
        success, result = xpcall(function() -- Line: 171 -- upvalues: u65 (ref), a2 (val)
            u65 = debug.traceback(nil, 2)
            a2()
        end, function(a1) -- Line: 174 -- upvalues: getType (upval), diffStack (val), u65 (ref), stringify (upval), Error (upval)
            local v1, v2, v3
            if a1 == nil then
                v2 = Error.new("nil")
                Error.__captureStackTrace(v2, 3)
                _, v3 = string.find(v2.stack, string.match(v2.stack, "[^\n]+"), 1, true)
                v2.stack = string.sub(v2.stack, v3 + 1 + 1)
                v2.stack = diffStack(u65, v2.stack)
                v2["$$robloxInternalJestError"] = true
                return v2
            end
            if getType(a1) == "error" then
                if a1.stack == nil then
                    a1.stack = diffStack(u65, debug.traceback())
                    return a1
                end
                if not a1.stack:find("ThrowMatchers%-test%.js") then
                    a1.stack = diffStack(u65, a1.stack)
                end
                return a1
            end
            if typeof(a1) == "table" and a1.message then
                if a1.stack == nil then
                    a1.stack = diffStack(u65, debug.traceback())
                    return a1
                end
                if not a1.stack:find("ThrowMatchers%-test%.js") then
                    a1.stack = diffStack(u65, a1.stack)
                end
                return a1
            end
            if typeof(a1) ~= "string" then
                v1 = if typeof(a1) ~= "table" then a1 else stringify(a1)
            else
                _, _, v3 = a1:find("[%S+\\.]+:[0-9]+:%s(.*)")
                v1 = if v3 == nil then a1 else v3
            end
            v2 = Error.new(v1)
            Error.__captureStackTrace(v2, 3)
            _, v3 = string.find(v2.stack, string.match(v2.stack, "[^\n]+"), 1, true)
            v2.stack = string.sub(v2.stack, v3 + 1 + 1)
            v2.stack = diffStack(u65, v2.stack)
            v2["$$robloxInternalJestError"] = true
            return v2
        end)
        if not success then
            v2 = getThrown(result)
        end
    elseif not u101 then
        error(Error(matcherErrorMessage(
            matcherHint(u102, nil, if a3 ~= nil then "expected" else "", v1),
            (RECEIVED_COLOR("received")) .. " value must be a function",
            printWithType("Received", a2, printReceived)
        )))
    end
    if a3 == nil then
        return toThrow(u102, v1, v2)
    end
    if typeof(a3) == "table" and typeof(a3.asymmetricMatch) == "function" then
        return toThrowExpectedAsymmetric(u102, v1, v2, a3)
    end
    if typeof(a3) == "string" then
        return toThrowExpectedString(u102, v1, v2, a3)
    end
    if getType(a3) == "regexp" then
        return toThrowExpectedRegExp(u102, v1, v2, a3)
    end
    if typeof(a3) == "table" and typeof(a3.test) == "function" and typeof(a3.exec) == "function" then
        return toThrowExpectedRegExp(u102, v1, v2, a3)
    end
    if typeof(a3) == "table" and not a3.message then
        return toThrowExpectedClass(u102, v1, v2, a3)
    end
    if typeof(a3) == "table" then
        return toThrowExpectedObject(u102, v1, v2, a3)
    end
    error(Error(matcherErrorMessage(
        matcherHint(u102, nil, nil, v1),
        (EXPECTED_COLOR("expected")) .. " value must be a string or regular expression or class or error",
        printWithType("Expected", a3, printExpected)
    )))
end

local u104 = nil
local u105 = "toThrowError"

function v3.toThrowError(a1, a2, a3) -- Line: 99
    -- upvalues: u104 (val), isError (val), getThrown (val), Error (val), matcherErrorMessage (val), matcherHint (val)
    -- upvalues: u105 (val), RECEIVED_COLOR (val), printWithType (val), printReceived (val), getType (val)
    -- upvalues: stringify (val), toThrow (ref), toThrowExpectedAsymmetric (ref), toThrowExpectedString (ref)
    -- upvalues: toThrowExpectedRegExp (ref), toThrowExpectedClass (ref), toThrowExpectedObject (ref)
    -- upvalues: EXPECTED_COLOR (val), printExpected (val)
    local diffStack, getTopStackEntry, result, success, u65
    local v1 = {isNot = a1.isNot, promise = a1.promise}
    local v2 = nil
    if not u104 then
        if typeof(a2) == "function" then
            function getTopStackEntry(a1) -- Line: 146
                return string.match(a1, "[^\n]+")
            end

            function diffStack(a1, a2) -- Line: 152
                local v1 = ""
                local v2 = ""
                local v3 = string.match(a1, "[^\n]+")
                for i in string.gmatch(a2, "[^\n]+") do
                    if i == v3 then
                        return v2
                    end
                    v1 = v1 .. "\n" .. i
                end
                return nil
            end

            u65 = nil
            success, result = xpcall(function() -- Line: 171 -- upvalues: u65 (ref), a2 (val)
                u65 = debug.traceback(nil, 2)
                a2()
            end, function(a1) -- Line: 174 -- upvalues: getType (upval), diffStack (val), u65 (ref), stringify (upval), Error (upval)
                local v1, v2, v3
                if a1 == nil then
                    v2 = Error.new("nil")
                    Error.__captureStackTrace(v2, 3)
                    _, v3 = string.find(v2.stack, string.match(v2.stack, "[^\n]+"), 1, true)
                    v2.stack = string.sub(v2.stack, v3 + 1 + 1)
                    v2.stack = diffStack(u65, v2.stack)
                    v2["$$robloxInternalJestError"] = true
                    return v2
                end
                if getType(a1) == "error" then
                    if a1.stack == nil then
                        a1.stack = diffStack(u65, debug.traceback())
                        return a1
                    end
                    if not a1.stack:find("ThrowMatchers%-test%.js") then
                        a1.stack = diffStack(u65, a1.stack)
                    end
                    return a1
                end
                if typeof(a1) == "table" and a1.message then
                    if a1.stack == nil then
                        a1.stack = diffStack(u65, debug.traceback())
                        return a1
                    end
                    if not a1.stack:find("ThrowMatchers%-test%.js") then
                        a1.stack = diffStack(u65, a1.stack)
                    end
                    return a1
                end
                if typeof(a1) ~= "string" then
                    v1 = if typeof(a1) ~= "table" then a1 else stringify(a1)
                else
                    _, _, v3 = a1:find("[%S+\\.]+:[0-9]+:%s(.*)")
                    v1 = if v3 == nil then a1 else v3
                end
                v2 = Error.new(v1)
                Error.__captureStackTrace(v2, 3)
                _, v3 = string.find(v2.stack, string.match(v2.stack, "[^\n]+"), 1, true)
                v2.stack = string.sub(v2.stack, v3 + 1 + 1)
                v2.stack = diffStack(u65, v2.stack)
                v2["$$robloxInternalJestError"] = true
                return v2
            end)
            if not success then
                v2 = getThrown(result)
            end
        elseif typeof(a2) ~= "table" or not getmetatable(a2) then
            if not u104 then
                error(Error(matcherErrorMessage(
                    matcherHint(u105, nil, if a3 ~= nil then "expected" else "", v1),
                    (RECEIVED_COLOR("received")) .. " value must be a function",
                    printWithType("Received", a2, printReceived)
                )))
            end
        elseif getmetatable(a2).__call then
            function getTopStackEntry(a1) -- Line: 146
                return string.match(a1, "[^\n]+")
            end

            function diffStack(a1, a2) -- Line: 152
                local v1 = ""
                local v2 = ""
                local v3 = string.match(a1, "[^\n]+")
                for i in string.gmatch(a2, "[^\n]+") do
                    if i == v3 then
                        return v2
                    end
                    v1 = v1 .. "\n" .. i
                end
                return nil
            end

            u65 = nil
            success, result = xpcall(function() -- Line: 171 -- upvalues: u65 (ref), a2 (val)
                u65 = debug.traceback(nil, 2)
                a2()
            end, function(a1) -- Line: 174 -- upvalues: getType (upval), diffStack (val), u65 (ref), stringify (upval), Error (upval)
                local v1, v2, v3
                if a1 == nil then
                    v2 = Error.new("nil")
                    Error.__captureStackTrace(v2, 3)
                    _, v3 = string.find(v2.stack, string.match(v2.stack, "[^\n]+"), 1, true)
                    v2.stack = string.sub(v2.stack, v3 + 1 + 1)
                    v2.stack = diffStack(u65, v2.stack)
                    v2["$$robloxInternalJestError"] = true
                    return v2
                end
                if getType(a1) == "error" then
                    if a1.stack == nil then
                        a1.stack = diffStack(u65, debug.traceback())
                        return a1
                    end
                    if not a1.stack:find("ThrowMatchers%-test%.js") then
                        a1.stack = diffStack(u65, a1.stack)
                    end
                    return a1
                end
                if typeof(a1) == "table" and a1.message then
                    if a1.stack == nil then
                        a1.stack = diffStack(u65, debug.traceback())
                        return a1
                    end
                    if not a1.stack:find("ThrowMatchers%-test%.js") then
                        a1.stack = diffStack(u65, a1.stack)
                    end
                    return a1
                end
                if typeof(a1) ~= "string" then
                    v1 = if typeof(a1) ~= "table" then a1 else stringify(a1)
                else
                    _, _, v3 = a1:find("[%S+\\.]+:[0-9]+:%s(.*)")
                    v1 = if v3 == nil then a1 else v3
                end
                v2 = Error.new(v1)
                Error.__captureStackTrace(v2, 3)
                _, v3 = string.find(v2.stack, string.match(v2.stack, "[^\n]+"), 1, true)
                v2.stack = string.sub(v2.stack, v3 + 1 + 1)
                v2.stack = diffStack(u65, v2.stack)
                v2["$$robloxInternalJestError"] = true
                return v2
            end)
            if not success then
                v2 = getThrown(result)
            end
        elseif not u104 then
            error(Error(matcherErrorMessage(
                matcherHint(u105, nil, if a3 ~= nil then "expected" else "", v1),
                (RECEIVED_COLOR("received")) .. " value must be a function",
                printWithType("Received", a2, printReceived)
            )))
        end
    elseif isError(a2) then
        v2 = getThrown(a2)
    elseif typeof(a2) == "function" then
        function getTopStackEntry(a1) -- Line: 146
            return string.match(a1, "[^\n]+")
        end

        function diffStack(a1, a2) -- Line: 152
            local v1 = ""
            local v2 = ""
            local v3 = string.match(a1, "[^\n]+")
            for i in string.gmatch(a2, "[^\n]+") do
                if i == v3 then
                    return v2
                end
                v1 = v1 .. "\n" .. i
            end
            return nil
        end

        u65 = nil
        success, result = xpcall(function() -- Line: 171 -- upvalues: u65 (ref), a2 (val)
            u65 = debug.traceback(nil, 2)
            a2()
        end, function(a1) -- Line: 174 -- upvalues: getType (upval), diffStack (val), u65 (ref), stringify (upval), Error (upval)
            local v1, v2, v3
            if a1 == nil then
                v2 = Error.new("nil")
                Error.__captureStackTrace(v2, 3)
                _, v3 = string.find(v2.stack, string.match(v2.stack, "[^\n]+"), 1, true)
                v2.stack = string.sub(v2.stack, v3 + 1 + 1)
                v2.stack = diffStack(u65, v2.stack)
                v2["$$robloxInternalJestError"] = true
                return v2
            end
            if getType(a1) == "error" then
                if a1.stack == nil then
                    a1.stack = diffStack(u65, debug.traceback())
                    return a1
                end
                if not a1.stack:find("ThrowMatchers%-test%.js") then
                    a1.stack = diffStack(u65, a1.stack)
                end
                return a1
            end
            if typeof(a1) == "table" and a1.message then
                if a1.stack == nil then
                    a1.stack = diffStack(u65, debug.traceback())
                    return a1
                end
                if not a1.stack:find("ThrowMatchers%-test%.js") then
                    a1.stack = diffStack(u65, a1.stack)
                end
                return a1
            end
            if typeof(a1) ~= "string" then
                v1 = if typeof(a1) ~= "table" then a1 else stringify(a1)
            else
                _, _, v3 = a1:find("[%S+\\.]+:[0-9]+:%s(.*)")
                v1 = if v3 == nil then a1 else v3
            end
            v2 = Error.new(v1)
            Error.__captureStackTrace(v2, 3)
            _, v3 = string.find(v2.stack, string.match(v2.stack, "[^\n]+"), 1, true)
            v2.stack = string.sub(v2.stack, v3 + 1 + 1)
            v2.stack = diffStack(u65, v2.stack)
            v2["$$robloxInternalJestError"] = true
            return v2
        end)
        if not success then
            v2 = getThrown(result)
        end
    elseif typeof(a2) ~= "table" or not getmetatable(a2) then
        if not u104 then
            error(Error(matcherErrorMessage(
                matcherHint(u105, nil, if a3 ~= nil then "expected" else "", v1),
                (RECEIVED_COLOR("received")) .. " value must be a function",
                printWithType("Received", a2, printReceived)
            )))
        end
    elseif getmetatable(a2).__call then
        function getTopStackEntry(a1) -- Line: 146
            return string.match(a1, "[^\n]+")
        end

        function diffStack(a1, a2) -- Line: 152
            local v1 = ""
            local v2 = ""
            local v3 = string.match(a1, "[^\n]+")
            for i in string.gmatch(a2, "[^\n]+") do
                if i == v3 then
                    return v2
                end
                v1 = v1 .. "\n" .. i
            end
            return nil
        end

        u65 = nil
        success, result = xpcall(function() -- Line: 171 -- upvalues: u65 (ref), a2 (val)
            u65 = debug.traceback(nil, 2)
            a2()
        end, function(a1) -- Line: 174 -- upvalues: getType (upval), diffStack (val), u65 (ref), stringify (upval), Error (upval)
            local v1, v2, v3
            if a1 == nil then
                v2 = Error.new("nil")
                Error.__captureStackTrace(v2, 3)
                _, v3 = string.find(v2.stack, string.match(v2.stack, "[^\n]+"), 1, true)
                v2.stack = string.sub(v2.stack, v3 + 1 + 1)
                v2.stack = diffStack(u65, v2.stack)
                v2["$$robloxInternalJestError"] = true
                return v2
            end
            if getType(a1) == "error" then
                if a1.stack == nil then
                    a1.stack = diffStack(u65, debug.traceback())
                    return a1
                end
                if not a1.stack:find("ThrowMatchers%-test%.js") then
                    a1.stack = diffStack(u65, a1.stack)
                end
                return a1
            end
            if typeof(a1) == "table" and a1.message then
                if a1.stack == nil then
                    a1.stack = diffStack(u65, debug.traceback())
                    return a1
                end
                if not a1.stack:find("ThrowMatchers%-test%.js") then
                    a1.stack = diffStack(u65, a1.stack)
                end
                return a1
            end
            if typeof(a1) ~= "string" then
                v1 = if typeof(a1) ~= "table" then a1 else stringify(a1)
            else
                _, _, v3 = a1:find("[%S+\\.]+:[0-9]+:%s(.*)")
                v1 = if v3 == nil then a1 else v3
            end
            v2 = Error.new(v1)
            Error.__captureStackTrace(v2, 3)
            _, v3 = string.find(v2.stack, string.match(v2.stack, "[^\n]+"), 1, true)
            v2.stack = string.sub(v2.stack, v3 + 1 + 1)
            v2.stack = diffStack(u65, v2.stack)
            v2["$$robloxInternalJestError"] = true
            return v2
        end)
        if not success then
            v2 = getThrown(result)
        end
    elseif not u104 then
        error(Error(matcherErrorMessage(
            matcherHint(u105, nil, if a3 ~= nil then "expected" else "", v1),
            (RECEIVED_COLOR("received")) .. " value must be a function",
            printWithType("Received", a2, printReceived)
        )))
    end
    if a3 == nil then
        return toThrow(u105, v1, v2)
    end
    if typeof(a3) == "table" and typeof(a3.asymmetricMatch) == "function" then
        return toThrowExpectedAsymmetric(u105, v1, v2, a3)
    end
    if typeof(a3) == "string" then
        return toThrowExpectedString(u105, v1, v2, a3)
    end
    if getType(a3) == "regexp" then
        return toThrowExpectedRegExp(u105, v1, v2, a3)
    end
    if typeof(a3) == "table" and typeof(a3.test) == "function" and typeof(a3.exec) == "function" then
        return toThrowExpectedRegExp(u105, v1, v2, a3)
    end
    if typeof(a3) == "table" and not a3.message then
        return toThrowExpectedClass(u105, v1, v2, a3)
    end
    if typeof(a3) == "table" then
        return toThrowExpectedObject(u105, v1, v2, a3)
    end
    error(Error(matcherErrorMessage(
        matcherHint(u105, nil, nil, v1),
        (EXPECTED_COLOR("expected")) .. " value must be a string or regular expression or class or error",
        printWithType("Expected", a3, printExpected)
    )))
end

function toThrowExpectedRegExp(a1, a2, a3, a4) -- Line: 302
    -- upvalues: matcherHint (val), formatExpected (ref), formatReceived (ref), formatStack (ref)
    local v1
    local v2 = false
    if a3 ~= nil then
        v2 = a4:test(a3.message)
    end
    if not v2 then
        function v1() -- Line: 331
            -- upvalues: matcherHint (upval), a1 (val), a2 (val), formatExpected (upval), a4 (val), a3 (val)
            -- upvalues: formatReceived (upval), formatStack (upval)
            local v1 = (matcherHint(a1, nil, nil, a2)) .. "\n\n" .. formatExpected("Expected pattern: ", a4)
            if a3 == nil then
                return v1 .. "\nReceived function never threw"
            end
            if a3.hasMessage and not a3.value["$$robloxInternalJestError"] then
                return v1 .. (formatReceived("Received message: ", a3, "message")) .. formatStack(a3)
            end
            return v1 .. (formatReceived("Received value:   ", a3, "message")) .. formatStack(a3)
        end
    else
        assert(a3 ~= nil)

        function v1() -- Line: 315
            -- upvalues: matcherHint (upval), a1 (val), a2 (val), formatExpected (upval), a4 (val), a3 (val)
            -- upvalues: formatReceived (upval), formatStack (upval)
            local v1 = (matcherHint(a1, nil, nil, a2)) .. "\n\n" .. formatExpected("Expected pattern: never ", a4)
            if a3 ~= nil and a3.hasMessage and not a3.value["$$robloxInternalJestError"] then
                return v1 .. (formatReceived("Received message:       ", a3, "message", a4)) .. formatStack(a3)
            end
            return v1 .. (formatReceived("Received value:         ", a3, "message")) .. formatStack(a3)
        end
    end
    return {message = v1, pass = v2}
end

function toThrowExpectedAsymmetric(a1, a2, a3, a4) -- Line: 357
    -- upvalues: matcherHint (val), formatExpected (ref), formatReceived (ref), formatStack (ref)
    local v1
    local v2 = false
    if a3 ~= nil then
        v2 = a4:asymmetricMatch(a3.value)
    end
    if not v2 then
        function v1() -- Line: 388
            -- upvalues: matcherHint (upval), a1 (val), a2 (val), formatExpected (upval), a4 (val), a3 (val)
            -- upvalues: formatReceived (upval), formatStack (upval)
            local v1 = (matcherHint(a1, nil, nil, a2)) .. "\n\n" .. (formatExpected("Expected asymmetric matcher: ", a4)) .. "\n"
            if a3 == nil then
                return v1 .. "Received function never threw"
            end
            if a3.hasMessage and not a3.value["$$robloxInternalJestError"] then
                return v1 .. (formatReceived("Received name:    ", a3, "name")) .. (formatReceived("Received message: ", a3, "message")) .. formatStack(a3)
            end
            return v1 .. (formatReceived("Thrown value: ", a3, "message")) .. formatStack(a3)
        end
    else
        assert(a3 ~= nil)

        function v1() -- Line: 370
            -- upvalues: matcherHint (upval), a1 (val), a2 (val), formatExpected (upval), a4 (val), a3 (val)
            -- upvalues: formatReceived (upval), formatStack (upval)
            local v1 = (matcherHint(a1, nil, nil, a2)) .. "\n\n" .. (formatExpected("Expected asymmetric matcher: never ", a4)) .. "\n"
            if a3 ~= nil and a3.hasMessage and not a3.value["$$robloxInternalJestError"] then
                return v1 .. (formatReceived("Received name:    ", a3, "name")) .. (formatReceived("Received message: ", a3, "message")) .. formatStack(a3)
            end
            return v1 .. (formatReceived("Thrown value: ", a3, "message")) .. formatStack(a3)
        end
    end
    return {message = v1, pass = v2}
end

function toThrowExpectedObject(a1, a2, a3, a4) -- Line: 415
    -- upvalues: matcherHint (val), formatExpected (ref), formatStack (ref), formatReceived (ref)
    -- upvalues: printDiffOrStringify (val)
    local v1
    local v2 = false
    if a3 ~= nil then
        v2 = a3.message == a4.message
    end
    if not v2 then
        function v1() -- Line: 442
            -- upvalues: matcherHint (upval), a1 (val), a2 (val), a3 (val), formatExpected (upval), a4 (val)
            -- upvalues: printDiffOrStringify (upval), formatStack (upval), formatReceived (upval)
            local v1 = (matcherHint(a1, nil, nil, a2)) .. "\n\n"
            if a3 == nil then
                return v1 .. (formatExpected("Expected message: ", a4.message)) .. "\nReceived function never threw"
            end
            if a3.hasMessage and not a3.value["$$robloxInternalJestError"] then
                return v1 .. (printDiffOrStringify(a4.message, a3.message, "Expected message", "Received message", true)) .. "\n" .. formatStack(a3)
            end
            return v1 .. (formatExpected("Expected message: ", a4.message)) .. (formatReceived("Received value:   ", a3, "message")) .. formatStack(a3)
        end
    else
        assert(a3 ~= nil)

        function v1() -- Line: 428
            -- upvalues: matcherHint (upval), a1 (val), a2 (val), formatExpected (upval), a4 (val), a3 (val)
            -- upvalues: formatStack (upval), formatReceived (upval)
            local v1 = (matcherHint(a1, nil, nil, a2)) .. "\n\n" .. formatExpected("Expected message: never ", a4.message)
            if a3 ~= nil and a3.hasMessage and not a3.value["$$robloxInternalJestError"] then
                return v1 .. formatStack(a3)
            end
            return v1 .. (formatReceived("Received value:         ", a3, "message")) .. formatStack(a3)
        end
    end
    return {message = v1, pass = v2}
end

function toThrowExpectedClass(a1, a2, a3, a4) -- Line: 475
    -- upvalues: instanceof (val), matcherHint (val), printExpectedConstructorNameNot (val)
    -- upvalues: printReceivedConstructorNameNot (val), formatReceived (ref), formatStack (ref)
    -- upvalues: printExpectedConstructorName (val), printReceivedConstructorName (val)
    local function isClass(a1) -- Line: 481
        return a1 and getmetatable(a1) and getmetatable(a1).__index
    end

    local v1 = false
    if a3 ~= nil then
        v1 = false
        if a3.value ~= nil then
            v1 = instanceof(a3.value, a4)
        end
    end
    return {
        message = if not v1 then function() -- Line: 515
            -- upvalues: matcherHint (upval), a1 (val), a2 (val), printExpectedConstructorName (upval), a4 (val)
            -- upvalues: a3 (val), printReceivedConstructorName (upval), formatReceived (upval), formatStack (upval)
            local v1 = (matcherHint(a1, nil, nil, a2)) .. "\n\n" .. printExpectedConstructorName("Expected constructor", a4)
            if a3 == nil then
                return v1 .. "\nReceived function never threw"
            end
            if a3.value ~= nil then
                local value = a3.value
                if value
                    and getmetatable(value)
                    and getmetatable(value).__index
                    and not a3.value["$$robloxInternalJestError"] then
                    local v2 = printReceivedConstructorName
                    local value_2 = a3.value
                    v1 = v1 .. v2("Received constructor", (getmetatable(value_2)))
                end
            end
            v1 = v1 .. "\n"
            if a3.hasMessage and not a3.value["$$robloxInternalJestError"] then
                return v1 .. (formatReceived("Received message: ", a3, "message")) .. formatStack(a3)
            end
            return v1 .. (formatReceived("Received value: ", a3, "message")) .. formatStack(a3)
        end else function() -- Line: 489
            -- upvalues: matcherHint (upval), a1 (val), a2 (val), printExpectedConstructorNameNot (upval), a4 (val)
            -- upvalues: a3 (val), printReceivedConstructorNameNot (upval), formatReceived (upval), formatStack (upval)
            local v1 = (matcherHint(a1, nil, nil, a2)) .. "\n\n" .. printExpectedConstructorNameNot("Expected constructor", a4)
            if a3 ~= nil then
                local value = a3.value
                if value and getmetatable(value) and getmetatable(value).__index then
                    local v2 = a4
                    if v2 and getmetatable(v2) and getmetatable(v2).__index then
                        local value_2 = a3.value
                        if getmetatable(value_2).__index ~= a4 and not a3.value["$$robloxInternalJestError"] then
                            v2 = printReceivedConstructorNameNot
                            local value_3 = a3.value
                            v1 = v1 .. v2("Received constructor", getmetatable(value_3), a4)
                        end
                    end
                end
            end
            v1 = v1 .. "\n"
            if a3 ~= nil and a3.hasMessage and not a3.value["$$robloxInternalJestError"] then
                return v1 .. (formatReceived("Received message: ", a3, "message")) .. formatStack(a3)
            end
            return v1 .. (formatReceived("Received value: ", a3, "message")) .. formatStack(a3)
        end,
        pass = v1,
    }
end

function toThrowExpectedString(a1, a2, a3, a4) -- Line: 543
    -- upvalues: matcherHint (val), formatExpected (ref), formatReceived (ref), formatStack (ref)
    local v1
    local v2 = false
    if a3 ~= nil and typeof(a3.message) == "string" and a3.message:find(a4, 1, true) then
        v2 = true
    end
    if not v2 then
        function v1() -- Line: 578
            -- upvalues: matcherHint (upval), a1 (val), a2 (val), formatExpected (upval), a4 (val), a3 (val)
            -- upvalues: formatReceived (upval), formatStack (upval)
            local v1 = (matcherHint(a1, nil, nil, a2)) .. "\n\n" .. formatExpected("Expected substring: ", a4)
            if a3 == nil then
                return v1 .. "\nReceived function never threw"
            end
            if a3.hasMessage and not a3.value["$$robloxInternalJestError"] then
                return v1 .. (formatReceived("Received message:   ", a3, "message")) .. formatStack(a3)
            end
            return v1 .. (formatReceived("Received value:     ", a3, "message")) .. formatStack(a3)
        end
    else
        assert(a3 ~= nil)

        function v1() -- Line: 560
            -- upvalues: matcherHint (upval), a1 (val), a2 (val), formatExpected (upval), a4 (val), a3 (val)
            -- upvalues: formatReceived (upval), formatStack (upval)
            local v1 = (matcherHint(a1, nil, nil, a2)) .. "\n\n" .. formatExpected("Expected substring: never ", a4)
            if a3 ~= nil and a3.hasMessage and not a3.value["$$robloxInternalJestError"] then
                return v1 .. (formatReceived("Received message:         ", a3, "message", a4)) .. formatStack(a3)
            end
            return v1 .. (formatReceived("Received value:           ", a3, "message")) .. formatStack(a3)
        end
    end
    return {message = v1, pass = v2}
end

function toThrow(a1, a2, a3) -- Line: 600
    -- upvalues: matcherHint (val), formatReceived (ref), formatStack (ref)
    local v1, v2
    if not (a3 ~= nil) then
        function v2() -- Line: 624 -- upvalues: matcherHint (upval), a1 (val), a2 (val)
            return (matcherHint(a1, nil, "", a2)) .. "\n\nReceived function never threw"
        end
    else
        assert(a3 ~= nil)

        function v2() -- Line: 609
            -- upvalues: matcherHint (upval), a1 (val), a2 (val), a3 (val), formatReceived (upval), formatStack (upval)
            local v1 = (matcherHint(a1, nil, "", a2)) .. "\n\n"
            if a3 ~= nil and a3.hasMessage and not a3.value["$$robloxInternalJestError"] then
                return v1 .. (formatReceived("Error name:    ", a3, "name")) .. (formatReceived("Error message: ", a3, "message")) .. formatStack(a3)
            end
            return v1 .. (formatReceived("Thrown value: ", a3, "message")) .. formatStack(a3)
        end
    end
    return {message = v2, pass = v1}
end

function formatExpected(a1, a2) -- Line: 632 -- upvalues: printExpected (val) -- types: a1: string
    return a1 .. (printExpected(a2)) .. "\n"
end

function formatReceived(a1, a2, a3, a4) -- Line: 637
    -- upvalues: printReceivedStringContainExpectedSubstring (val), getType (val)
    -- upvalues: printReceivedStringContainExpectedResult (val), printReceived (val)
    if a2 == nil then
        return ""
    end
    if a3 == "message" then
        local message = a2.message
        if typeof(a4) ~= "string" then
            if getType(a4) == "regexp" then
                return a1 .. (printReceivedStringContainExpectedResult(message, a4:exec(message))) .. "\n"
            end
            return a1 .. (printReceived(message)) .. "\n"
        end
        local v1 = message:find(a4)
        if v1 then
            return a1 .. (printReceivedStringContainExpectedSubstring(message, v1, #a4)) .. "\n"
        end
        return a1 .. (printReceived(message)) .. "\n"
    end
    if a3 == "name" then
        if a2.isError then
            return a1 .. (printReceived(a2.value.name)) .. "\n"
        end
        return ""
    end
    if a3 ~= "value" or a2.isError then
        return ""
    end
    return a1 .. (printReceived(a2.value)) .. "\n"
end

function formatStack(a1) -- Line: 684 -- upvalues: formatStackTrace (val) -- types: a1: table
    if a1 ~= nil and a1.isError then
        return formatStackTrace(a1.value.stack, {testMatch = {}}, {noStackTrace = true})
    end
    return ""
end

return {
    createMatcher = function(a1, a2) -- Line: 98
        -- upvalues: isError (val), getThrown (val), Error (val), matcherErrorMessage (val), matcherHint (val)
        -- upvalues: RECEIVED_COLOR (val), printWithType (val), printReceived (val), getType (val), stringify (val)
        -- upvalues: toThrow (ref), toThrowExpectedAsymmetric (ref), toThrowExpectedString (ref)
        -- upvalues: toThrowExpectedRegExp (ref), toThrowExpectedClass (ref), toThrowExpectedObject (ref)
        -- upvalues: EXPECTED_COLOR (val), printExpected (val)
        return function(a1_2, a2_2, a3) -- Line: 99
            -- upvalues: a2 (val), isError (upval), getThrown (upval), Error (upval), matcherErrorMessage (upval)
            -- upvalues: matcherHint (upval), a1 (val), RECEIVED_COLOR (upval), printWithType (upval)
            -- upvalues: printReceived (upval), getType (upval), stringify (upval), toThrow (upval)
            -- upvalues: toThrowExpectedAsymmetric (upval), toThrowExpectedString (upval), toThrowExpectedRegExp (upval)
            -- upvalues: toThrowExpectedClass (upval), toThrowExpectedObject (upval), EXPECTED_COLOR (upval)
            -- upvalues: printExpected (upval)
            local diffStack, getTopStackEntry, result, success, u65, v1
            local v2 = {isNot = a1_2.isNot, promise = a1_2.promise}
            local v3 = nil
            if not a2 then
                if typeof(a2_2) == "function" then
                    function getTopStackEntry(a1) -- Line: 146
                        return string.match(a1, "[^\n]+")
                    end

                    function diffStack(a1, a2) -- Line: 152
                        local v1 = ""
                        local v2 = ""
                        local v3 = string.match(a1, "[^\n]+")
                        for i in string.gmatch(a2, "[^\n]+") do
                            if i == v3 then
                                return v2
                            end
                            v1 = v1 .. "\n" .. i
                        end
                        return nil
                    end

                    u65 = nil
                    success, result = xpcall(function() -- Line: 171 -- upvalues: u65 (ref), a2_2 (val)
                        u65 = debug.traceback(nil, 2)
                        a2_2()
                    end, function(a1) -- Line: 174 -- upvalues: getType (upval), diffStack (val), u65 (ref), stringify (upval), Error (upval)
                        local v1, v2, v3
                        if a1 == nil then
                            v2 = Error.new("nil")
                            Error.__captureStackTrace(v2, 3)
                            _, v3 = string.find(v2.stack, string.match(v2.stack, "[^\n]+"), 1, true)
                            v2.stack = string.sub(v2.stack, v3 + 1 + 1)
                            v2.stack = diffStack(u65, v2.stack)
                            v2["$$robloxInternalJestError"] = true
                            return v2
                        end
                        if getType(a1) == "error" then
                            if a1.stack == nil then
                                a1.stack = diffStack(u65, debug.traceback())
                                return a1
                            end
                            if not a1.stack:find("ThrowMatchers%-test%.js") then
                                a1.stack = diffStack(u65, a1.stack)
                            end
                            return a1
                        end
                        if typeof(a1) == "table" and a1.message then
                            if a1.stack == nil then
                                a1.stack = diffStack(u65, debug.traceback())
                                return a1
                            end
                            if not a1.stack:find("ThrowMatchers%-test%.js") then
                                a1.stack = diffStack(u65, a1.stack)
                            end
                            return a1
                        end
                        if typeof(a1) ~= "string" then
                            v1 = if typeof(a1) ~= "table" then a1 else stringify(a1)
                        else
                            _, _, v3 = a1:find("[%S+\\.]+:[0-9]+:%s(.*)")
                            v1 = if v3 == nil then a1 else v3
                        end
                        v2 = Error.new(v1)
                        Error.__captureStackTrace(v2, 3)
                        _, v3 = string.find(v2.stack, string.match(v2.stack, "[^\n]+"), 1, true)
                        v2.stack = string.sub(v2.stack, v3 + 1 + 1)
                        v2.stack = diffStack(u65, v2.stack)
                        v2["$$robloxInternalJestError"] = true
                        return v2
                    end)
                    if not success then
                        v3 = getThrown(result)
                    end
                elseif typeof(a2_2) ~= "table" or not getmetatable(a2_2) then
                    if not a2 then
                        v1 = if a3 ~= nil then "expected" else ""
                        error(Error(matcherErrorMessage(
                            matcherHint(a1, nil, v1, v2),
                            (RECEIVED_COLOR("received")) .. " value must be a function",
                            printWithType("Received", a2_2, printReceived)
                        )))
                    end
                elseif getmetatable(a2_2).__call then
                    function getTopStackEntry(a1) -- Line: 146
                        return string.match(a1, "[^\n]+")
                    end

                    function diffStack(a1, a2) -- Line: 152
                        local v1 = ""
                        local v2 = ""
                        local v3 = string.match(a1, "[^\n]+")
                        for i in string.gmatch(a2, "[^\n]+") do
                            if i == v3 then
                                return v2
                            end
                            v1 = v1 .. "\n" .. i
                        end
                        return nil
                    end

                    u65 = nil
                    success, result = xpcall(function() -- Line: 171 -- upvalues: u65 (ref), a2_2 (val)
                        u65 = debug.traceback(nil, 2)
                        a2_2()
                    end, function(a1) -- Line: 174 -- upvalues: getType (upval), diffStack (val), u65 (ref), stringify (upval), Error (upval)
                        local v1, v2, v3
                        if a1 == nil then
                            v2 = Error.new("nil")
                            Error.__captureStackTrace(v2, 3)
                            _, v3 = string.find(v2.stack, string.match(v2.stack, "[^\n]+"), 1, true)
                            v2.stack = string.sub(v2.stack, v3 + 1 + 1)
                            v2.stack = diffStack(u65, v2.stack)
                            v2["$$robloxInternalJestError"] = true
                            return v2
                        end
                        if getType(a1) == "error" then
                            if a1.stack == nil then
                                a1.stack = diffStack(u65, debug.traceback())
                                return a1
                            end
                            if not a1.stack:find("ThrowMatchers%-test%.js") then
                                a1.stack = diffStack(u65, a1.stack)
                            end
                            return a1
                        end
                        if typeof(a1) == "table" and a1.message then
                            if a1.stack == nil then
                                a1.stack = diffStack(u65, debug.traceback())
                                return a1
                            end
                            if not a1.stack:find("ThrowMatchers%-test%.js") then
                                a1.stack = diffStack(u65, a1.stack)
                            end
                            return a1
                        end
                        if typeof(a1) ~= "string" then
                            v1 = if typeof(a1) ~= "table" then a1 else stringify(a1)
                        else
                            _, _, v3 = a1:find("[%S+\\.]+:[0-9]+:%s(.*)")
                            v1 = if v3 == nil then a1 else v3
                        end
                        v2 = Error.new(v1)
                        Error.__captureStackTrace(v2, 3)
                        _, v3 = string.find(v2.stack, string.match(v2.stack, "[^\n]+"), 1, true)
                        v2.stack = string.sub(v2.stack, v3 + 1 + 1)
                        v2.stack = diffStack(u65, v2.stack)
                        v2["$$robloxInternalJestError"] = true
                        return v2
                    end)
                    if not success then
                        v3 = getThrown(result)
                    end
                elseif not a2 then
                    v1 = if a3 ~= nil then "expected" else ""
                    error(Error(matcherErrorMessage(
                        matcherHint(a1, nil, v1, v2),
                        (RECEIVED_COLOR("received")) .. " value must be a function",
                        printWithType("Received", a2_2, printReceived)
                    )))
                end
            elseif isError(a2_2) then
                v3 = getThrown(a2_2)
            elseif typeof(a2_2) == "function" then
                function getTopStackEntry(a1) -- Line: 146
                    return string.match(a1, "[^\n]+")
                end

                function diffStack(a1, a2) -- Line: 152
                    local v1 = ""
                    local v2 = ""
                    local v3 = string.match(a1, "[^\n]+")
                    for i in string.gmatch(a2, "[^\n]+") do
                        if i == v3 then
                            return v2
                        end
                        v1 = v1 .. "\n" .. i
                    end
                    return nil
                end

                u65 = nil
                success, result = xpcall(function() -- Line: 171 -- upvalues: u65 (ref), a2_2 (val)
                    u65 = debug.traceback(nil, 2)
                    a2_2()
                end, function(a1) -- Line: 174 -- upvalues: getType (upval), diffStack (val), u65 (ref), stringify (upval), Error (upval)
                    local v1, v2, v3
                    if a1 == nil then
                        v2 = Error.new("nil")
                        Error.__captureStackTrace(v2, 3)
                        _, v3 = string.find(v2.stack, string.match(v2.stack, "[^\n]+"), 1, true)
                        v2.stack = string.sub(v2.stack, v3 + 1 + 1)
                        v2.stack = diffStack(u65, v2.stack)
                        v2["$$robloxInternalJestError"] = true
                        return v2
                    end
                    if getType(a1) == "error" then
                        if a1.stack == nil then
                            a1.stack = diffStack(u65, debug.traceback())
                            return a1
                        end
                        if not a1.stack:find("ThrowMatchers%-test%.js") then
                            a1.stack = diffStack(u65, a1.stack)
                        end
                        return a1
                    end
                    if typeof(a1) == "table" and a1.message then
                        if a1.stack == nil then
                            a1.stack = diffStack(u65, debug.traceback())
                            return a1
                        end
                        if not a1.stack:find("ThrowMatchers%-test%.js") then
                            a1.stack = diffStack(u65, a1.stack)
                        end
                        return a1
                    end
                    if typeof(a1) ~= "string" then
                        v1 = if typeof(a1) ~= "table" then a1 else stringify(a1)
                    else
                        _, _, v3 = a1:find("[%S+\\.]+:[0-9]+:%s(.*)")
                        v1 = if v3 == nil then a1 else v3
                    end
                    v2 = Error.new(v1)
                    Error.__captureStackTrace(v2, 3)
                    _, v3 = string.find(v2.stack, string.match(v2.stack, "[^\n]+"), 1, true)
                    v2.stack = string.sub(v2.stack, v3 + 1 + 1)
                    v2.stack = diffStack(u65, v2.stack)
                    v2["$$robloxInternalJestError"] = true
                    return v2
                end)
                if not success then
                    v3 = getThrown(result)
                end
            elseif typeof(a2_2) ~= "table" or not getmetatable(a2_2) then
                if not a2 then
                    v1 = if a3 ~= nil then "expected" else ""
                    error(Error(matcherErrorMessage(
                        matcherHint(a1, nil, v1, v2),
                        (RECEIVED_COLOR("received")) .. " value must be a function",
                        printWithType("Received", a2_2, printReceived)
                    )))
                end
            elseif getmetatable(a2_2).__call then
                function getTopStackEntry(a1) -- Line: 146
                    return string.match(a1, "[^\n]+")
                end

                function diffStack(a1, a2) -- Line: 152
                    local v1 = ""
                    local v2 = ""
                    local v3 = string.match(a1, "[^\n]+")
                    for i in string.gmatch(a2, "[^\n]+") do
                        if i == v3 then
                            return v2
                        end
                        v1 = v1 .. "\n" .. i
                    end
                    return nil
                end

                u65 = nil
                success, result = xpcall(function() -- Line: 171 -- upvalues: u65 (ref), a2_2 (val)
                    u65 = debug.traceback(nil, 2)
                    a2_2()
                end, function(a1) -- Line: 174 -- upvalues: getType (upval), diffStack (val), u65 (ref), stringify (upval), Error (upval)
                    local v1, v2, v3
                    if a1 == nil then
                        v2 = Error.new("nil")
                        Error.__captureStackTrace(v2, 3)
                        _, v3 = string.find(v2.stack, string.match(v2.stack, "[^\n]+"), 1, true)
                        v2.stack = string.sub(v2.stack, v3 + 1 + 1)
                        v2.stack = diffStack(u65, v2.stack)
                        v2["$$robloxInternalJestError"] = true
                        return v2
                    end
                    if getType(a1) == "error" then
                        if a1.stack == nil then
                            a1.stack = diffStack(u65, debug.traceback())
                            return a1
                        end
                        if not a1.stack:find("ThrowMatchers%-test%.js") then
                            a1.stack = diffStack(u65, a1.stack)
                        end
                        return a1
                    end
                    if typeof(a1) == "table" and a1.message then
                        if a1.stack == nil then
                            a1.stack = diffStack(u65, debug.traceback())
                            return a1
                        end
                        if not a1.stack:find("ThrowMatchers%-test%.js") then
                            a1.stack = diffStack(u65, a1.stack)
                        end
                        return a1
                    end
                    if typeof(a1) ~= "string" then
                        v1 = if typeof(a1) ~= "table" then a1 else stringify(a1)
                    else
                        _, _, v3 = a1:find("[%S+\\.]+:[0-9]+:%s(.*)")
                        v1 = if v3 == nil then a1 else v3
                    end
                    v2 = Error.new(v1)
                    Error.__captureStackTrace(v2, 3)
                    _, v3 = string.find(v2.stack, string.match(v2.stack, "[^\n]+"), 1, true)
                    v2.stack = string.sub(v2.stack, v3 + 1 + 1)
                    v2.stack = diffStack(u65, v2.stack)
                    v2["$$robloxInternalJestError"] = true
                    return v2
                end)
                if not success then
                    v3 = getThrown(result)
                end
            elseif not a2 then
                v1 = if a3 ~= nil then "expected" else ""
                error(Error(matcherErrorMessage(
                    matcherHint(a1, nil, v1, v2),
                    (RECEIVED_COLOR("received")) .. " value must be a function",
                    printWithType("Received", a2_2, printReceived)
                )))
            end
            if a3 == nil then
                return toThrow(a1, v2, v3)
            end
            if typeof(a3) == "table" and typeof(a3.asymmetricMatch) == "function" then
                return toThrowExpectedAsymmetric(a1, v2, v3, a3)
            end
            if typeof(a3) == "string" then
                return toThrowExpectedString(a1, v2, v3, a3)
            end
            if getType(a3) == "regexp" then
                return toThrowExpectedRegExp(a1, v2, v3, a3)
            end
            if typeof(a3) == "table" and typeof(a3.test) == "function" and typeof(a3.exec) == "function" then
                return toThrowExpectedRegExp(a1, v2, v3, a3)
            end
            if typeof(a3) == "table" and not a3.message then
                return toThrowExpectedClass(a1, v2, v3, a3)
            end
            if typeof(a3) == "table" then
                return toThrowExpectedObject(a1, v2, v3, a3)
            end
            error(Error(matcherErrorMessage(
                matcherHint(a1, nil, nil, v2),
                (EXPECTED_COLOR("expected")) .. " value must be a string or regular expression or class or error",
                printWithType("Expected", a3, printExpected)
            )))
        end
    end,
    matchers = v3,
}