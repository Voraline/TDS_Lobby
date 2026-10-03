-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-each@3.10.0.jest-each.table.template
-- Decompile time: 0.92 ms

local v1 = require(script.Parent.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Object = v1.Object
local v2 = {}
local convertRowToTable = nil
local convertTableToTemplates = nil
require(script.Parent.Parent.Parent:WaitForChild("jest-types"))
require(script.Parent:WaitForChild("interpolation"))
local interpolateVariables = (require((script.Parent:WaitForChild("interpolation")))).interpolateVariables

function v2.default(a1, a2, a3) -- Line: 32
    -- upvalues: convertRowToTable (ref), convertTableToTemplates (ref), Array (val), Object (val)
    -- upvalues: interpolateVariables (val)
    return Array.map(convertTableToTemplates(convertRowToTable(a3, a2), a2), function(a1_2, a2) -- Line: 35 -- upvalues: Object (upval), interpolateVariables (upval), a1 (val)
        return {
            arguments = {(Object.assign({}, a1_2))},
            title = interpolateVariables(a1, a1_2, a2),
        }
    end)
end

function convertRowToTable(a1, a2) -- Line: 46
    return a1
end

function convertTableToTemplates(a1, a2) -- Line: 51 -- upvalues: Array (val), Object (val)
    return Array.map(a1, function(a1) -- Line: 52 -- upvalues: Array (upval), Object (upval), a2 (val)
        return Array.reduce(a1, function(a1, a2_2, a3) -- Line: 53 -- upvalues: Object (upval), a2 (upval)
            return Object.assign(a1, {[a2[a3]] = a2_2})
        end, {})
    end)
end

return v2