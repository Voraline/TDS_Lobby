-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_expect@3.10.0.expect.matchers
-- Decompile time: 23.26 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Error = v1.Error
local Number = v1.Number
local Object = v1.Object
local instanceof = v1.instanceof
require(script.Parent.Parent:WaitForChild("luau-regexp"))
local v2 = require(script.Parent.Parent:WaitForChild("jest-get-type"))
local getType = v2.getType
local isPrimitive = v2.isPrimitive
local v3 = require(script.Parent.Parent:WaitForChild("jest-matcher-utils"))
local DIM_COLOR = v3.DIM_COLOR
local EXPECTED_COLOR = v3.EXPECTED_COLOR
local RECEIVED_COLOR = v3.RECEIVED_COLOR
local SUGGEST_TO_CONTAIN_EQUAL = v3.SUGGEST_TO_CONTAIN_EQUAL
local ensureExpectedIsNonNegativeInteger = v3.ensureExpectedIsNonNegativeInteger
local ensureNoExpected = v3.ensureNoExpected
local ensureNumbers = v3.ensureNumbers
local getLabelPrinter = v3.getLabelPrinter
local matcherErrorMessage = v3.matcherErrorMessage
local matcherHint = v3.matcherHint
local printDiffOrStringify = v3.printDiffOrStringify
local printExpected = v3.printExpected
local printReceived = v3.printReceived
local printWithType = v3.printWithType
local stringify = v3.stringify
local equals = require(script.Parent:WaitForChild("jasmineUtils")).equals
local print = require(script.Parent:WaitForChild("print"))
local printCloseTo = print.printCloseTo
local printExpectedConstructorName = print.printExpectedConstructorName
local printExpectedConstructorNameNot = print.printExpectedConstructorNameNot
local printReceivedArrayContainExpectedItem = print.printReceivedArrayContainExpectedItem
local printReceivedConstructorName = print.printReceivedConstructorName
local printReceivedConstructorNameNot = print.printReceivedConstructorNameNot
local printReceivedStringContainExpectedResult = print.printReceivedStringContainExpectedResult
local printReceivedStringContainExpectedSubstring = print.printReceivedStringContainExpectedSubstring
require(script.Parent:WaitForChild("types"))
local utils = require(script.Parent:WaitForChild("utils"))
local getObjectSubset = utils.getObjectSubset
local getPath = utils.getPath
local iterableEquality = utils.iterableEquality
local pathAsArray = utils.pathAsArray
local subsetEquality = utils.subsetEquality
local typeEquality = utils.typeEquality
local v4 = require(script.Parent.Parent:WaitForChild("jest-roblox-shared"))
local instanceSubsetEquality = v4.RobloxInstance.instanceSubsetEquality
local getInstanceSubset = v4.RobloxInstance.getInstanceSubset

local function isExpand(a1) -- Line: 82 -- types: a1: boolean?
    return not not a1
end

local u119 = {typeEquality}

local function toBeNan(a1, a2, a3) -- Line: 470
    -- upvalues: ensureNoExpected (val), Number (val), matcherHint (val), printReceived (val)
    local u3 = {isNot = a1.isNot, promise = a1.promise}
    ensureNoExpected(a3, "toBeNan", u3)
    local v1 = Number.isNaN(a2)
    return {
        message = function() -- Line: 485 -- upvalues: matcherHint (upval), u3 (val), printReceived (upval), a2 (val)
            return (matcherHint("toBeNan", nil, "", u3)) .. "\n\n" .. string.format("Received: %s", printReceived(a2))
        end,
        pass = v1,
    }
end

local function toBeNil(a1, a2, a3) -- Line: 494
    -- upvalues: ensureNoExpected (val), matcherHint (val), printReceived (val)
    local u3 = {isNot = a1.isNot, promise = a1.promise}
    ensureNoExpected(a3, "toBeNil", u3)
    local v1 = a2 == nil
    return {
        message = function() -- Line: 509 -- upvalues: matcherHint (upval), u3 (val), printReceived (upval), a2 (val)
            return (matcherHint("toBeNil", nil, "", u3)) .. "\n\n" .. string.format("Received: %s", printReceived(a2))
        end,
        pass = v1,
    }
end

return {
    toBe = function(a1, a2, a3) -- Line: 103
        -- upvalues: Object (val), matcherHint (val), printExpected (val), equals (val), iterableEquality (val)
        -- upvalues: DIM_COLOR (val), printDiffOrStringify (val)
        local u3 = {comment = "Object.is equality", isNot = a1.isNot, promise = a1.promise}
        local v1 = Object.is(a2, a3)
        return {
            name = "toBe",
            actual = a2,
            expected = a3,
            message = if not v1 then function() -- Line: 126
                -- upvalues: equals (upval), a2 (val), a3 (val), iterableEquality (upval), matcherHint (upval), u3 (val)
                -- upvalues: DIM_COLOR (upval), printDiffOrStringify (upval), a1 (val)
                local v1 = nil
                if equals(a2, a3, {iterableEquality}) then
                    v1 = "toEqual"
                end
                local v2 = (matcherHint("toBe", nil, nil, u3)) .. "\n\n"
                if v1 ~= nil then
                    v2 = v2 .. (DIM_COLOR(string.format("If it should pass with deep equality, replace \"%s\" with \"%s\"", "toBe", v1))) .. "\n\n"
                end
                return v2 .. printDiffOrStringify(a3, a2, "Expected", "Received", not not a1.expand)
            end else function() -- Line: 120 -- upvalues: matcherHint (upval), u3 (val), printExpected (upval), a3 (val)
                return (matcherHint("toBe", nil, nil, u3)) .. "\n\n" .. string.format("Expected: never %s", printExpected(a3))
            end,
            pass = v1,
        }
    end,
    toBeCloseTo = function(a1, a2, a3, a4) -- Line: 161
        -- upvalues: Error (val), matcherErrorMessage (val), matcherHint (val), EXPECTED_COLOR (val)
        -- upvalues: printWithType (val), printExpected (val), RECEIVED_COLOR (val), printReceived (val)
        -- upvalues: printCloseTo (val)
        local v1
        local v2 = nil
        if not a4 then
            a4 = 2
        else
            v2 = "precision"
        end
        local isNot = a1.isNot
        local u9 = {isNot = isNot, promise = a1.promise, secondArgument = v2}

        function u9.secondArgumentColor(a1) -- Line: 181 -- types: a1: string
            return a1
        end

        if typeof(a3) ~= "number" then
            error(Error(matcherErrorMessage(
                matcherHint("toBeCloseTo", nil, nil, u9),
                string.format("%s value must be a number", EXPECTED_COLOR("expected")),
                printWithType("Expected", a3, printExpected)
            )))
        end
        if typeof(a2) ~= "number" then
            error(Error(matcherErrorMessage(
                matcherHint("toBeCloseTo", nil, nil, u9),
                string.format("%s value must be a number", RECEIVED_COLOR("received")),
                printWithType("Received", a2, printReceived)
            )))
        end
        local u87 = 0
        local u93 = 0
        if a2 ~= (1 / 0) then
            if a2 ~= (-1 / 0) or a3 ~= (-1 / 0) then
                u87 = 10 ^ (-a4) / 2
                u93 = math.abs(a3 - a2)
                v1 = u93 < u87
            else
                v1 = true
            end
        elseif a3 == (1 / 0) then
            v1 = true
        elseif a2 ~= (-1 / 0) or a3 ~= (-1 / 0) then
            u87 = 10 ^ (-a4) / 2
            u93 = math.abs(a3 - a2)
            v1 = u93 < u87
        else
            v1 = true
        end
        return {
            message = if not v1 then function() -- Line: 239
                -- upvalues: matcherHint (upval), u9 (val), printExpected (upval), a3 (val), printReceived (upval)
                -- upvalues: a2 (val), printCloseTo (upval), u93 (ref), u87 (ref), a4 (ref), isNot (val)
                return (matcherHint("toBeCloseTo", nil, nil, u9)) .. "\n\n" .. (string.format("Expected: %s\n", printExpected(a3))) .. (string.format("Received: %s\n", printReceived(a2))) .. "\n" .. printCloseTo(u93, u87, a4, isNot)
            end else function() -- Line: 226
                -- upvalues: matcherHint (upval), u9 (val), printExpected (upval), a3 (val), u93 (ref)
                -- upvalues: printReceived (upval), a2 (val), printCloseTo (upval), u87 (ref), a4 (ref), isNot (val)
                local v1 = (matcherHint("toBeCloseTo", nil, nil, u9)) .. "\n\n" .. string.format("Expected: never %s\n", printExpected(a3))
                if u93 == 0 then
                    return v1
                end
                return v1 .. (string.format("Received:       %s\n", printReceived(a2))) .. "\n" .. printCloseTo(u93, u87, a4, isNot)
            end,
            pass = v1,
        }
    end,
    toBeDefined = function(a1, a2, a3) -- Line: 253
        -- upvalues: ensureNoExpected (val), matcherHint (val), printReceived (val)
        local u3 = {isNot = a1.isNot, promise = a1.promise}
        ensureNoExpected(a3, "toBeDefined", u3)
        local v1 = a2 ~= nil
        return {
            message = function() -- Line: 268 -- upvalues: matcherHint (upval), u3 (val), printReceived (upval), a2 (val)
                return (matcherHint("toBeDefined", nil, "", u3)) .. "\n\n" .. string.format("Received: %s", printReceived(a2))
            end,
            pass = v1,
        }
    end,
    toBeFalsy = function(a1, a2, a3) -- Line: 278
        -- upvalues: ensureNoExpected (val), matcherHint (val), printReceived (val)
        local u3 = {isNot = a1.isNot, promise = a1.promise}
        ensureNoExpected(a3, "toBeFalsy", u3)
        return {
            message = function() -- Line: 293 -- upvalues: matcherHint (upval), u3 (val), printReceived (upval), a2 (val)
                return (matcherHint("toBeFalsy", nil, "", u3)) .. "\n\n" .. string.format("Received: %s", printReceived(a2))
            end,
            pass = not a2,
        }
    end,
    toBeGreaterThan = function(a1, a2, a3) -- Line: 302
        -- upvalues: ensureNumbers (val), matcherHint (val), printExpected (val), printReceived (val)
        local isNot = a1.isNot
        local u4 = {isNot = isNot, promise = a1.promise}
        ensureNumbers(a2, a3, "toBeGreaterThan", u4)
        local v1 = a3 < a2
        return {
            message = function() -- Line: 318
                -- upvalues: matcherHint (upval), u4 (val), isNot (val), printExpected (upval), a3 (val)
                -- upvalues: printReceived (upval), a2 (val)
                local v1 = matcherHint("toBeGreaterThan", nil, nil, u4)
                local v2 = string.format("Expected:%s > %s\n", if not isNot then "" else " never", printExpected(a3))
                local format_2 = string.format
                return v1 .. "\n\n" .. v2 .. format_2("Received:%s   %s", if not isNot then "" else "      ", printReceived(a2))
            end,
            pass = v1,
        }
    end,
    toBeGreaterThanOrEqual = function(a1, a2, a3) -- Line: 328
        -- upvalues: ensureNumbers (val), matcherHint (val), printExpected (val), printReceived (val)
        local isNot = a1.isNot
        local u4 = {isNot = isNot, promise = a1.promise}
        ensureNumbers(a2, a3, "toBeGreaterThanOrEqual", u4)
        local v1 = a3 <= a2
        return {
            message = function() -- Line: 344
                -- upvalues: matcherHint (upval), u4 (val), isNot (val), printExpected (upval), a3 (val)
                -- upvalues: printReceived (upval), a2 (val)
                local v1 = matcherHint("toBeGreaterThanOrEqual", nil, nil, u4)
                local v2 = string.format("Expected:%s >= %s\n", if not isNot then "" else " never", printExpected(a3))
                local format_2 = string.format
                return v1 .. "\n\n" .. v2 .. format_2("Received:%s    %s", if not isNot then "" else "      ", printReceived(a2))
            end,
            pass = v1,
        }
    end,
    toBeInstanceOf = function(a1, a2, a3) -- Line: 355
        -- upvalues: Error (val), matcherErrorMessage (val), matcherHint (val), EXPECTED_COLOR (val)
        -- upvalues: printWithType (val), printExpected (val), instanceof (val), printExpectedConstructorNameNot (val)
        -- upvalues: printReceivedConstructorNameNot (val), printExpectedConstructorName (val), isPrimitive (val)
        -- upvalues: printReceived (val), printReceivedConstructorName (val)
        local u4 = {isNot = a1.isNot, promise = a1.promise}
        if typeof(a3) ~= "table" then
            error(Error(matcherErrorMessage(
                matcherHint("toBeInstanceOf", nil, nil, u4),
                string.format("%s value must be a prototype class", EXPECTED_COLOR("expected")),
                printWithType("Expected", a3, printExpected)
            )))
        end
        local v1 = instanceof(a2, a3)
        local __index = nil
        if typeof((getmetatable(a2))) == "table" and typeof((getmetatable(a2)).__index) == "table" then
            __index = getmetatable(a2).__index
        end
        return {
            message = if not v1 then function() -- Line: 400
                -- upvalues: matcherHint (upval), u4 (val), printExpectedConstructorName (upval), a3 (val)
                -- upvalues: isPrimitive (upval), a2 (val), __index (ref), printReceived (upval)
                -- upvalues: printReceivedConstructorName (upval)
                local v1 = (matcherHint("toBeInstanceOf", nil, nil, u4)) .. "\n\n" .. printExpectedConstructorName("Expected constructor", a3)
                if not isPrimitive(a2) and __index ~= nil then
                    return v1 .. printReceivedConstructorName("Received constructor", __index)
                end
                return v1 .. string.format("\nReceived value has no prototype\nReceived value: %s", printReceived(a2))
            end else function() -- Line: 388
                -- upvalues: matcherHint (upval), u4 (val), printExpectedConstructorNameNot (upval), a3 (val)
                -- upvalues: __index (ref), printReceivedConstructorNameNot (upval)
                local v1 = (matcherHint("toBeInstanceOf", nil, nil, u4)) .. "\n\n" .. printExpectedConstructorNameNot("Expected constructor", a3)
                if __index and __index ~= a3 then
                    v1 = v1 .. printReceivedConstructorNameNot("Received constructor", __index, a3)
                end
                return v1
            end,
            pass = v1,
        }
    end,
    toBeLessThan = function(a1, a2, a3) -- Line: 418
        -- upvalues: ensureNumbers (val), matcherHint (val), printExpected (val), printReceived (val)
        local isNot = a1.isNot
        local u4 = {isNot = isNot, promise = a1.promise}
        ensureNumbers(a2, a3, "toBeLessThan", u4)
        local v1 = a2 < a3
        return {
            message = function() -- Line: 434
                -- upvalues: matcherHint (upval), u4 (val), isNot (val), printExpected (upval), a3 (val)
                -- upvalues: printReceived (upval), a2 (val)
                local v1 = matcherHint("toBeLessThan", nil, nil, u4)
                local v2 = string.format("Expected:%s < %s\n", if not isNot then "" else " never", printExpected(a3))
                local format_2 = string.format
                return v1 .. "\n\n" .. v2 .. format_2("Received:%s   %s", if not isNot then "" else "      ", printReceived(a2))
            end,
            pass = v1,
        }
    end,
    toBeLessThanOrEqual = function(a1, a2, a3) -- Line: 444
        -- upvalues: ensureNumbers (val), matcherHint (val), printExpected (val), printReceived (val)
        local isNot = a1.isNot
        local u4 = {isNot = isNot, promise = a1.promise}
        ensureNumbers(a2, a3, "toBeLessThanOrEqual", u4)
        local v1 = a2 <= a3
        return {
            message = function() -- Line: 460
                -- upvalues: matcherHint (upval), u4 (val), isNot (val), printExpected (upval), a3 (val)
                -- upvalues: printReceived (upval), a2 (val)
                local v1 = matcherHint("toBeLessThanOrEqual", nil, nil, u4)
                local v2 = string.format("Expected:%s <= %s\n", if not isNot then "" else " never", printExpected(a3))
                local format_2 = string.format
                return v1 .. "\n\n" .. v2 .. format_2("Received:%s    %s", if not isNot then "" else "      ", printReceived(a2))
            end,
            pass = v1,
        }
    end,
    toBeNan = toBeNan,
    toBeNaN = toBeNan,
    toBeNil = toBeNil,
    toBeNull = toBeNil,
    toBeTruthy = function(a1, a2, a3) -- Line: 518
        -- upvalues: ensureNoExpected (val), matcherHint (val), printReceived (val)
        local u3 = {isNot = a1.isNot, promise = a1.promise}
        ensureNoExpected(a3, "toBeTruthy", u3)
        return {
            message = function() -- Line: 533 -- upvalues: matcherHint (upval), u3 (val), printReceived (upval), a2 (val)
                return (matcherHint("toBeTruthy", nil, "", u3)) .. "\n\n" .. string.format("Received: %s", printReceived(a2))
            end,
            pass = not not a2,
        }
    end,
    toBeUndefined = function(a1, a2, a3) -- Line: 543
        -- upvalues: ensureNoExpected (val), matcherHint (val), printReceived (val)
        local u3 = {isNot = a1.isNot, promise = a1.promise}
        ensureNoExpected(a3, "toBeUndefined", u3)
        local v1 = a2 == nil
        return {
            message = function() -- Line: 558 -- upvalues: matcherHint (upval), u3 (val), printReceived (upval), a2 (val)
                return (matcherHint("toBeUndefined", nil, "", u3)) .. "\n\n" .. string.format("Received: %s", printReceived(a2))
            end,
            pass = v1,
        }
    end,
    toContain = function(a1, a2, a3) -- Line: 567
        -- upvalues: Error (val), matcherErrorMessage (val), matcherHint (val), RECEIVED_COLOR (val)
        -- upvalues: printWithType (val), printReceived (val), EXPECTED_COLOR (val), printExpected (val)
        -- upvalues: getLabelPrinter (val), printReceivedStringContainExpectedSubstring (val), Array (val)
        -- upvalues: getType (val), printReceivedArrayContainExpectedItem (val), equals (val), iterableEquality (val)
        -- upvalues: SUGGEST_TO_CONTAIN_EQUAL (val)
        local v1
        local isNot = a1.isNot
        local u4 = {comment = "string.find or table.find", isNot = isNot, promise = a1.promise}
        if a2 == nil then
            error(Error(matcherErrorMessage(
                matcherHint("toContain", nil, nil, u4),
                string.format("%s value must not be nil", RECEIVED_COLOR("received")),
                printWithType("Received", a2, printReceived)
            )))
        end
        if typeof(a2) ~= "string" then
            local u110 = table.find(Array.from(a2), a3)
            v1 = u110 ~= nil
            return {
                message = function() -- Line: 649
                    -- upvalues: getType (upval), a2 (val), getLabelPrinter (upval), matcherHint (upval), u4 (val)
                    -- upvalues: isNot (val), printExpected (upval), a3 (val), Array (upval)
                    -- upvalues: printReceivedArrayContainExpectedItem (upval), u110 (val), printReceived (upval)
                    -- upvalues: equals (upval), iterableEquality (upval), SUGGEST_TO_CONTAIN_EQUAL (upval)
                    local v1 = string.format("Received %s", getType(a2))
                    local v2 = getLabelPrinter("Expected value", v1)
                    local v3 = matcherHint("toContain", nil, nil, u4)
                    local format = string.format
                    local v4 = if not isNot then "" else "never "
                    local v5 = format("%s%s%s\n", v2("Expected value"), v4, printExpected(a3))
                    local format_2 = string.format
                    local v6 = if not isNot then "" else "      "
                    local v7 = v3 .. "\n\n" .. v5 .. format_2("%s%s", v2(v1), v6)
                    v7 = if not isNot then v7 .. printReceived(a2) else if not Array.isArray(a2) then v7 .. printReceived(a2) else v7 .. printReceivedArrayContainExpectedItem(a2, u110)
                    if not isNot
                        and Array.findIndex(a2, function(a1) -- Line: 665 -- upvalues: equals (upval), a3 (upval), iterableEquality (upval)
                            local v1, v3, v4
                            v1 = equals
                            v3 = a3
                            v4 = {}
                            v4[1] = iterableEquality
                            return v1(a1, v3, v4)
                        end) ~= -1 then
                        v7 = v7 .. string.format("\n\n%s", SUGGEST_TO_CONTAIN_EQUAL)
                    end
                    return v7
                end,
                pass = v1,
            }
        end
        local v2 = ("%s value must be a string if %s value is a string"):format(EXPECTED_COLOR("expected"), (RECEIVED_COLOR("received")))
        if typeof(a3) ~= "string" then
            error(Error.new(matcherErrorMessage(
                matcherHint("toContain", a2, tostring(a3), u4),
                v2,
                (tostring((printWithType("Expected", a3, printExpected)))) .. "\n" .. tostring((printWithType("Received", a2, printReceived)))
            )))
        end
        local u89 = a2:find(tostring(a3), 1, true)
        v1 = u89 ~= nil
        return {
            message = function() -- Line: 615
                -- upvalues: a3 (val), getLabelPrinter (upval), matcherHint (upval), u4 (val), isNot (val)
                -- upvalues: printExpected (upval), printReceivedStringContainExpectedSubstring (upval), a2 (val)
                -- upvalues: u89 (val), printReceived (upval)
                local v1 = string.format("Expected %s", if typeof(a3) ~= "string" then "value" else "substring")
                local v2 = getLabelPrinter(v1, "Received string")
                local v3 = matcherHint("toContain", nil, nil, u4)
                local format_2 = string.format
                local v4 = if not isNot then "" else "never "
                local v5 = format_2("%s%s%s\n", v2(v1), v4, printExpected(a3))
                local format_3 = string.format
                v4 = v2("Received string")
                local v6 = isNot and printReceivedStringContainExpectedSubstring(a2, u89, #tostring(a3)) or printReceived(a2)
                return v3 .. "\n\n" .. v5 .. format_3("%s%s%s", v4, if not isNot then "" else "      ", v6)
            end,
            pass = v1,
        }
    end,
    toContainEqual = function(a1, a2, a3) -- Line: 679
        -- upvalues: Error (val), matcherErrorMessage (val), matcherHint (val), RECEIVED_COLOR (val)
        -- upvalues: printWithType (val), printReceived (val), Array (val), equals (val), iterableEquality (val)
        -- upvalues: getType (val), getLabelPrinter (val), printExpected (val)
        -- upvalues: printReceivedArrayContainExpectedItem (val)
        local isNot = a1.isNot
        local u4 = {comment = "deep equality", isNot = isNot, promise = a1.promise}
        if a2 == nil then
            error(Error(matcherErrorMessage(
                matcherHint("toContainEqual", nil, nil, u4),
                string.format("%s value must not be nil", RECEIVED_COLOR("received")),
                printWithType("Received", a2, printReceived)
            )))
        end
        local u38 = Array.findIndex(Array.from(a2), function(a1) -- Line: 705 -- upvalues: equals (upval), a3 (val), iterableEquality (upval)
            return equals(a1, a3, {iterableEquality})
        end)
        local v1 = u38 ~= -1
        return {
            message = function() -- Line: 710
                -- upvalues: getType (upval), a2 (val), getLabelPrinter (upval), matcherHint (upval), u4 (val)
                -- upvalues: isNot (val), printExpected (upval), a3 (val), Array (upval)
                -- upvalues: printReceivedArrayContainExpectedItem (upval), u38 (val), printReceived (upval)
                local v1 = string.format("Received %s", getType(a2))
                local v2 = getLabelPrinter("Expected value", v1)
                local v3 = matcherHint("toContainEqual", nil, nil, u4)
                local format = string.format
                local v4 = if not isNot then "" else "never "
                local v5 = format("%s%s%s\n", v2("Expected value"), v4, printExpected(a3))
                local format_2 = string.format
                local v6 = if not isNot then "" else "      "
                local v7 = v3 .. "\n\n" .. v5 .. format_2("%s%s", v2(v1), v6)
                if isNot and Array.isArray(a2) then
                    return v7 .. printReceivedArrayContainExpectedItem(a2, u38)
                end
                return v7 .. printReceived(a2)
            end,
            pass = v1,
        }
    end,
    toEqual = function(a1, a2, a3) -- Line: 731
        -- upvalues: equals (val), iterableEquality (val), matcherHint (val), printExpected (val), stringify (val)
        -- upvalues: printReceived (val), printDiffOrStringify (val)
        local u3 = {comment = "deep equality", isNot = a1.isNot, promise = a1.promise}
        local v1 = equals(a2, a3, {iterableEquality})
        return {
            name = "toEqual",
            actual = a2,
            expected = a3,
            message = if not v1 then function() -- Line: 758
                -- upvalues: matcherHint (upval), u3 (val), printDiffOrStringify (upval), a3 (val), a2 (val), a1 (val)
                return (matcherHint("toEqual", nil, nil, u3)) .. "\n\n" .. printDiffOrStringify(a3, a2, "Expected", "Received", not not a1.expand)
            end else function() -- Line: 748
                -- upvalues: matcherHint (upval), u3 (val), printExpected (upval), a3 (val), stringify (upval), a2 (val)
                -- upvalues: printReceived (upval)
                local v1 = (matcherHint("toEqual", nil, nil, u3)) .. "\n\n" .. string.format("Expected: never %s\n", printExpected(a3))
                if (stringify(a3)) ~= stringify(a2) then
                    v1 = v1 .. string.format("Received:       %s", printReceived(a2))
                end
                return v1
            end,
            pass = v1,
        }
    end,
    toHaveLength = function(a1, a2, a3) -- Line: 771
        -- upvalues: Array (val), Error (val), matcherErrorMessage (val), matcherHint (val), RECEIVED_COLOR (val)
        -- upvalues: printWithType (val), printReceived (val), ensureExpectedIsNonNegativeInteger (val), getType (val)
        -- upvalues: getLabelPrinter (val), printExpected (val)
        local isNot = a1.isNot
        local u4 = {isNot = isNot, promise = a1.promise}
        local v1 = false
        if typeof(a2) == "table" then
            v1 = typeof(a2.length) == "number"
        end
        if not Array.isArray(a2) and typeof(a2) ~= "string" and not v1 then
            error(Error(matcherErrorMessage(
                matcherHint("toHaveLength", nil, nil, u4),
                string.format("%s value must have a length property whose value must be a number", RECEIVED_COLOR("received")),
                printWithType("Received", a2, printReceived)
            )))
        end
        ensureExpectedIsNonNegativeInteger(a3, "toHaveLength", u4)
        local length = if a2.length == nil then #a2 else a2.length
        local v2 = length == a3
        return {
            message = function() -- Line: 814
                -- upvalues: getType (upval), a2 (val), getLabelPrinter (upval), matcherHint (upval), u4 (val)
                -- upvalues: isNot (val), printExpected (upval), a3 (val), printReceived (upval), length (ref)
                local v1 = string.format("Received %s", getType(a2))
                local v2 = getLabelPrinter("Expected length", "Received length", v1)
                local v3 = matcherHint("toHaveLength", nil, nil, u4)
                local format = string.format
                local v4 = if not isNot then "" else "never "
                local v5 = v3 .. "\n\n" .. format("%s%s%s\n", v2("Expected length"), v4, printExpected(a3))
                if not isNot then
                    v5 = v5 .. string.format("%s%s\n", v2("Received length"), printReceived(length))
                end
                local format_3 = string.format
                v4 = if not isNot then "" else "      "
                return v5 .. format_3("%s%s%s", v2(v1), v4, printReceived(a2))
            end,
            pass = v2,
        }
    end,
    toHaveProperty = function(a1, a2, a3, a4) -- Line: 839
        -- upvalues: Error (val), matcherErrorMessage (val), matcherHint (val), RECEIVED_COLOR (val)
        -- upvalues: printWithType (val), printReceived (val), getType (val), EXPECTED_COLOR (val), printExpected (val)
        -- upvalues: pathAsArray (val), getPath (val), equals (val), iterableEquality (val), stringify (val)
        -- upvalues: printDiffOrStringify (val)
        local u5 = a4 ~= nil
        local u6 = {isNot = a1.isNot, promise = a1.promise}
        u6.secondArgument = if not u5 then "" else "value"
        if a2 == nil then
            error(Error(matcherErrorMessage(
                matcherHint("toHaveProperty", nil, "path", u6),
                string.format("%s value must not be nil", RECEIVED_COLOR("received")),
                printWithType("Received", a2, printReceived)
            )))
        end
        local u45 = getType(a3)
        if u45 ~= "string" and u45 ~= "table" then
            error(Error(matcherErrorMessage(
                matcherHint("toHaveProperty", nil, "path", u6),
                string.format("%s path must be a string or array", EXPECTED_COLOR("expected")),
                printWithType("Expected", a3, printExpected)
            )))
        end
        local v1 = if typeof(a3) ~= "string" then #a3 else #pathAsArray(a3)
        if u45 == "table" and v1 == 0 then
            error(Error(matcherErrorMessage(
                matcherHint("toHaveProperty", nil, "path", u6),
                string.format("%s path must not be an empty array", EXPECTED_COLOR("expected")),
                printWithType("Expected", a3, printExpected)
            )))
        end
        local v2 = getPath(a2, a3)
        local lastTraversedObject = v2.lastTraversedObject
        local hasEndProp = v2.hasEndProp
        local traversedPath = v2.traversedPath
        local u124 = #traversedPath == v1
        local value = if not u124 then lastTraversedObject else v2.value
        local v3 = if not u5 then not not hasEndProp else equals(v2.value, a4, {iterableEquality})
        return {
            message = if not v3 then function() -- Line: 942
                -- upvalues: matcherHint (upval), u6 (val), printExpected (upval), a3 (val), u124 (val)
                -- upvalues: printDiffOrStringify (upval), a4 (val), value (ref), a1 (val), u45 (val)
                -- upvalues: traversedPath (val), printReceived (upval), u5 (val)
                local v1 = (matcherHint("toHaveProperty", nil, "path", u6)) .. "\n\n" .. string.format("Expected path: %s\n", printExpected(a3))
                if u124 then
                    return v1 .. "\n" .. printDiffOrStringify(a4, value, "Expected value", "Received value", not not a1.expand)
                end
                v1 = v1 .. "Received path: "
                v1 = if u45 == "table" then v1 .. string.format("%s\n\n", printReceived(traversedPath)) else if #traversedPath ~= 0 then v1 .. string.format("%s\n\n", printReceived(table.concat(traversedPath, "."))) else v1 .. string.format("%s\n\n", printReceived(traversedPath))
                if u5 then
                    v1 = v1 .. string.format("Expected value: %s\n", printExpected(a4))
                end
                return v1 .. string.format("Received value: %s", printReceived(value))
            end else function() -- Line: 925
                -- upvalues: matcherHint (upval), u6 (val), u5 (val), printExpected (upval), a3 (val), a4 (val)
                -- upvalues: stringify (upval), value (ref), printReceived (upval)
                local v1 = (matcherHint("toHaveProperty", nil, "path", u6)) .. "\n\n"
                if not u5 then
                    return v1 .. (string.format("Expected path: never %s\n\n", printExpected(a3))) .. string.format("Received value: %s", printReceived(value))
                end
                v1 = v1 .. (string.format("Expected path: %s\n\n", printExpected(a3))) .. string.format("Expected value: never %s", printExpected(a4))
                if (stringify(a4)) ~= stringify(value) then
                    return v1 .. string.format("\nReceived value:       %s", printReceived(value))
                end
                return v1
            end,
            pass = v3,
        }
    end,
    toMatch = function(a1, a2, a3) -- Line: 978
        -- upvalues: Error (val), matcherErrorMessage (val), matcherHint (val), RECEIVED_COLOR (val)
        -- upvalues: printWithType (val), printReceived (val), getType (val), EXPECTED_COLOR (val), printExpected (val)
        -- upvalues: printReceivedStringContainExpectedSubstring (val), printReceivedStringContainExpectedResult (val)
        -- upvalues: getLabelPrinter (val)
        local v1
        local u3 = {isNot = a1.isNot, promise = a1.promise}
        if typeof(a2) ~= "string" then
            error(Error(matcherErrorMessage(
                matcherHint("toMatch", nil, nil, u3),
                string.format("%s value must be a string", RECEIVED_COLOR("received")),
                printWithType("Received", a2, printReceived)
            )))
        end
        local v2 = a3
        if typeof(v2) ~= "string" and getType(a3) ~= "regexp" then
            error(Error(matcherErrorMessage(
                matcherHint("toMatch", nil, nil, u3),
                string.format("%s value must be a string or regular expression", EXPECTED_COLOR("expected")),
                printWithType("Expected", a3, printExpected)
            )))
        end
        local v3 = a3
        if typeof(v3) ~= "string" then
            v1 = a3:test(a2)
        else
            a3 = string.gsub(a3, "\027%[", "\027%%[")
            local v4 = a3
            v1 = a2:find(v4) ~= nil
        end
        return {
            message = if not v1 then function() -- Line: 1052
                -- upvalues: getLabelPrinter (upval), matcherHint (upval), u3 (val), printExpected (upval), a3 (ref)
                -- upvalues: printReceived (upval), a2 (val)
                local v1 = getLabelPrinter("Expected pattern", "Received string")
                return (matcherHint("toMatch", nil, nil, u3)) .. "\n\n" .. (string.format("%s%s\n", v1("Expected pattern"), printExpected(a3))) .. string.format("%s%s", v1("Received string"), printReceived(a2))
            end else function() -- Line: 1027
                -- upvalues: matcherHint (upval), u3 (val), printExpected (upval), a3 (ref)
                -- upvalues: printReceivedStringContainExpectedSubstring (upval), a2 (val)
                -- upvalues: printReceivedStringContainExpectedResult (upval)
                local v1 = (matcherHint("toMatch", nil, nil, u3)) .. "\n\n" .. string.format("Expected pattern: never %s\n", printExpected(a3))
                if typeof(a3) == "string" then
                    return v1 .. string.format("Received string:        %s", printReceivedStringContainExpectedSubstring(a2, a2:find(a3), #a3))
                end
                return v1 .. string.format("Received string:        %s", printReceivedStringContainExpectedResult(a2, a3:exec(a2)))
            end,
            pass = v1,
        }
    end,
    toMatchObject = function(a1, a2, a3) -- Line: 1067
        -- upvalues: Error (val), matcherErrorMessage (val), matcherHint (val), RECEIVED_COLOR (val)
        -- upvalues: printWithType (val), printReceived (val), EXPECTED_COLOR (val), printExpected (val), equals (val)
        -- upvalues: iterableEquality (val), subsetEquality (val), stringify (val), printDiffOrStringify (val)
        -- upvalues: getObjectSubset (val)
        local u3 = {isNot = a1.isNot, promise = a1.promise}
        if typeof(a2) ~= "table" or a2 == nil then
            error(Error(matcherErrorMessage(
                matcherHint("toMatchObject", nil, nil, u3),
                string.format("%s value must be a non-nil object", RECEIVED_COLOR("received")),
                printWithType("Received", a2, printReceived)
            )))
        end
        if typeof(a3) ~= "table" or a3 == nil then
            error(Error(matcherErrorMessage(
                matcherHint("toMatchObject", nil, nil, u3),
                string.format("%s value must be a non-nil object", EXPECTED_COLOR("expected")),
                printWithType("Expected", a3, printExpected)
            )))
        end
        local v1 = equals(a2, a3, {iterableEquality, subsetEquality})
        return {
            message = if not v1 then function() -- Line: 1118
                -- upvalues: matcherHint (upval), u3 (val), printDiffOrStringify (upval), a3 (val)
                -- upvalues: getObjectSubset (upval), a2 (val), a1 (val)
                return (matcherHint("toMatchObject", nil, nil, u3)) .. "\n\n" .. printDiffOrStringify(a3, getObjectSubset(a2, a3), "Expected", "Received", not not a1.expand)
            end else function() -- Line: 1108
                -- upvalues: matcherHint (upval), u3 (val), printExpected (upval), a3 (val), stringify (upval), a2 (val)
                -- upvalues: printReceived (upval)
                local v1 = (matcherHint("toMatchObject", nil, nil, u3)) .. "\n\n" .. string.format("Expected: never %s", printExpected(a3))
                if (stringify(a3)) ~= stringify(a2) then
                    return v1 .. string.format("\nReceived:       %s", printReceived(a2))
                end
                return v1
            end,
            pass = v1,
        }
    end,
    toStrictEqual = function(a1, a2, a3) -- Line: 1144
        -- upvalues: equals (val), u119 (val), matcherHint (val), printExpected (val), stringify (val)
        -- upvalues: printReceived (val), printDiffOrStringify (val)
        local u3 = {comment = "deep equality", isNot = a1.isNot, promise = a1.promise}
        local v1 = equals(a2, a3, u119, true)
        return {
            name = "toStrictEqual",
            actual = a2,
            expected = a3,
            message = if not v1 then function() -- Line: 1173
                -- upvalues: matcherHint (upval), u3 (val), printDiffOrStringify (upval), a3 (val), a2 (val), a1 (val)
                return (matcherHint("toStrictEqual", nil, nil, u3)) .. "\n\n" .. printDiffOrStringify(a3, a2, "Expected", "Received", not not a1.expand)
            end else function() -- Line: 1161
                -- upvalues: matcherHint (upval), u3 (val), printExpected (upval), a3 (val), stringify (upval), a2 (val)
                -- upvalues: printReceived (upval)
                local v1 = (matcherHint("toStrictEqual", nil, nil, u3)) .. "\n\n" .. string.format("Expected: not %s\n", printExpected(a3))
                if (stringify(a3)) ~= stringify(a2) then
                    v1 = v1 .. string.format("Received:     %s", printReceived(a2))
                end
                return v1
            end,
            pass = v1,
        }
    end,
    toMatchInstance = function(a1, a2, a3) -- Line: 1186
        -- upvalues: getType (val), Error (val), matcherErrorMessage (val), matcherHint (val), RECEIVED_COLOR (val)
        -- upvalues: printWithType (val), printReceived (val), EXPECTED_COLOR (val), printExpected (val), equals (val)
        -- upvalues: instanceSubsetEquality (val), stringify (val), getInstanceSubset (val), printDiffOrStringify (val)
        local v1
        local u3 = {isNot = a1.isNot, promise = a1.promise}
        if getType(a2) ~= "Instance" or a2 == nil then
            error(Error(matcherErrorMessage(
                matcherHint("toMatchInstance", nil, nil, u3),
                string.format("%s value must be a Roblox Instance", RECEIVED_COLOR("received")),
                printWithType("Received", a2, printReceived)
            )))
        end
        if typeof(a3) ~= "table" or a3 == nil then
            error(Error(matcherErrorMessage(
                matcherHint("toMatchInstance", nil, nil, u3),
                string.format("%s value must be a table", EXPECTED_COLOR("expected")),
                printWithType("Expected", a3, printExpected)
            )))
        end
        local v2 = equals(a2, a3, {instanceSubsetEquality})
        if not v2 then
            local u81, u82 = getInstanceSubset(a2, a3)

            function v1() -- Line: 1237
                -- upvalues: matcherHint (upval), u3 (val), printDiffOrStringify (upval), u82 (val), u81 (val), a1 (val)
                return (matcherHint("toMatchInstance", nil, nil, u3)) .. "\n\n" .. printDiffOrStringify(u82, u81, "Expected", "Received", not not a1.expand)
            end
        else
            function v1() -- Line: 1226
                -- upvalues: matcherHint (upval), u3 (val), printExpected (upval), a3 (val), stringify (upval), a2 (val)
                -- upvalues: printReceived (upval)
                local v1 = (matcherHint("toMatchInstance", nil, nil, u3)) .. "\n\n" .. string.format("Expected: never %s", printExpected(a3))
                if (stringify(a3)) ~= stringify(a2) then
                    return v1 .. string.format("\nReceived:       %s", printReceived(a2))
                end
                return v1
            end
        end
        return {message = v1, pass = v2}
    end,
}