-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-config@3.10.0.jest-config.resolveConfigPath
-- Decompile time: 3.11 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Error = v1.Error
local String = v1.String
local v2 = {}
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
local ValidationError = (require((script.Parent.Parent:WaitForChild("jest-validate")))).ValidationError
require(script.Parent.Parent:WaitForChild("jest-types"))
local constants = require(script.Parent:WaitForChild("constants"))
local JEST_CONFIG_BASE_NAME = constants.JEST_CONFIG_BASE_NAME
local JEST_CONFIG_EXT_ORDER = constants.JEST_CONFIG_EXT_ORDER
local utils = require(script.Parent:WaitForChild("utils"))
local BULLET = utils.BULLET
local DOCUMENTATION_NOTE = utils.DOCUMENTATION_NOTE
local resolveConfigPathByTraversing = nil
local makeResolutionErrorMessage = nil
local makeMultipleConfigsWarning = nil

local function isFile(a1) -- Line: 51 -- upvalues: String (val) -- types: a1: userdata?
    local v1 = false
    if typeof(a1) == "Instance" then
        v1 = a1:IsA("ModuleScript") and String.endsWith(a1.Name, ".config")
    end
    return v1
end

local function getConfigFilename(a1) -- Line: 57 -- upvalues: JEST_CONFIG_BASE_NAME (val) -- types: a1: string
    return JEST_CONFIG_BASE_NAME .. a1
end

function v2.default(a1, a2, a3) -- Line: 61
    -- upvalues: String (val), Error (val), resolveConfigPathByTraversing (ref)
    local v1 = if a3 == nil then false else a3

    local function resolvePath(a1, a2) -- Line: 70 -- types: a1: userdata, a2: string
        return a1[a2]
    end

    local v2 = if typeof(a1) ~= "string" then a1 else a2[a1]
    local v3 = false
    if typeof(v2) == "Instance" then
        v3 = v2:IsA("ModuleScript") and String.endsWith(v2.Name, ".config")
    end
    if v3 then
        return v2
    end
    if v2 == nil then
        error(Error.new("Can't find a root directory while resolving a config file path.\n" .. (("Provided path to resolve: %s\n"):format((tostring(a1)))) .. ("cwd: %s"):format((tostring(a2)))))
    end
    return resolveConfigPathByTraversing(v2, a1, a2, v1)
end

local function isJestConfigFile(a1) -- Line: 107 -- upvalues: JEST_CONFIG_BASE_NAME (val) -- types: a1: userdata
    return a1:IsA("ModuleScript") and a1.Name == JEST_CONFIG_BASE_NAME
end

function resolveConfigPathByTraversing(a1, a2, a3, a4) -- Line: 112
    -- upvalues: Error (val), makeResolutionErrorMessage (ref), Array (val), isJestConfigFile (val)
    -- upvalues: ValidationError (val), makeMultipleConfigsWarning (ref), resolveConfigPathByTraversing (ref)
    if a1 == nil or typeof(a1.GetChildren) ~= "function" then
        error(Error.new(makeResolutionErrorMessage(a2, a3)))
    end
    local v1 = Array.filter(a1:GetChildren(), function(a1) -- Line: 126 -- upvalues: isJestConfigFile (upval)
        local success, result = pcall(isJestConfigFile, a1)
        return success and result
    end)
    if not a4 and #v1 > 1 then
        error(ValidationError.new(makeMultipleConfigsWarning(v1)))
    end
    if #v1 > 0 then
        return v1[1]
    end
    if a1 == game then
        error(Error.new(makeResolutionErrorMessage(a2, a3)))
    end
    return resolveConfigPathByTraversing(a1.Parent, a2, a3, a4)
end

function makeResolutionErrorMessage(a1, a2) -- Line: 173
    -- upvalues: Array (val), JEST_CONFIG_EXT_ORDER (val), JEST_CONFIG_BASE_NAME (val)
    return "Could not find a config file based on provided values:\n" .. (("path: \"%*\"\n"):format(a1)) .. (("cwd: \"%*\"\n"):format(a2)) .. "Config paths must be specified by either a direct path to a config script\n" .. "or a path to a directory. If directory is given, Jest will try to\n" .. ("traverse directory tree up, until it finds one of those files in exact order: %*."):format((Array.join(Array.map(JEST_CONFIG_EXT_ORDER, function(a1) -- Line: 187 -- upvalues: JEST_CONFIG_BASE_NAME (upval)
        return (("\"%*\""):format(JEST_CONFIG_BASE_NAME .. a1))
    end), " or ")))
end

local function extraIfPackageJson(a1) -- Line: 194
    return ""
end

function makeMultipleConfigsWarning(a1) -- Line: 203
    -- upvalues: BULLET (val), chalk (val), Array (val), DOCUMENTATION_NOTE (val)
    return (("%*%*"):format(BULLET, (chalk.bold("Multiple configurations found")))), (Array.join(Array.concat(Array.map(a1, function(a1) -- Line: 207
        return (("    * %*%*"):format("", (a1:GetFullName())))
    end), {
        "",
        "  Implicit config resolution does not allow multiple configuration files.",
        "  Either remove unused config files or select one explicitly with `--config`.",
    }), "\n")), DOCUMENTATION_NOTE
end

return v2