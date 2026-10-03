-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-each@3.10.0.jest-each.bind
-- Decompile time: 3.45 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Object = v1.Object
local String = v1.String
local nilPlaceholder = require(script.Parent:WaitForChild("nilPlaceholder"))
local v2 = {}
require(script.Parent.Parent:WaitForChild("jest-types"))
local v3 = require(script.Parent.Parent:WaitForChild("jest-util"))
local ErrorWithStack = v3.ErrorWithStack
local convertDescriptorToString = v3.convertDescriptorToString
local default = require((script.Parent:WaitForChild("table")):WaitForChild("array")).default
local default_2 = require((script.Parent:WaitForChild("table")):WaitForChild("template")).default
local validation = require(script.Parent:WaitForChild("validation"))
local extractValidTemplateHeadings = validation.extractValidTemplateHeadings
local validateArrayTable = validation.validateArrayTable
local validateTemplateTableArguments = validation.validateTemplateTableArguments

local function u78() -- Line: 39
    error("Method unavailable")
end

local isArrayTable = nil
local buildArrayTests = nil
local buildTemplateTests = nil
local getHeadingKeys = nil
local applyArguments = nil

function v2.default(a1, a2) -- Line: 58
    -- upvalues: u78 (val), convertDescriptorToString (val), isArrayTable (ref), buildArrayTests (ref)
    -- upvalues: buildTemplateTests (ref), Array (val), applyArguments (ref), ErrorWithStack (val)
    local u3 = if a2 == nil then true else a2
    local u6 = a1
    if not u6 then
        u6 = u78
    end
    return function(a1, ...) -- Line: 61
        -- upvalues: convertDescriptorToString (upval), isArrayTable (upval), buildArrayTests (upval)
        -- upvalues: buildTemplateTests (upval), Array (upval), u6 (val), applyArguments (upval), u3 (val)
        -- upvalues: ErrorWithStack (upval)
        local eachBind, u8
        if not (0 < (select("#", ...))) then
            u8 = {}
        else
            u8 = {}
            u8[1] = ...
        end

        function eachBind(a1_2, a2, a3) -- Line: 67
            -- upvalues: convertDescriptorToString (upval), isArrayTable (upval), u8 (val), buildArrayTests (upval)
            -- upvalues: a1 (val), buildTemplateTests (upval), Array (upval), u6 (upval), applyArguments (upval)
            -- upvalues: u3 (upval), ErrorWithStack (upval), eachBind (val)
            local u6_2 = convertDescriptorToString(a1_2)
            local success, result = pcall(function() -- Line: 70
                -- upvalues: isArrayTable (upval), u8 (upval), buildArrayTests (upval), u6_2 (ref), a1 (upval)
                -- upvalues: buildTemplateTests (upval), Array (upval), u6 (upval), applyArguments (upval), u3 (upval)
                -- upvalues: a2 (val), a3 (val)
                return (Array.forEach(if not isArrayTable(u8) then buildTemplateTests(u6_2, a1, u8) else buildArrayTests(u6_2, a1), function(a1) -- Line: 75 -- upvalues: u6 (upval), applyArguments (upval), u3 (upval), a2 (upval), a3 (upval)
                    return u6(a1.title, applyArguments(u3, a1.arguments, a2), a3)
                end))
            end)
            if success then
                return result
            end
            local u15 = ErrorWithStack.new(result.message, eachBind)
            return (u6(u6_2, function() -- Line: 87 -- upvalues: u15 (val)
                error(u15)
            end))
        end

        return eachBind
    end
end

function isArrayTable(a1) -- Line: 99
    return #a1 == 0
end

function buildArrayTests(a1, a2) -- Line: 103 -- upvalues: validateArrayTable (val), default (val) -- types: a1: string
    validateArrayTable(a2)
    return default(a1, a2)
end

function buildTemplateTests(a1, a2, a3) -- Line: 108
    -- upvalues: Array (val), getHeadingKeys (ref), validateTemplateTableArguments (val), default_2 (val)
    local v1 = if not Array.isArray(a2) then a2 else a2[1]
    local v2 = getHeadingKeys(v1)
    validateTemplateTableArguments(v2, a3)
    return default_2(a1, v2, a3)
end

function getHeadingKeys(a1) -- Line: 117
    -- upvalues: String (val), extractValidTemplateHeadings (val)
    return String.split(extractValidTemplateHeadings(a1):gsub("%s+", ""), "|")
end

function applyArguments(a1, a2, a3) -- Line: 122
    -- upvalues: nilPlaceholder (val), Array (val), Object (val)
    local replaceNilPlaceholders, unpackTable
    local v1 = if typeof(a3) ~= "function" then 0 else debug.info(a3, "a")

    function replaceNilPlaceholders(a1) -- Line: 136
        -- upvalues: nilPlaceholder (upval), Array (upval), replaceNilPlaceholders (ref), Object (upval)
        if a1 == nilPlaceholder then
            return nil
        end
        if Array.isArray(a1) then
            return Array.map(a1, function(a1) -- Line: 140 -- upvalues: replaceNilPlaceholders (upval)
                return replaceNilPlaceholders(a1)
            end)
        end
        if typeof(a1) ~= "table" then
            return a1
        end
        Array.forEach(Object.keys(a1), function(a1_2) -- Line: 144 -- upvalues: a1 (val), replaceNilPlaceholders (upval)
            a1[a1_2] = (replaceNilPlaceholders(a1[a1_2]))
        end)
        return a1
    end

    function unpackTable(a1, a2, ...) -- Line: 154
        -- upvalues: unpackTable (ref), replaceNilPlaceholders (ref)
        local v1
        if (if a2 == nil then #a1 else a2) == 0 then
            return ...
        end
        return unpackTable(a1, v1 - 1, replaceNilPlaceholders(a1[v1]), ...)
    end

    return if not a1 then function() -- Line: 167 -- upvalues: a3 (val), unpackTable (ref), a2 (val)
        return a3(unpackTable(a2))
    end else if not (#a2 < v1) then function() -- Line: 167 -- upvalues: a3 (val), unpackTable (ref), a2 (val)
        return a3(unpackTable(a2))
    end else function(a1) -- Line: 164 -- upvalues: a3 (val), unpackTable (ref), a2 (val)
        return a3(unpackTable(a2), a1)
    end
end

return v2