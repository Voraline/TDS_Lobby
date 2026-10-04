-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-core@3.10.0.jest-core.getProjectNamesMissingWarning
-- Decompile time: 1.68 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local v2 = {}
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
require(script.Parent.Parent:WaitForChild("jest-types"))
local default = (require((script.Parent:WaitForChild("getProjectDisplayName")))).default

function v2.default(a1, a2) -- Line: 20
    -- upvalues: Array (val), Boolean (val), default (val), chalk (val)
    local v1 = #Array.filter(a1, function(a1) -- Line: 27 -- upvalues: Boolean (upval), default (upval)
        return not Boolean.toJSBoolean(default(a1))
    end)
    if v1 == 0 then
        return nil
    end
    local v2 = {}
    if Boolean.toJSBoolean(a2.selectProjects) then
        table.insert(v2, "--selectProjects")
    end
    if Boolean.toJSBoolean(a2.ignoreProjects) then
        table.insert(v2, "--ignoreProjects")
    end
    return chalk.yellow((("You provided values for %s but %s.\n"):format(
        tostring((Array.join(v2, " and "))),
        if v1 ~= 1 then ("%s projects do not have a name"):format((tostring(v1))) else "a project does not have a name"
    )) .. "Set displayName in the config of all projects in order to disable this warning.\n")
end

return v2