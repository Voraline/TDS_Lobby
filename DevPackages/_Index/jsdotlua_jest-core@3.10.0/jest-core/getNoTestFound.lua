-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-core@3.10.0.jest-core.getNoTestFound
-- Decompile time: 5.97 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local v2 = {}
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
require(script.Parent.Parent:WaitForChild("jest-types"))
local default = require(script.Parent:WaitForChild("pluralize")).default
require(script.Parent:WaitForChild("types"))

function v2.default(a1, a2, a3) -- Line: 22
    -- upvalues: Array (val), Boolean (val), chalk (val), default (val)
    local v1 = Array.reduce(a1, function(a1, a2) -- Line: 29 -- upvalues: Boolean (upval) -- types: a1: number
        return a1 + (Boolean.toJSBoolean(a2.matches.total) and a2.matches.total or 0)
    end, 0)
    local v2 = if not Boolean.toJSBoolean(a2.runTestsByPath) then ("Pattern: %s - 0 matches"):format((chalk.yellow(a2.testPathPattern))) else ("Files: %s"):format((tostring((Array.join(Array.map(a2.nonFlagArgs, function(a1) -- Line: 40
        return ("\"%s\""):format((tostring(a1)))
    end), ", ")))))
    if Boolean.toJSBoolean(a3) then
        return (("%s\n"):format((chalk.bold("No tests found, exiting with code 0")))) .. (("In %s"):format((chalk.bold(a2.rootDir)))) .. "\n" .. (("  %s checked across %s. Run with `--verbose` for more details."):format(
            tostring((default("file", v1, "s"))),
            (tostring((default("project", #a1, "s"))))
        )) .. ("\n%s"):format((tostring(v2)))
    end
    return (("%s\n"):format((chalk.bold("No tests found, exiting with code 1")))) .. "Run with `--passWithNoTests` to exit with code 0" .. "\n" .. (("In %s"):format((chalk.bold(a2.rootDir)))) .. "\n" .. (("  %s checked across %s. Run with `--verbose` for more details."):format(
        tostring((default("file", v1, "s"))),
        (tostring((default("project", #a1, "s"))))
    )) .. ("\n%s"):format((tostring(v2)))
end

return v2