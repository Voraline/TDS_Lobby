-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-config@3.10.0.jest-config.ReporterValidationErrors
-- Decompile time: 2.48 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local String = v1.String
local v2 = {}
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
require(script.Parent.Parent:WaitForChild("jest-types"))
local getType = require(script.Parent.Parent:WaitForChild("jest-get-type")).getType
local ValidationError = require(script.Parent.Parent:WaitForChild("jest-validate")).ValidationError
local utils = require(script.Parent:WaitForChild("utils"))
local BULLET = utils.BULLET
local DOCUMENTATION_NOTE = utils.DOCUMENTATION_NOTE
local JSON = (require((script.Parent.Parent:WaitForChild("jest-roblox-shared")))).nodeUtils.JSON
local validateArrayReporter = nil
local u73 = {"table", "ModuleScript"}
local u82 = ("%sReporter Validation Error"):format((tostring(BULLET)))

local function createReporterError(a1, a2) -- Line: 52
    -- upvalues: chalk (val), Array (val), u73 (val), getType (val), ValidationError (val), u82 (val)
    -- upvalues: DOCUMENTATION_NOTE (val)
    return ValidationError.new(
        u82,
        (("  Reporter at index %s must be of type:\n"):format((tostring(a1)))) .. (("    %s\n"):format((chalk.green((chalk.bold((Array.join(u73, " or ")))))))) .. "  but instead received:\n" .. ("    %s"):format((chalk.red((chalk.bold((getType(a2))))))),
        DOCUMENTATION_NOTE
    )
end

v2.createReporterError = createReporterError

local function createArrayReporterError(a1, a2, a3, a4, a5, a6) -- Line: 64
    -- upvalues: chalk (val), getType (val), Array (val), String (val), JSON (val), ValidationError (val), u82 (val)
    -- upvalues: DOCUMENTATION_NOTE (val)
    return ValidationError.new(
        u82,
        (("  Unexpected value for %s "):format(a6)) .. (("at index %s of reporter at index %s\n"):format(tostring(a3), (tostring(a2)))) .. "  Expected:\n" .. (("    %s\n"):format((chalk.red((chalk.bold(a5)))))) .. "  Got:\n" .. (("    %s\n"):format((chalk.green((chalk.bold((getType(a4)))))))) .. "  Reporter configuration:\n" .. ("    %s"):format((chalk.green((chalk.bold((Array.join(String.split(JSON.stringify(a1, nil, 2), "\n"), "\n    "))))))),
        DOCUMENTATION_NOTE
    )
end

v2.createArrayReporterError = createArrayReporterError

function v2.validateReporters(a1) -- Line: 86
    -- upvalues: Array (val), Boolean (val), validateArrayReporter (ref), createReporterError (val)
    return Array.every(a1, function(a1, a2) -- Line: 87
        -- upvalues: Boolean (upval), Array (upval), validateArrayReporter (upval), createReporterError (upval)
        if Boolean.toJSBoolean(Array.isArray(a1)) then
            validateArrayReporter(a1, a2)
        elseif typeof(a1) ~= "string" then
            error(createReporterError(a2, a1))
        end
        return true
    end)
end

function validateArrayReporter(a1, a2) -- Line: 98 -- upvalues: createArrayReporterError (val) -- types: a2: number
    local v1, v2 = table.unpack(a1, 1, 2)
    if typeof(v1) == "Instance" and v1:isA("ModuleScript") then
        if typeof(v2) ~= "table" then
            error(createArrayReporterError(a1, a2, 1, v2, "table", "Reporter Configuration"))
        end
        return
    end
    error(createArrayReporterError(a1, a2, 0, v1, "ModuleScript", "Path"))
end

return v2