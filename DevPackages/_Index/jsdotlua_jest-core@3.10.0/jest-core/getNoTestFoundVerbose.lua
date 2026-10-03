-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-core@3.10.0.jest-core.getNoTestFoundVerbose
-- Decompile time: 2.14 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local Object = v1.Object
local v2 = {}
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
require(script.Parent.Parent:WaitForChild("jest-types"))
local default = require(script.Parent:WaitForChild("pluralize")).default
require(script.Parent:WaitForChild("types"))

function v2.default(a1, a2, a3) -- Line: 26
    -- upvalues: Array (val), Object (val), Boolean (val), default (val), chalk (val)
    local v1 = Array.map(a1, function(a1) -- Line: 31 -- upvalues: Array (upval), Object (upval), Boolean (upval), default (upval), chalk (upval)
        local stats
        if a1.matches.stats == nil then
            stats = {}
        else
            stats = a1.matches.stats
            if not stats then
                stats = {}
            end
        end
        local config = a1.context.config
        local v1 = Array.join(Array.filter(Array.map(Object.keys(stats), function(a1) -- Line: 38
            -- upvalues: config (val), Boolean (upval), Array (upval), default (upval), stats (val), chalk (upval)
            if a1 == "roots" and #config.roots == 1 then
                return nil
            end
            local v1 = config[a1]
            if not Boolean.toJSBoolean(v1) then
                return nil
            end
            local v2 = if not Array.isArray(v1) then tostring(v1) else Array.join(v1, ", ")
            local v3 = default("match", Boolean.toJSBoolean(stats[a1]) and stats[a1] or 0, "es")
            return ("  %s: %s - %s"):format(a1, chalk.yellow(v2), (tostring(v3)))
        end), function(a1) -- Line: 54 -- upvalues: Boolean (upval)
            return Boolean.toJSBoolean(a1)
        end), "\n")
        if not Boolean.toJSBoolean(a1.matches.total) then
            return (("No files found in %s.\n"):format((tostring(config.rootDir)))) .. "Make sure Jest's configuration does not exclude this directory.\nTo set up Jest, make sure a package.json file exists.\nJest Documentation: https://jestjs.io/docs/configuration"
        end
        local v2 = ("In %s\n"):format((chalk.bold((tostring(config.rootDir)))))
        return v2 .. (("  %s checked.\n"):format((default("file", Boolean.toJSBoolean(a1.matches.total) and a1.matches.total or 0, "s")))) .. v1
    end)
    local v2 = if not a2.runTestsByPath then ("Pattern: %s - 0 matches"):format((chalk.yellow(a2.testPathPattern))) else ("Files: %s"):format((Array.join(Array.map(a2.nonFlagArgs, function(a1) -- Line: 73
        return ("\"%s\""):format((tostring(a1)))
    end), ", ")))
    if Boolean.toJSBoolean(a3) then
        return ("%s\n%s\n%s"):format(chalk.bold("No tests found, exiting with code 0"), tostring((Array.join(v1, "\n"))), (tostring(v2)))
    end
    return (("%s\n"):format((chalk.bold("No tests found, exiting with code 1")))) .. "Run with `--passWithNoTests` to exit with code 0" .. "\n" .. (Array.join(v1, "\n")) .. "\n" .. v2
end

return v2