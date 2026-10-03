-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-reporters@3.10.0.jest-reporters.getSnapshotStatus
-- Decompile time: 1.41 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Boolean = v1.Boolean
local Array = v1.Array
local v2 = {}
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
require(script.Parent.Parent:WaitForChild("jest-test-result"))
local pluralize = (require((script.Parent.Parent:WaitForChild("jest-util")))).pluralize

local function u40(...) -- Line: 25 -- upvalues: chalk (val)
    return chalk.bold(chalk.red(...))
end

local function u41(...) -- Line: 28 -- upvalues: chalk (val)
    return chalk.bold(chalk.green(...))
end

local function u42(...) -- Line: 31 -- upvalues: chalk (val)
    return chalk.bold(chalk.green(...))
end

local function u43(...) -- Line: 34 -- upvalues: chalk (val)
    return chalk.bold(chalk.yellow(...))
end

function v2.default(a1, a2) -- Line: 39
    -- upvalues: Boolean (val), u41 (val), pluralize (val), u42 (val), u40 (val), u43 (val), Array (val)
    local u2 = {}
    if Boolean.toJSBoolean(a1.added) then
        table.insert(u2, (u41(" › " .. (pluralize("snapshot", a1.added)) .. " written.")))
    end
    if Boolean.toJSBoolean(a1.updated) then
        table.insert(u2, (u42(" › " .. (pluralize("snapshot", a1.updated)) .. " updated.")))
    end
    if Boolean.toJSBoolean(a1.unmatched) then
        table.insert(u2, (u40(" › " .. (pluralize("snapshot", a1.unmatched)) .. " failed.")))
    end
    if Boolean.toJSBoolean(a1.unchecked) then
        if not a2 then
            table.insert(u2, (u43(" › " .. (pluralize("snapshot", a1.unchecked)) .. " obsolete.")))
        else
            table.insert(u2, (u42(" › " .. (pluralize("snapshot", a1.unchecked)) .. " removed.")))
        end
        Array.forEach(a1.uncheckedKeys, function(a1) -- Line: 64 -- upvalues: u2 (val) -- types: a1: string
            table.insert(u2, "\t" .. " • " .. a1)
        end)
    end
    if a1.fileDeleted then
        table.insert(u2, (u42(" › snapshot file removed.")))
    end
    return u2
end

return v2