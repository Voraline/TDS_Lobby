-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-snapshot@3.10.0.jest-snapshot.printSnapshot
-- Decompile time: 7.84 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Error = v1.Error
local instanceof = v1.instanceof
local String = v1.String
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
local getObjectSubset = require(script.Parent.Parent:WaitForChild("jest-roblox-shared")).expect.getObjectSubset
local v2 = require(script.Parent.Parent:WaitForChild("jest-diff"))
local DIFF_DELETE = v2.DIFF_DELETE
local DIFF_EQUAL = v2.DIFF_EQUAL
local DIFF_INSERT = v2.DIFF_INSERT
local diffLinesUnified = v2.diffLinesUnified
local diffLinesUnified2 = v2.diffLinesUnified2
local diffStringsRaw = v2.diffStringsRaw
local diffStringsUnified = v2.diffStringsUnified
local v3 = require(script.Parent.Parent:WaitForChild("jest-get-type"))
local getType = v3.getType
local isPrimitive = v3.isPrimitive
local v4 = require(script.Parent.Parent:WaitForChild("jest-matcher-utils"))
local BOLD_WEIGHT = v4.BOLD_WEIGHT
local EXPECTED_COLOR = v4.EXPECTED_COLOR
local INVERTED_COLOR = v4.INVERTED_COLOR
local RECEIVED_COLOR = v4.RECEIVED_COLOR
local getLabelPrinter = v4.getLabelPrinter
local matcherHint = v4.matcherHint
local format = require(script.Parent.Parent:WaitForChild("pretty-format")).format
local colors = require(script.Parent:WaitForChild("colors"))
local aBackground2 = colors.aBackground2
local aBackground3 = colors.aBackground3
local aForeground2 = colors.aForeground2
local aForeground3 = colors.aForeground3
local bBackground2 = colors.bBackground2
local bBackground3 = colors.bBackground3
local bForeground2 = colors.bForeground2
local bForeground3 = colors.bForeground3
local dedentLines = require(script.Parent:WaitForChild("dedentLines"))
require(script.Parent:WaitForChild("types"))
local utils = require(script.Parent:WaitForChild("utils"))
local deserializeString = utils.deserializeString
local minify = utils.minify
local serialize = utils.serialize

local function getSnapshotColorForChalkInstance(a1) -- Line: 72
    -- upvalues: aForeground3 (val), aBackground3 (val), aForeground2 (val), aBackground2 (val), chalk (val)
    local level = a1.level
    if level == 3 then
        return (a1.rgb(aForeground3[1], aForeground3[2], aForeground3[3])) .. a1.bgRgb(aBackground3[1], aBackground3[2], aBackground3[3])
    end
    if level == 2 then
        return (a1.ansi256(aForeground2)) .. a1.bgAnsi256(aBackground2)
    end
    return a1.magenta .. chalk.bgYellowBright
end

local function getReceivedColorForChalkInstance(a1) -- Line: 90
    -- upvalues: bForeground3 (val), bBackground3 (val), bForeground2 (val), bBackground2 (val), chalk (val)
    local level = a1.level
    if level == 3 then
        return (a1.rgb(bForeground3[1], bForeground3[2], bForeground3[3])) .. a1.bgRgb(bBackground3[1], bBackground3[2], bBackground3[3])
    end
    if level == 2 then
        return (a1.ansi256(bForeground2)) .. a1.bgAnsi256(bBackground2)
    end
    return a1.cyan .. chalk.bgWhiteBright
end

local u132 = getSnapshotColorForChalkInstance(chalk)
local u135 = getReceivedColorForChalkInstance(chalk)

local function noColor(a1) -- Line: 110 -- types: a1: string
    return a1
end

local function joinDiffs(a1, a2, a3) -- Line: 172
    -- upvalues: Array (val), DIFF_EQUAL (val), INVERTED_COLOR (val)
    return Array.reduce(a1, function(a1, a2_2) -- Line: 181
        -- upvalues: DIFF_EQUAL (upval), a2 (val), a3 (val), INVERTED_COLOR (upval)
        local v1 = a1
        if a2_2[1] == DIFF_EQUAL then
            return a1 .. a2_2[2]
        end
        if a2_2[1] == a2 then
            if a3 then
                return v1 .. INVERTED_COLOR(a2_2[2])
            end
            v1 = v1 .. a2_2[2]
        end
        return v1
    end, "")
end

local function isLineDiffable(a1) -- Line: 200
    -- upvalues: getType (val), isPrimitive (val), instanceof (val), Error (val)
    local v1 = getType(a1)
    if isPrimitive(a1) then
        return typeof(a1) == "string"
    end
    if v1 ~= "DateTime" and v1 ~= "function" and v1 ~= "regexp" then
        if instanceof(a1, Error) then
            return false
        end
        if v1 == "table" and typeof(a1.asymmetricMatch) == "function" then
            return false
        end
        return true
    end
    return false
end

return {
    HINT_ARG = "hint",
    SNAPSHOT_ARG = "snapshot",
    PROPERTIES_ARG = "properties",
    getSnapshotColorForChalkInstance = getSnapshotColorForChalkInstance,
    getReceivedColorForChalkInstance = getReceivedColorForChalkInstance,
    aSnapshotColor = u132,
    bReceivedColor = u135,
    noColor = noColor,
    matcherHintFromConfig = function(a1, a2) -- Line: 118
        -- upvalues: u135 (val), noColor (val), BOLD_WEIGHT (val), u132 (val), matcherHint (val)
        local context = a1.context
        local hint = a1.hint
        local inlineSnapshot = a1.inlineSnapshot
        local matcherName = a1.matcherName
        local properties = a1.properties
        local v1 = {isNot = context.isNot, promise = context.promise}
        if a2 then
            v1.receivedColor = u135
        end
        local v2 = ""
        if typeof(properties) == "table" then
            v2 = "properties"
            if a2 then
                v1.expectedColor = noColor
            end
            if typeof(hint) ~= "string" then
                if typeof(inlineSnapshot) == "string" then
                    v1.secondArgument = "snapshot"
                    if not a2 then
                        v1.secondArgumentColor = noColor
                    else
                        v1.secondArgumentColor = u132
                    end
                end
            elseif #hint ~= 0 then
                v1.secondArgument = "hint"
                v1.secondArgumentColor = BOLD_WEIGHT
            elseif typeof(inlineSnapshot) == "string" then
                v1.secondArgument = "snapshot"
                if not a2 then
                    v1.secondArgumentColor = noColor
                else
                    v1.secondArgumentColor = u132
                end
            end
        elseif typeof(hint) ~= "string" then
            if typeof(inlineSnapshot) == "string" then
                v2 = "snapshot"
                if a2 then
                    v1.expectedColor = u132
                end
            end
        elseif #hint ~= 0 then
            v2 = "hint"
            v1.expectedColor = BOLD_WEIGHT
        elseif typeof(inlineSnapshot) == "string" then
            v2 = "snapshot"
            if a2 then
                v1.expectedColor = u132
            end
        end
        return matcherHint(matcherName, nil, v2, v1)
    end,
    printExpected = function(a1) -- Line: 223 -- upvalues: EXPECTED_COLOR (val), minify (val)
        return EXPECTED_COLOR(minify(a1))
    end,
    printReceived = function(a1) -- Line: 227 -- upvalues: RECEIVED_COLOR (val), minify (val)
        return RECEIVED_COLOR(minify(a1))
    end,
    printPropertiesAndReceived = function(a1, a2, a3) -- Line: 231
        -- upvalues: isLineDiffable (val), diffLinesUnified (val), serialize (val), getObjectSubset (val)
        -- upvalues: EXPECTED_COLOR (val), RECEIVED_COLOR (val), chalk (val), getLabelPrinter (val), minify (val)
        if isLineDiffable(a1) and isLineDiffable(a2) then
            return diffLinesUnified(serialize(a1):split("\n"), serialize(getObjectSubset(a2, a1)):split("\n"), {
                aAnnotation = "Expected properties",
                bAnnotation = "Received value",
                includeChangeCounts = true,
                aColor = EXPECTED_COLOR,
                bColor = RECEIVED_COLOR,
                changeLineTrailingSpaceColor = chalk.bgYellow,
                commonLineTrailingSpaceColor = chalk.bgYellow,
                emptyFirstOrLastLinePlaceholder = utf8.char(8629),
                expand = a3,
            })
        end
        local v1 = getLabelPrinter("Expected properties", "Received value")
        return (v1("Expected properties")) .. (EXPECTED_COLOR(minify(a1))) .. "\n" .. (v1("Received value")) .. RECEIVED_COLOR(minify(a2))
    end,
    printSnapshotAndReceived = function(a1, a2, a3, a4) -- Line: 268
        -- upvalues: u132 (val), u135 (val), noColor (val), chalk (val), String (val), format (val)
        -- upvalues: diffStringsRaw (val), Array (val), DIFF_EQUAL (val), DIFF_DELETE (val), INVERTED_COLOR (val)
        -- upvalues: DIFF_INSERT (val), getLabelPrinter (val), deserializeString (val), diffStringsUnified (val)
        -- upvalues: diffLinesUnified (val), isLineDiffable (val), serialize (val), dedentLines (val)
        -- upvalues: diffLinesUnified2 (val)
        local v1, v2, v3
        local v4 = u132
        local v5 = u135
        local v6 = {
            aAnnotation = "Snapshot",
            bAnnotation = "Received",
            includeChangeCounts = true,
            aColor = v4,
            bColor = v5,
            changeLineTrailingSpaceColor = noColor,
            commonLineTrailingSpaceColor = chalk.bgYellow,
            emptyFirstOrLastLinePlaceholder = utf8.char(8629),
            expand = a4,
        }
        if typeof(a3) ~= "string" then
            if isLineDiffable(a3) then
                v1 = a1:split("\n")
                v2 = a2:split("\n")
                v3 = serialize(a3, 0)
                if v3 ~= a2 then
                    local v7 = dedentLines(v1)
                    if v7 ~= nil then
                        return diffLinesUnified2(v1, v2, v7, v3:split("\n"), v6)
                    end
                end
                return diffLinesUnified(v1, v2, v6)
            end
            v1 = getLabelPrinter("Snapshot", "Received")
            return (v1("Snapshot")) .. (v4(a1)) .. "\n" .. (v1("Received")) .. v5(a2)
        end
        if #a1 >= 2 and String.startsWith(a1, "\"") and String.endsWith(a1, "\"") and a2 == format(a3) then
            if not a1:find("\n") and not a2:find("\n") then
                v1 = a1
                v2 = a2
                v3 = #a1 - 2
                if v3 <= 20000 then
                    v3 = #a2 - 2
                    if v3 <= 20000 then
                        v3 = diffStringsRaw(string.sub(a1, 2, -2), string.sub(a2, 2, -2), true)
                        local u64 = Array.some(v3, function(a1) -- Line: 303 -- upvalues: DIFF_EQUAL (upval)
                            return a1[1] == DIFF_EQUAL
                        end)
                        local u66 = DIFF_DELETE
                        v1 = "\"" .. Array.reduce(v3, function(a1, a2) -- Line: 181
                            -- upvalues: DIFF_EQUAL (upval), u66 (val), u64 (val), INVERTED_COLOR (upval)
                            local v1 = a1
                            if a2[1] == DIFF_EQUAL then
                                return a1 .. a2[2]
                            end
                            if a2[1] == u66 then
                                if u64 then
                                    return v1 .. INVERTED_COLOR(a2[2])
                                end
                                v1 = v1 .. a2[2]
                            end
                            return v1
                        end, "") .. "\""
                        local u77 = DIFF_INSERT
                        v2 = "\"" .. Array.reduce(v3, function(a1, a2) -- Line: 181
                            -- upvalues: DIFF_EQUAL (upval), u77 (val), u64 (val), INVERTED_COLOR (upval)
                            local v1 = a1
                            if a2[1] == DIFF_EQUAL then
                                return a1 .. a2[2]
                            end
                            if a2[1] == u77 then
                                if u64 then
                                    return v1 .. INVERTED_COLOR(a2[2])
                                end
                                v1 = v1 .. a2[2]
                            end
                            return v1
                        end, "") .. "\""
                    end
                end
                v3 = getLabelPrinter("Snapshot", "Received")
                return (v3("Snapshot")) .. (v4(v1)) .. "\n" .. (v3("Received")) .. v5(v2)
            end
            a1 = deserializeString(a1)
            a2 = a3
        end
        if #a1 <= 20000 and #a2 <= 20000 then
            return diffStringsUnified(a1, a2, v6)
        end
        return diffLinesUnified(a1:split("\n"), a2:split("\n"), v6)
    end,
}