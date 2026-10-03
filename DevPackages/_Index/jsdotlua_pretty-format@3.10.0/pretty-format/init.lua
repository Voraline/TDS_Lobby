-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_pretty-format@3.10.0.pretty-format
-- Decompile time: 8.58 ms

local v1 = require(script.Parent:WaitForChild("luau-polyfill"))
local Error = v1.Error
local Object = v1.Object
local extends = v1.extends
local isNaN = v1.Number.isNaN
local Collections = require(script:WaitForChild("Collections"))
local printTableEntries = Collections.printTableEntries
local printMapEntries = Collections.printMapEntries
local printListItems = Collections.printListItems
local AsymmetricMatcher = require((script:WaitForChild("plugins")):WaitForChild("AsymmetricMatcher"))
local ConvertAnsi = require((script:WaitForChild("plugins")):WaitForChild("ConvertAnsi"))
local RobloxInstance = require((script:WaitForChild("plugins")):WaitForChild("RobloxInstance"))
local ReactElement = require((script:WaitForChild("plugins")):WaitForChild("ReactElement"))
local ReactTestComponent = require((script:WaitForChild("plugins")):WaitForChild("ReactTestComponent"))
local RedactStackTraces = require((script:WaitForChild("plugins")):WaitForChild("RedactStackTraces"))
local v2 = require(script.Parent:WaitForChild("jest-get-type"))
local getType = v2.getType
local isRobloxBuiltin = v2.isRobloxBuiltin
require(script:WaitForChild("Types"))
local u110 = extends(Error, "PrettyFormatPluginError", function(a1, a2) -- Line: 48
    a1.name = "PrettyFormatPluginError"
    a1.message = a2
end)
local printer = nil
local createIndent = nil

local function printNumber(a1) -- Line: 57 -- upvalues: isNaN (val) -- types: a1: number
    if isNaN(a1) then
        return "nan"
    end
    return (tostring(a1))
end

local function printFunction(a1, a2) -- Line: 67 -- types: a2: boolean
    if not a2 then
        return "[Function]"
    end
    local v1 = debug.info(a1, "n")
    if v1 == nil or v1 == "" then
        v1 = "anonymous"
    end
    return "[Function " .. v1 .. "]"
end

local function printSymbol(a1) -- Line: 78
    return (tostring(a1))
end

local function printError(a1) -- Line: 82
    return "[" .. (tostring(a1)) .. "]"
end

local function printBasicValue(a1, a2, a3, a4) -- Line: 90
    -- upvalues: getType (val), isNaN (val), isRobloxBuiltin (val)
    local v1 = getType(a1)
    if v1 ~= "boolean" and v1 ~= "nil" then
        if v1 == "number" then
            if isNaN(a1) then
                return "nan"
            end
            return (tostring(a1))
        end
        if v1 == "string" then
            if a4 then
                return "\"" .. a1:gsub("\\", "\\\\"):gsub("\"", "\\\"") .. "\""
            end
            return "\"" .. a1 .. "\""
        end
        if v1 == "function" then
            if not a2 then
                return "[Function]"
            end
            local v2 = debug.info(a1, "n")
            if v2 == nil or v2 == "" then
                v2 = "anonymous"
            end
            return "[Function " .. v2 .. "]"
        end
        if v1 == "symbol" then
            return (tostring(a1))
        end
        if v1 == "DateTime" then
            return (string.sub(a1:ToIsoDate(), 1, -2)) .. "." .. (string.format("%03d", a1:ToUniversalTime().Millisecond)) .. "Z"
        end
        if v1 == "error" then
            return "[" .. (tostring(a1)) .. "]"
        end
        if v1 == "regexp" then
            local v3 = tostring(a1)
            if a3 then
                return (v3:gsub("[\\%^%$%*%+%?%.%(%)|%[%]{}]", "\\%1"))
            end
            return v3
        end
        if v1 == "Instance" then
            return a1.ClassName
        end
        if isRobloxBuiltin(a1) then
            return string.format("%s(%s)", v1, (tostring(a1)))
        end
        if v1 == "userdata" then
            return (tostring(a1))
        end
        return nil
    end
    return (tostring(a1))
end

local function is_array(a1) -- Line: 169
    if type(a1) ~= "table" then
        return false
    end
    if #a1 > 0 then
        return true
    end
    for k, v in pairs(a1) do
        return false
    end
    return true
end

local function printComplexValue(a1, a2, a3, a4, a5, a6) -- Line: 192
    -- upvalues: printer (ref), getType (val), printListItems (val), printMapEntries (val), printTableEntries (val)
    local v1
    if table.find(a5, a1) ~= nil then
        return "[Circular]"
    end
    local v2 = {unpack(a5)}
    table.insert(v2, a1)
    local v3 = a4 + 1
    local v4 = a2.maxDepth < v3
    local min = a2.min
    if a2.callToJSON and not v4 and a1.toJSON and typeof(a1.toJSON) == "function" and not a6 then
        return printer(a1.toJSON(), a2, a3, v3, v2, true)
    end
    if v4 then
        if getType(a1) == "set" then
            return "[Set]"
        end
        return "[Table]"
    end
    local v5 = ""
    if not min then
        v5 = if not a2.printBasicPrototype then "" else "Table "
    end
    if type(a1) ~= "table" then
        v1 = false
    else
        if not (#a1 > 0) then
            for k, v in pairs(a1) do
                if false then
                    return v5 .. "{" .. (printListItems(a1, a2, a3, v3, v2, printer)) .. "}"
                end
                if getType(a1) == "set" then
                    if v4 then
                        return "[Set]"
                    end
                    return "Set {" .. (printListItems(a1._array, a2, a3, v3, v2, printer)) .. "}"
                end
                if getType(a1) ~= "map" then
                    return v5 .. "{" .. (printTableEntries(a1, a2, a3, v3, v2, printer)) .. "}"
                end
                if v4 then
                    return "[Map]"
                end
                return "Map {" .. (printMapEntries(a1._map, a2, a3, v3, v2, printer)) .. "}"
            end
        end
        v1 = true
    end
    if v1 then
        return v5 .. "{" .. (printListItems(a1, a2, a3, v3, v2, printer)) .. "}"
    end
    if getType(a1) == "set" then
        if v4 then
            return "[Set]"
        end
        return "Set {" .. (printListItems(a1._array, a2, a3, v3, v2, printer)) .. "}"
    end
    if getType(a1) ~= "map" then
        return v5 .. "{" .. (printTableEntries(a1, a2, a3, v3, v2, printer)) .. "}"
    end
    if v4 then
        return "[Map]"
    end
    return "Map {" .. (printMapEntries(a1._map, a2, a3, v3, v2, printer)) .. "}"
end

local function isNewPlugin(a1) -- Line: 257
    return a1.serialize ~= nil
end

function printPlugin(a1, a2, a3, a4, a5, a6) -- Line: 261
    -- upvalues: printer (ref), u110 (val), Error (val)
    local u6 = nil
    local success, result = pcall(function() -- Line: 264
        -- upvalues: a1 (val), u6 (ref), a2 (val), a3 (val), a4 (val), a5 (val), a6 (val), printer (upval)
        if a1.serialize ~= nil then
            u6 = a1.serialize(a2, a3, a4, a5, a6, printer)
            return
        end
        local print = a1.print
        local v1 = a2
        local v2 = {edgeSpacing = a3.spacingOuter, min = a3.min, spacing = a3.spacingInner}
        u6 = print(v1, function(a1) -- Line: 268 -- upvalues: printer (upval), a3 (upval), a4 (upval), a5 (upval), a6 (upval)
            return printer(a1, a3, a4, a5, a6)
        end, function(a1) -- Line: 270 -- upvalues: a4 (upval), a3 (upval)
            local v1 = a4 .. a3.indent
            return v1 .. a1:gsub("\n", "\n" .. v1)
        end, v2, a3.colors)
    end)
    if not success then
        if typeof(result) == "table" and result.name == "PrettyFormatPluginError" then
            error(result)
        end
        error(u110(result))
    end
    local v1 = u6
    if typeof(v1) ~= "string" then
        error(Error(string.format("pretty-format: Plugin must return type \"string\" but instead returned \"%s\".", (typeof(u6)))))
    end
    return u6
end

local function findPlugin(a1, a2) -- Line: 303 -- upvalues: u110 (val)
    local result, success
    for i, v in ipairs(a1) do
        success, result = pcall(v.test, a2)
        if not success then
            error(u110(result))
        elseif result then
            return v
        end
    end
    return nil
end

function printer(a1, a2, a3, a4, a5, a6) -- Line: 316
    -- upvalues: findPlugin (val), printBasicValue (val), printComplexValue (val)
    local v1 = findPlugin(a2.plugins, a1)
    if v1 ~= nil then
        return printPlugin(v1, a1, a2, a3, a4, a5)
    end
    local v2 = printBasicValue(a1, a2.printFunctionName, a2.escapeRegex, a2.escapeString)
    if v2 ~= nil then
        return v2
    end
    return printComplexValue(a1, a2, a3, a4, a5, a6)
end

local u124 = {
    callToJSON = true,
    escapeRegex = false,
    escapeString = true,
    highlight = false,
    indent = 2,
    maxDepth = (1 / 0),
    maxWidth = (1 / 0),
    min = false,
    printBasicPrototype = true,
    printInstanceDefaults = true,
    printFunctionName = true,
    redactStackTracesInStrings = false,
    compareKeys = Object.None,
}
u124.plugins = {}

local function validateOptions(a1) -- Line: 361 -- upvalues: u124 (val), Error (val)
    for k, v in pairs(a1) do
        if u124[k] == nil then
            error(Error(string.format("pretty-format: Unknown option \"%s\".", (tostring(k)))))
        end
    end
    if a1.min and a1.indent ~= nil and a1.indent ~= 0 then
        error(Error("pretty-format: Options \"min\" and \"indent\" cannot be used together."))
    end
end

local function getOption(a1, a2) -- Line: 378 -- upvalues: u124 (val)
    if a1 and a1[a2] ~= nil then
        return a1[a2]
    end
    return u124[a2]
end

local function getIndent(a1) -- Line: 385 -- upvalues: u124 (val), createIndent (ref)
    if a1 and a1.min then
        return ""
    end
    local indent = u124.indent
    if a1 and a1.indent ~= nil then
        indent = a1.indent
    end
    return createIndent(indent)
end

local function getSpacingInner(a1) -- Line: 396
    if a1 and a1.min then
        return " "
    end
    return "\n"
end

local function getSpacingOuter(a1) -- Line: 403
    if a1 and a1.min then
        return ""
    end
    return "\n"
end

local function getConfig(a1) -- Line: 411 -- upvalues: u124 (val), createIndent (ref)
    local v1
    local v2 = {}
    local callToJSON = if not a1 then u124.callToJSON else if a1.callToJSON == nil then u124.callToJSON else a1.callToJSON
    v2.callToJSON = callToJSON
    local compareKeys_2 = if a1 == nil then u124.compareKeys else if typeof(a1.compareKeys) ~= "function" then u124.compareKeys else a1.compareKeys
    v2.compareKeys = compareKeys_2
    local escapeRegex = if not a1 then u124.escapeRegex else if a1.escapeRegex == nil then u124.escapeRegex else a1.escapeRegex
    v2.escapeRegex = escapeRegex
    local escapeString = if not a1 then u124.escapeString else if a1.escapeString == nil then u124.escapeString else a1.escapeString
    v2.escapeString = escapeString
    if not a1 or not a1.min then
        local indent = u124.indent
        if a1 and a1.indent ~= nil then
            indent = a1.indent
        end
        v1 = createIndent(indent)
    else
        v1 = ""
    end
    v2.indent = v1
    local maxDepth = if not a1 then u124.maxDepth else if a1.maxDepth == nil then u124.maxDepth else a1.maxDepth
    v2.maxDepth = maxDepth
    local maxWidth = if not a1 then u124.maxWidth else if a1.maxWidth == nil then u124.maxWidth else a1.maxWidth
    v2.maxWidth = maxWidth
    local min = if not a1 then u124.min else if a1.min == nil then u124.min else a1.min
    v2.min = min
    local plugins = if not a1 then u124.plugins else if a1.plugins == nil then u124.plugins else a1.plugins
    v2.plugins = plugins
    v2.printBasicPrototype = if a1 == nil then true else if a1.printBasicPrototype == nil then true else a1.printBasicPrototype
    local printInstanceDefaults = if not a1 then u124.printInstanceDefaults else if a1.printInstanceDefaults == nil then u124.printInstanceDefaults else a1.printInstanceDefaults
    v2.printInstanceDefaults = printInstanceDefaults
    local redactStackTracesInStrings = if not a1 then u124.redactStackTracesInStrings else if a1.redactStackTracesInStrings == nil then u124.redactStackTracesInStrings else a1.redactStackTracesInStrings
    v2.redactStackTracesInStrings = redactStackTracesInStrings
    local printFunctionName = if not a1 then u124.printFunctionName else if a1.printFunctionName == nil then u124.printFunctionName else a1.printFunctionName
    v2.printFunctionName = printFunctionName
    v2.spacingInner = if not a1 then "\n" else if not a1.min then "\n" else " "
    v2.spacingOuter = if not a1 then "\n" else if not a1.min then "\n" else ""
    return v2
end

function createIndent(a1) -- Line: 439 -- types: a1: number
    return string.rep(" ", a1)
end

local function format(a1, a2) -- Line: 449
    -- upvalues: validateOptions (val), findPlugin (val), getConfig (val), printBasicValue (val), u124 (val)
    -- upvalues: printComplexValue (val)
    local v1
    if a2 then
        validateOptions(a2)
        if a2.plugins then
            v1 = findPlugin(a2.plugins, a1)
            if v1 ~= nil then
                return printPlugin(v1, a1, getConfig(a2), "", 0, {})
            end
        end
    end
    v1 = printBasicValue(
        a1,
        if not a2 then u124.printFunctionName else if a2.printFunctionName == nil then u124.printFunctionName else a2.printFunctionName,
        if not a2 then u124.escapeRegex else if a2.escapeRegex == nil then u124.escapeRegex else a2.escapeRegex,
        if not a2 then u124.escapeString else if a2.escapeString == nil then u124.escapeString else a2.escapeString
    )
    if v1 ~= nil then
        return v1
    end
    return printComplexValue(a1, getConfig(a2), "", 0, {}, nil)
end

local v3 = {
    AsymmetricMatcher = AsymmetricMatcher,
    ConvertAnsi = ConvertAnsi,
    ReactElement = ReactElement,
    ReactTestComponent = ReactTestComponent,
    RobloxInstance = RobloxInstance,
    RedactStackTraces = RedactStackTraces,
}
local v4 = {
    __index = function(a1, a2) -- Line: 487 -- upvalues: Error (val)
        error(Error.new("Can't find pretty-format plugin: " .. a2))
    end,
}
setmetatable(v3, v4)
return {format = format, default = format, plugins = v3, DEFAULT_OPTIONS = u124}