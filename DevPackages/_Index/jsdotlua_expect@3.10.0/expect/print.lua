-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_expect@3.10.0.expect.print
-- Decompile time: 8.67 ms

local Number = (require((script.Parent.Parent:WaitForChild("luau-polyfill")))).Number
local v1 = require(script.Parent.Parent:WaitForChild("jest-matcher-utils"))
local EXPECTED_COLOR = v1.EXPECTED_COLOR
local INVERTED_COLOR = v1.INVERTED_COLOR
local RECEIVED_COLOR = v1.RECEIVED_COLOR
local printReceived = v1.printReceived
local stringify = v1.stringify

local function printSubstring(a1) -- Line: 24 -- types: a1: string
    return (a1:gsub("(\\)", "\\%1"):gsub("(\")", "\\%1"))
end

local function printReceivedStringContainExpectedSubstring(a1, a2, a3) -- Line: 30
    -- upvalues: RECEIVED_COLOR (val), INVERTED_COLOR (val)
    return (RECEIVED_COLOR("\"" .. (a1:sub(0, a2 - 1)):gsub("(\\)", "\\%1"):gsub("(\")", "\\%1"))) .. (INVERTED_COLOR(((a1:sub(a2, a2 + a3 - 1)):gsub("(\\)", "\\%1"):gsub("(\")", "\\%1")))) .. (RECEIVED_COLOR(((a1:sub(a2 + a3, #a1)):gsub("(\\)", "\\%1"):gsub("(\")", "\\%1")))) .. "\""
end

local function printable(a1) -- Line: 129
    if typeof(a1) == "table" then
        return tostring(a1):find("table: 0x") == nil
    end
    if typeof(a1) == "function" then
        return tostring(a1):find("function: 0x") == nil
    end
    if typeof(a1) == "userdata" then
        return tostring(a1):find("userdata: 0x") == nil
    end
    if typeof(a1) == "thread" then
        return tostring(a1):find("thread: 0x") == nil
    end
    return true
end

function printConstructorName(a1, a2, a3, a4) -- Line: 178
    -- upvalues: printable (val), EXPECTED_COLOR (val), RECEIVED_COLOR (val), stringify (val)
    local v1
    local v2 = a1 .. ": "
    v2 = if a3 then if not a4 then v2 .. "      " else v2 .. "never " else v2 .. ""
    if printable(a2) then
        if #tostring(a2) == 0 then
            return string.format("%s name is an empty string", a1)
        end
        if a4 then
            return v2 .. EXPECTED_COLOR((tostring(a2)))
        end
        return v2 .. RECEIVED_COLOR((tostring(a2)))
    end
    local v3 = "{ "
    local v4 = true
    local v5 = false
    local v6, v7 = a4, a2
    for k, v in pairs(a2) do
        v1 = nil
        if not printable(k) then
            if printable(k) and k:find("__") ~= 1 then
                v1 = string.format("%s, ", stringify(k))
            end
        elseif printable(v) then
            v1 = string.format("%s: %s, ", stringify(k), stringify(v))
        elseif printable(k) and k:find("__") ~= 1 then
            v1 = string.format("%s, ", stringify(k))
        end
        if v1 then
            if 64 < #v3 + #v1 then
                v4 = false
                break
            end
            v5 = true
            v3 = v3 .. v1
        end
    end
    if v5 == false then
        if v6 then
            return v2 .. EXPECTED_COLOR((tostring(v7)))
        end
        return v2 .. RECEIVED_COLOR((tostring(v7)))
    end
    v3 = if not v4 then v3 .. "... }" else v3:sub(1, -3) .. " }"
    if v6 then
        return v2 .. EXPECTED_COLOR(v3)
    end
    return v2 .. RECEIVED_COLOR(v3)
end

return {
    printReceivedStringContainExpectedSubstring = printReceivedStringContainExpectedSubstring,
    printReceivedStringContainExpectedResult = function(a1, a2) -- Line: 41
        -- upvalues: printReceived (val), printReceivedStringContainExpectedSubstring (val)
        if a2 == nil then
            return printReceived(a1)
        end
        return (printReceivedStringContainExpectedSubstring(a1, a2.index, #a2[1]))
    end,
    printReceivedArrayContainExpectedItem = function(a1, a2) -- Line: 53
        -- upvalues: stringify (val), INVERTED_COLOR (val), RECEIVED_COLOR (val)
        local v1
        local v2 = {}
        for i, v in ipairs(a1) do
            v1 = stringify(v)
            if i ~= a2 then
                v2[i] = (RECEIVED_COLOR(v1))
            else
                v2[i] = (INVERTED_COLOR(v1))
            end
        end
        return (RECEIVED_COLOR("{")) .. (table.concat(v2, RECEIVED_COLOR(", "))) .. RECEIVED_COLOR("}")
    end,
    printCloseTo = function(a1, a2, a3, a4) -- Line: 67
        -- upvalues: stringify (val), Number (val), EXPECTED_COLOR (val), RECEIVED_COLOR (val)
        local v1
        local v2 = stringify(a1)
        if v2:find("e") then
            v2 = v2:gsub("%+0", "+"):gsub("%-0", "-")
            v1 = Number.toExponential(a2, 0)
        else
            v1 = if not (a3 >= 0) or not (a3 < 20) then stringify(a2) else string.format("%." .. a3 + 1 .. "f", a2)
        end
        if a4 then
            return string.format(
                "Expected precision:  %s  %s\nExpected difference: %s< %s\nReceived difference: %s  %s",
                "      ",
                stringify(a3),
                "never ",
                EXPECTED_COLOR(v1),
                "      ",
                RECEIVED_COLOR(v2)
            )
        end
        return string.format(
            "Expected precision:  %s  %s\nExpected difference: %s< %s\nReceived difference: %s  %s",
            "",
            stringify(a3),
            "",
            EXPECTED_COLOR(v1),
            "",
            RECEIVED_COLOR(v2)
        )
    end,
    printExpectedConstructorName = function(a1, a2) -- Line: 112 -- types: a1: string
        return (printConstructorName(a1, a2, false, true)) .. "\n"
    end,
    printExpectedConstructorNameNot = function(a1, a2) -- Line: 116 -- types: a1: string
        return (printConstructorName(a1, a2, true, true)) .. "\n"
    end,
    printReceivedConstructorName = function(a1, a2) -- Line: 120 -- types: a1: string
        return (printConstructorName(a1, a2, false, false)) .. "\n"
    end,
    printReceivedConstructorNameNot = function(a1, a2, a3) -- Line: 144 -- upvalues: printable (val), EXPECTED_COLOR (val) -- types: a1: string
        if typeof((tostring(a3))) == "string"
            and #tostring(a3) ~= 0
            and typeof((tostring(a2))) == "string"
            and #tostring(a2) ~= 0 then
            if printable(a3) and printable(a2) then
                local v1 = printConstructorName(a1, a2, true, false)
                v1 = if not getmetatable(a2) then v1 .. " extends … extends " else if getmetatable(a2).__index ~= a3 then v1 .. " extends … extends " else v1 .. " extends "
                return v1 .. (EXPECTED_COLOR((tostring(a3)))) .. "\n"
            end
            return (printConstructorName(a1, a2, true, false)) .. "\n"
        end
        return (printConstructorName(a1, a2, false, false)) .. "\n"
    end,
}