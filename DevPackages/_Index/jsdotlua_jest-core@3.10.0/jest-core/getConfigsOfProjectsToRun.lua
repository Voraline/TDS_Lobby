-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-core@3.10.0.jest-core.getConfigsOfProjectsToRun
-- Decompile time: 1.04 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local v2 = {}
require(script.Parent.Parent:WaitForChild("jest-types"))
local default = (require((script.Parent:WaitForChild("getProjectDisplayName")))).default
local createProjectFilter = nil

function v2.default(a1, a2) -- Line: 23
    -- upvalues: createProjectFilter (ref), Array (val), default (val)
    local u4 = createProjectFilter(a2)
    return Array.filter(a1, function(a1) -- Line: 31 -- upvalues: default (upval), u4 (val)
        return u4((default(a1)))
    end)
end

function createProjectFilter(a1) -- Line: 40 -- upvalues: Array (val), Boolean (val) -- types: a1: table
    local selectProjects = if not Array.isArray(a1.selectProjects) then {} else a1.selectProjects
    local ignoreProjects = if not Array.isArray(a1.ignoreProjects) then {} else a1.ignoreProjects

    local function always() -- Line: 54
        return true
    end

    local u20 = if not (#selectProjects > 0) then always else function(a1) -- Line: 62 -- upvalues: Boolean (upval), Array (upval), selectProjects (val) -- types: a1: string?
        if Boolean.toJSBoolean(a1) then
            return (Array.includes(selectProjects, a1))
        end
        return a1
    end
    local u27 = if not (#ignoreProjects > 0) then always else function(a1) -- Line: 71 -- upvalues: Boolean (upval), Array (upval), ignoreProjects (val) -- types: a1: string?
        local toJSBoolean = Boolean.toJSBoolean
        return not toJSBoolean(if not Boolean.toJSBoolean(a1) then a1 else Array.includes(ignoreProjects, a1))
    end
    return function(a1) -- Line: 83 -- upvalues: Boolean (upval), u20 (val), u27 (val) -- types: a1: string?
        return Boolean.toJSBoolean(u20(a1)) and Boolean.toJSBoolean(u27(a1))
    end
end

return v2