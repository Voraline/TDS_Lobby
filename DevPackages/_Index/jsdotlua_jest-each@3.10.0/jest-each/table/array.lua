-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-each@3.10.0.jest-each.table.array
-- Decompile time: 2.55 ms

local v1 = require(script.Parent.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local v2 = require(script.Parent.Parent.Parent:WaitForChild("luau-regexp"))
local v3 = {}
local format = require(script.Parent:WaitForChild("format"))
require(script.Parent.Parent.Parent:WaitForChild("jest-types"))
local format_2 = require(script.Parent.Parent.Parent:WaitForChild("pretty-format")).format
local interpolateVariables = (require((script.Parent:WaitForChild("interpolation")))).interpolateVariables
local u63 = v2("%[sdifjoOp]")
local isTemplates = nil
local normaliseTable = nil
local formatTitle = nil
local interpolateEscapedPlaceholders = nil
local isTable = nil
local colToRow = nil
local normalisePlaceholderValue = nil
local getMatchingPlaceholders = nil
local interpolatePrettyPlaceholder = nil
local interpolateTitleIndex = nil

function v3.default(a1, a2) -- Line: 60
    -- upvalues: isTemplates (ref), Array (val), interpolateVariables (val), normaliseTable (ref), formatTitle (ref)
    if isTemplates(a1, a2) then
        return Array.map(a2, function(a1_2, a2) -- Line: 62 -- upvalues: interpolateVariables (upval), a1 (val)
            return {
                arguments = {a1_2},
                title = (interpolateVariables(a1, a1_2, a2)):gsub("%%%%", "%%"),
            }
        end)
    end
    return Array.map(normaliseTable(a2), function(a1_2, a2) -- Line: 72 -- upvalues: Array (upval), formatTitle (upval), a1 (val)
        return {
            arguments = Array.map(a1_2, function(a1) -- Line: 74
                return a1
            end),
            title = formatTitle(a1, a1_2, a2),
        }
    end)
end

function isTemplates(a1, a2) -- Line: 84
    -- upvalues: u63 (val), interpolateEscapedPlaceholders (ref), isTable (ref), Array (val)
    return not u63:test((interpolateEscapedPlaceholders(a1))) and not isTable(a2) and Array.every(a2, function(a1) -- Line: 90
        local v1 = false
        if a1 ~= nil then
            v1 = typeof(a1) == "table"
        end
        return v1
    end)
end

function normaliseTable(a1) -- Line: 95 -- upvalues: isTable (ref), Array (val), colToRow (ref)
    if isTable(a1) then
        return a1
    end
    return (Array.map(a1, colToRow))
end

function isTable(a1) -- Line: 99 -- upvalues: Array (val)
    return Array.every(a1, Array.isArray)
end

function colToRow(a1) -- Line: 105
    return {a1}
end

function formatTitle(a1, a2, a3) -- Line: 109
    -- upvalues: Array (val), getMatchingPlaceholders (ref), normalisePlaceholderValue (ref), Boolean (val)
    -- upvalues: interpolatePrettyPlaceholder (ref), format (val), interpolateTitleIndex (ref)
    -- upvalues: interpolateEscapedPlaceholders (ref)
    local reduce = Array.reduce
    local v1 = interpolateTitleIndex
    local v2 = interpolateEscapedPlaceholders(a1)
    return (reduce(a2, function(a1, a2) -- Line: 110
        -- upvalues: getMatchingPlaceholders (upval), normalisePlaceholderValue (upval), Boolean (upval)
        -- upvalues: interpolatePrettyPlaceholder (upval), format (upval)
        local v1 = getMatchingPlaceholders(a1)[1]
        local v2 = normalisePlaceholderValue(a2)
        if not Boolean.toJSBoolean(v1) then
            return a1
        end
        if v1 == "%p" then
            return interpolatePrettyPlaceholder(a1, v2)
        end
        return format(a1, v2)
    end, v1(v2, a3))):gsub(
        "@@__JEST_EACH_PLACEHOLDER_ESCAPE__@@",
        "%%"
    )
end

function normalisePlaceholderValue(a1) -- Line: 126
    if typeof(a1) == "string" then
        return (a1:gsub("%%", "@@__JEST_EACH_PLACEHOLDER_ESCAPE__@@"))
    end
    return a1
end

function getMatchingPlaceholders(a1) -- Line: 135 -- types: a1: string
    local v1 = nil
    for i in a1:gmatch("%%[sdifjoOp#]") do
        if v1 == nil then
            v1 = {}
        end
        table.insert(v1, i)
    end
    return v1 or {}
end

function interpolateEscapedPlaceholders(a1) -- Line: 148 -- types: a1: string
    return (a1:gsub("%%%%", "@@__JEST_EACH_PLACEHOLDER_ESCAPE__@@"))
end

function interpolateTitleIndex(a1, a2) -- Line: 153 -- types: a1: string, a2: number
    return (a1:gsub("%%#", tostring(a2), 1))
end

function interpolatePrettyPlaceholder(a1, a2) -- Line: 158 -- upvalues: format_2 (val) -- types: a1: string
    return (a1:gsub("%%p", format_2(a2, {maxDepth = 1, min = true}), 1))
end

return v3