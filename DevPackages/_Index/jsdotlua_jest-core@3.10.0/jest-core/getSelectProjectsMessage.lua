-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-core@3.10.0.jest-core.getSelectProjectsMessage
-- Decompile time: 2.63 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local v2 = {}
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
require(script.Parent.Parent:WaitForChild("jest-types"))
local default = require(script.Parent:WaitForChild("getProjectDisplayName")).default
local getNoSelectionWarning = nil
local getProjectsRunningMessage = nil
local getProjectNameListElement = nil

function v2.default(a1, a2) -- Line: 27
    -- upvalues: getNoSelectionWarning (ref), getProjectsRunningMessage (ref)
    if #a1 == 0 then
        return getNoSelectionWarning(a2)
    end
    return getProjectsRunningMessage(a1)
end

function getNoSelectionWarning(a1) -- Line: 44 -- upvalues: Boolean (val), chalk (val) -- types: a1: table
    local toJSBoolean = Boolean.toJSBoolean
    local selectProjects = if not Boolean.toJSBoolean(a1.ignoreProjects) then a1.ignoreProjects else a1.selectProjects
    if toJSBoolean(selectProjects) then
        return chalk.yellow("You provided values for --selectProjects and --ignoreProjects, but no projects were found matching the selection.\nAre you ignoring all the selected projects?\n")
    end
    if Boolean.toJSBoolean(a1.ignoreProjects) then
        return chalk.yellow("You provided values for --ignoreProjects, but no projects were found matching the selection.\nAre you ignoring all projects?\n")
    end
    if Boolean.toJSBoolean(a1.selectProjects) then
        return chalk.yellow("You provided values for --selectProjects but no projects were found matching the selection.\n")
    end
    return chalk.yellow("No projects were found.\n")
end

function getProjectsRunningMessage(a1) -- Line: 71
    -- upvalues: default (val), chalk (val), Array (val), getProjectNameListElement (ref)
    if #a1 == 1 then
        return ("Running one project: %s\n"):format((chalk.bold((default(a1[1])))))
    end
    local v1 = Array.join(Array.sort(Array.map(a1, getProjectNameListElement)), "\n")
    return ("Running %s projects:\n%s\n"):format(tostring(#a1), (tostring(v1)))
end

function getProjectNameListElement(a1) -- Line: 80 -- upvalues: default (val), Boolean (val), chalk (val)
    local v1 = default(a1)
    return ("- %s"):format((tostring(if not Boolean.toJSBoolean(v1) then "<unnamed project>" else chalk.bold(v1))))
end

return v2