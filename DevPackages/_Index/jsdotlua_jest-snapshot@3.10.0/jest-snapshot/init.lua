-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-snapshot@3.10.0.jest-snapshot
-- Decompile time: 8.34 ms

local v1 = require(script.Parent:WaitForChild("luau-polyfill"))
local Error = v1.Error
local instanceof = v1.instanceof
local AssertionError = v1.AssertionError
local cleanLoadStringStack = (require((script.Parent:WaitForChild("jest-roblox-shared")))).cleanLoadStringStack
local getType = require(script.Parent:WaitForChild("jest-get-type")).getType
local v2 = require(script.Parent:WaitForChild("jest-matcher-utils"))
local BOLD_WEIGHT = v2.BOLD_WEIGHT
local EXPECTED_COLOR = v2.EXPECTED_COLOR
local RECEIVED_COLOR = v2.RECEIVED_COLOR
local matcherErrorMessage = v2.matcherErrorMessage
local matcherHint = v2.matcherHint
local printWithType = v2.printWithType
local stringify = v2.stringify
local SnapshotResolver = require(script:WaitForChild("SnapshotResolver"))
local EXTENSION = SnapshotResolver.EXTENSION
local buildSnapshotResolver = SnapshotResolver.buildSnapshotResolver
local isSnapshotPath = SnapshotResolver.isSnapshotPath
local default = (require((script:WaitForChild("State")))).default
local plugins = require(script:WaitForChild("plugins"))
local addSerializer = plugins.addSerializer
local getSerializers = plugins.getSerializers
local printSnapshot = require(script:WaitForChild("printSnapshot"))
local PROPERTIES_ARG = printSnapshot.PROPERTIES_ARG
local bReceivedColor = printSnapshot.bReceivedColor
local matcherHintFromConfig = printSnapshot.matcherHintFromConfig
local printExpected = printSnapshot.printExpected
local printPropertiesAndReceived = printSnapshot.printPropertiesAndReceived
local printReceived = printSnapshot.printReceived
local printSnapshotAndReceived = printSnapshot.printSnapshotAndReceived
require(script:WaitForChild("types"))
local utils = require(script:WaitForChild("utils"))
local _toMatchSnapshot = nil
local _toThrowErrorMatchingSnapshot = nil
local u105 = "Snapshot matchers cannot be used with " .. BOLD_WEIGHT("never")

local function printSnapshotName(a1, a2, a3) -- Line: 78
    -- upvalues: utils (val), BOLD_WEIGHT (val)
    local v1 = a1 or ""
    local v2 = a2 or ""
    local v3 = v1:len() ~= 0
    local v4 = #v2 ~= 0
    local v5 = "Snapshot name: `"
    if v3 then
        v5 = v5 .. utils.escapeBacktickString(v1)
    end
    if v3 and v4 then
        v5 = v5 .. ": "
    end
    if v4 then
        v5 = v5 .. BOLD_WEIGHT(utils.escapeBacktickString(v2))
    end
    return v5 .. " " .. a3 .. "`"
end

function _toMatchSnapshot(a1) -- Line: 166
    -- upvalues: AssertionError (val), matcherErrorMessage (val), matcherHintFromConfig (val), u105 (val)
    -- upvalues: printWithType (val), stringify (val), getType (val), RECEIVED_COLOR (val), EXPECTED_COLOR (val)
    -- upvalues: printReceived (val), printSnapshotName (val), printPropertiesAndReceived (val), utils (val)
    -- upvalues: BOLD_WEIGHT (val), bReceivedColor (val), printSnapshotAndReceived (val)
    local context = a1.context
    local hint = a1.hint
    local inlineSnapshot = a1.inlineSnapshot
    local isInline = a1.isInline
    local matcherName = a1.matcherName
    local properties = a1.properties
    local received = a1.received
    local currentTestName = context.currentTestName
    local isNot = context.isNot
    local snapshotState = context.snapshotState
    if isNot then
        error(AssertionError.new({message = matcherErrorMessage(matcherHintFromConfig(a1, false), u105)}))
    end
    if snapshotState == nil then
        error(AssertionError.new({
            message = (matcherHintFromConfig(a1, false)) .. "\n\n" .. "Snapshot state must be initialized" .. "\n\n" .. printWithType("Snapshot state", snapshotState, stringify),
        }))
    end
    local v1 = if not currentTestName then currentTestName or "" else if not hint then currentTestName or "" else currentTestName .. ": " .. hint
    if typeof(properties) == "table" then
        local v2
        if received == nil then
            error(AssertionError.new({
                message = matcherErrorMessage(
                    matcherHintFromConfig(a1, false),
                    (RECEIVED_COLOR("received")) .. " value must be an object when the matcher has " .. EXPECTED_COLOR("properties"),
                    printWithType("Received", received, printReceived)
                ),
            }))
        else
            v2 = received
            if typeof(v2) ~= "table" and getType(received) ~= "Instance" then
                error(AssertionError.new({
                    message = matcherErrorMessage(
                        matcherHintFromConfig(a1, false),
                        (RECEIVED_COLOR("received")) .. " value must be an object when the matcher has " .. EXPECTED_COLOR("properties"),
                        printWithType("Received", received, printReceived)
                    ),
                }))
            end
        end
        v2 = received
        if not context.equals(v2, properties, {context.utils.iterableEquality, context.utils.subsetEquality}) then
            local v3 = (snapshotState:fail(v1, received)):match("(%d+)$")
            local u140 = if v3 ~= nil then tonumber(v3) else 1
            return {
                pass = false,
                message = function() -- Line: 244
                    -- upvalues: matcherHintFromConfig (upval), a1 (val), printSnapshotName (upval)
                    -- upvalues: currentTestName (val), hint (val), u140 (val), printPropertiesAndReceived (upval)
                    -- upvalues: properties (val), received (ref), snapshotState (val)
                    return (matcherHintFromConfig(a1, false)) .. "\n\n" .. (printSnapshotName(currentTestName, hint, u140)) .. "\n\n" .. printPropertiesAndReceived(properties, received, snapshotState.expand)
                end,
                name = matcherName,
            }
        end
        received = utils.deepMerge(received, properties)
    end
    local v4 = snapshotState:match({
        error = context.error,
        inlineSnapshot = inlineSnapshot,
        isInline = isInline,
        received = received,
        testName = v1,
    })
    local actual = v4.actual
    local count = v4.count
    local expected = v4.expected
    if v4.pass then
        return {
            pass = true,
            message = function() -- Line: 276
                return ""
            end,
        }
    end
    return {
        pass = false,
        actual = actual,
        expected = expected,
        message = if expected ~= nil then function() -- Line: 309
            -- upvalues: matcherHintFromConfig (upval), a1 (val), printSnapshotName (upval), currentTestName (val)
            -- upvalues: hint (val), count (val), printSnapshotAndReceived (upval), expected (val), actual (val)
            -- upvalues: received (ref), snapshotState (val)
            return (matcherHintFromConfig(a1, true)) .. "\n\n" .. (printSnapshotName(currentTestName, hint, count)) .. "\n\n" .. printSnapshotAndReceived(expected, actual, received, snapshotState.expand)
        end else function() -- Line: 285
            -- upvalues: matcherHintFromConfig (upval), a1 (val), printSnapshotName (upval), currentTestName (val)
            -- upvalues: hint (val), count (val), BOLD_WEIGHT (upval), actual (val), bReceivedColor (upval)
            local v1 = (matcherHintFromConfig(a1, true)) .. "\n\n" .. (printSnapshotName(currentTestName, hint, count)) .. "\n\n" .. "New snapshot was " .. (BOLD_WEIGHT("not written")) .. ". The update flag must be explicitly passed to write a new snapshot.\n\nThis is likely because this test is run in a continuous integration (CI) environment in which snapshots are not written by default.\n\nReceived:"
            v1 = if not actual:find("\n") then v1 .. " " else v1 .. "\n"
            return v1 .. bReceivedColor(actual)
        end,
        name = matcherName,
    }
end

function _toThrowErrorMatchingSnapshot(a1, a2) -- Line: 350
    -- upvalues: AssertionError (val), matcherErrorMessage (val), matcherHint (val), RECEIVED_COLOR (val)
    -- upvalues: printWithType (val), printReceived (val), matcherHintFromConfig (val), u105 (val), instanceof (val)
    -- upvalues: Error (val), cleanLoadStringStack (val), _toMatchSnapshot (ref)
    local context = a1.context
    local hint = a1.hint
    local inlineSnapshot = a1.inlineSnapshot
    local isInline = a1.isInline
    local matcherName = a1.matcherName
    local received = a1.received
    local isNot = context.isNot
    local promise = context.promise
    if not a2 and typeof(received) ~= "function" then
        error(AssertionError.new({
            message = matcherErrorMessage(
                matcherHint(matcherName, nil, "", {isNot = isNot, promise = promise}),
                (RECEIVED_COLOR("received")) .. " value must be a function",
                printWithType("Received", received, printReceived)
            ),
        }))
    end
    if isNot then
        error(AssertionError.new({message = matcherErrorMessage(matcherHintFromConfig(a1, false), u105)}))
    end
    local message = nil
    if not a2 then
        local success, result = pcall(function() -- Line: 392 -- upvalues: received (val)
            received()
        end)
        if not success then
            message = result
        end
    else
        message = received
    end
    if message == nil then
        error(AssertionError.new({message = (matcherHintFromConfig(a1, false)) .. "\n\nReceived function did not throw"}))
    end
    if instanceof(message, Error) then
        message = message.message
    elseif typeof(message) ~= "table" then
        if typeof(message) ~= "string" then
            message = tostring(message)
        end
    elseif rawget(message, "message") ~= nil then
        message = message.message
    elseif typeof(message) ~= "string" then
        message = tostring(message)
    end
    return _toMatchSnapshot({
        context = context,
        hint = hint,
        inlineSnapshot = inlineSnapshot,
        isInline = isInline,
        matcherName = matcherName,
        received = cleanLoadStringStack(message),
    })
end

return {
    EXTENSION = EXTENSION,
    SnapshotState = default,
    addSerializer = addSerializer,
    buildSnapshotResolver = buildSnapshotResolver,
    getSerializers = getSerializers,
    isSnapshotPath = isSnapshotPath,
    toMatchSnapshot = function(...) -- Line: 106
        -- upvalues: printWithType (val), printExpected (val), BOLD_WEIGHT (val), AssertionError (val)
        -- upvalues: matcherErrorMessage (val), matcherHint (val), PROPERTIES_ARG (val), EXPECTED_COLOR (val)
        -- upvalues: _toMatchSnapshot (ref)
        local v1, v2
        local v3 = {...}
        local v4 = v3[1]
        local v5 = v3[2]
        local v6 = v3[3]
        local v7 = v3[4]
        local v8 = nil
        local v9 = select("#", ...)
        if v9 ~= 3 then
            if v9 >= 3 then
                if typeof(v6) ~= "table" or typeof(v6) == nil then
                    v1 = {isNot = v4.isNot, promise = v4.promise}
                    v2 = printWithType("Expected properties", v6, printExpected)
                    if v9 == 4 then
                        v1.secondArgument = "hint"
                        v1.secondArgumentColor = BOLD_WEIGHT
                        if v6 == nil then
                            v2 = v2 .. "\n\nTo provide a hint without properties: toMatchSnapshot('hint')"
                        end
                    end
                    error(AssertionError.new({
                        message = matcherErrorMessage(
                            matcherHint("toMatchSnapshot", nil, PROPERTIES_ARG, v1),
                            "Expected " .. (EXPECTED_COLOR("properties")) .. " must be an object",
                            v2
                        ),
                    }))
                end
                v8 = v6
            end
        elseif typeof(v6) == "string" then
            v7 = v6
        elseif v9 >= 3 then
            if typeof(v6) ~= "table" or typeof(v6) == nil then
                v1 = {isNot = v4.isNot, promise = v4.promise}
                v2 = printWithType("Expected properties", v6, printExpected)
                if v9 == 4 then
                    v1.secondArgument = "hint"
                    v1.secondArgumentColor = BOLD_WEIGHT
                    if v6 == nil then
                        v2 = v2 .. "\n\nTo provide a hint without properties: toMatchSnapshot('hint')"
                    end
                end
                error(AssertionError.new({
                    message = matcherErrorMessage(
                        matcherHint("toMatchSnapshot", nil, PROPERTIES_ARG, v1),
                        "Expected " .. (EXPECTED_COLOR("properties")) .. " must be an object",
                        v2
                    ),
                }))
            end
            v8 = v6
        end
        return _toMatchSnapshot({
            isInline = false,
            matcherName = "toMatchSnapshot",
            context = v4,
            hint = v7,
            properties = v8,
            received = v5,
        })
    end,
    toThrowErrorMatchingSnapshot = function(a1, a2, a3, a4) -- Line: 330 -- upvalues: _toThrowErrorMatchingSnapshot (ref) -- types: a4: boolean
        return _toThrowErrorMatchingSnapshot({
            isInline = false,
            matcherName = "toThrowErrorMatchingSnapshot",
            context = a1,
            hint = a3,
            received = a2,
        }, a4)
    end,
    utils = utils,
    plugins = require(script:WaitForChild("plugins")),
}