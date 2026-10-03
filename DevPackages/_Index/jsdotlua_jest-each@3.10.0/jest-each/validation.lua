-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-each@3.10.0.jest-each.validation
-- Decompile time: 3.11 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Error = v1.Error
local String = v1.String
local v2 = {}
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
require(script.Parent.Parent:WaitForChild("jest-types"))
local format = require(script.Parent.Parent:WaitForChild("pretty-format")).format
local isTaggedTemplateLiteral = nil
local isEmptyString = nil
local isEmptyTable = nil
local pluralize = nil
local green = chalk.green
local red = chalk.red

function v2.validateArrayTable(a1) -- Line: 31
    -- upvalues: Array (val), Error (val), format (val), isTaggedTemplateLiteral (ref), isEmptyString (ref)
    -- upvalues: isEmptyTable (ref)
    if not Array.isArray(a1) then
        error(Error.new("`.each` must be called with an Array or Tagged Template Literal.\n\n" .. ("Instead was called with: %s\n"):format((format(a1, {maxDepth = 1, min = true})))))
    end
    if isTaggedTemplateLiteral(a1) then
        if isEmptyString(a1[1]) then
            error(Error.new("Error: `.each` called with an empty Tagged Template Literal of table data.\n"))
        end
        error(Error.new("Error: `.each` called with a Tagged Template Literal with no data, remember to interpolate with ${expression} syntax.\n"))
    end
    if isEmptyTable(a1) then
        error(Error.new("Error: `.each` called with an empty Array of table data.\n"))
    end
end

function isTaggedTemplateLiteral(a1) -- Line: 62
    return a1.raw ~= nil
end

function isEmptyTable(a1) -- Line: 66
    return #a1 == 0
end

function isEmptyString(a1) -- Line: 70 -- upvalues: String (val)
    local v1 = false
    if typeof(a1) == "string" then
        v1 = String.trim(a1) == ""
    end
    return v1
end

function v2.validateTemplateTableArguments(a1, a2) -- Line: 74
    -- upvalues: Array (val), Error (val), green (val), red (val), format (val), pluralize (ref)
    Array.forEach(a2, function(a1_2, a2_2) -- Line: 76
        -- upvalues: a1 (val), Error (upval), green (upval), Array (upval), red (upval), format (upval), a2 (val)
        -- upvalues: pluralize (upval)
        local v1 = #a1 - #a1_2
        local v2 = if not (v1 >= 0) then v1 - #a1 else v1
        if v2 ~= 0 then
            local v3 = error
            local new = Error.new
            local v4 = ("%s arguments supplied for given headings:\n"):format(if not (v1 > 0) then "Too many" else "Not enough")
            local v5 = tostring((green((Array.join(a1, " | ")))))
            local v6 = tostring((red((format(a2)))))
            local v7 = red((tostring(v2)))
            local v8 = pluralize("argument", v2)
            v3(new(v4 .. v5 .. "\n\n" .. "Received:\n" .. v6 .. "\n\n" .. ("%s %s %s in row %d"):format(if not (v1 > 0) then "Remove" else "Missing", v7, v8, a2_2)))
        end
    end)
end

function pluralize(a1, a2) -- Line: 105 -- types: a1: string, a2: number
    return a1 .. (if a2 ~= 1 then "s" else "")
end

function v2.extractValidTemplateHeadings(a1) -- Line: 120
    -- upvalues: Array (val), String (val), Error (val), green (val), red (val), format (val)
    local v1 = a1:match("^s*[^%.*]+s*$")
    local v2 = nil
    local v3 = nil
    if v1 then
        v2 = Array.filter(String.split(v1, "\n"), function(a1) -- Line: 125 -- upvalues: String (upval)
            return String.trim(a1) ~= ""
        end)
    end
    if v2 and #v2 > 0 then
        v3 = Array.some(Array.map(String.split(v2[1], "|"), function(a1) -- Line: 130 -- upvalues: String (upval)
            return String.trim(a1)
        end), function(a1) -- Line: 133
            return a1:match("%s") ~= nil
        end)
    end
    if v1 == nil or v3 then
        error(Error.new("Table headings do not conform to expected format:\n\n" .. (green("heading1 | headingN")) .. "\n\n" .. "Received:\n\n" .. red(format(a1))))
    end
    return v2[1]
end

return v2