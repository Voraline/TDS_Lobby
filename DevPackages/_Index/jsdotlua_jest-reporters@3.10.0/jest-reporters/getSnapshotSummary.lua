-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-reporters@3.10.0.jest-reporters.getSnapshotSummary
-- Decompile time: 7.13 ms

local v1 = {}
local v2 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v2.Array
local Boolean = v2.Boolean
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
require(script.Parent.Parent:WaitForChild("jest-test-result"))
require(script.Parent.Parent:WaitForChild("jest-types"))
local pluralize = require(script.Parent.Parent:WaitForChild("jest-util")).pluralize
local formatTestPath = (require((script.Parent:WaitForChild("utils")))).formatTestPath

local function u58(...) -- Line: 32 -- upvalues: chalk (val)
    return chalk.bold(chalk.red(...))
end

local function u59(...) -- Line: 35 -- upvalues: chalk (val)
    return chalk.bold(chalk.yellow(...))
end

local function u60(...) -- Line: 38 -- upvalues: chalk (val)
    return chalk.bold(chalk.green(...))
end

local dim = chalk.dim

local function u62(...) -- Line: 42 -- upvalues: chalk (val)
    return chalk.bold(chalk.green(...))
end

local bold = chalk.bold

local function u64(...) -- Line: 46 -- upvalues: chalk (val)
    return chalk.bold(chalk.green(...))
end

function v1.default(a1, a2, a3) -- Line: 51
    -- upvalues: bold (val), Boolean (val), u60 (val), pluralize (val), u58 (val), dim (val), u64 (val), u62 (val)
    -- upvalues: u59 (val), formatTestPath (val), Array (val)
    local u3 = {}
    table.insert(u3, (bold("Snapshot Summary")))
    if Boolean.toJSBoolean(a1.added) then
        table.insert(
            u3,
            (u60(" › " .. (pluralize("snapshot", a1.added)) .. " written ")) .. "from " .. (pluralize("test suite", a1.filesAdded)) .. "."
        )
    end
    if Boolean.toJSBoolean(a1.unmatched) then
        table.insert(
            u3,
            (u58(" › " .. (pluralize("snapshot", a1.unmatched)) .. " failed")) .. " from " .. (pluralize("test suite", a1.filesUnmatched)) .. ". " .. (dim("Inspect your code changes or " .. a3 .. " to update them."))
        )
    end
    if Boolean.toJSBoolean(a1.updated) then
        table.insert(
            u3,
            (u64(" › " .. (pluralize("snapshot", a1.updated)) .. " updated ")) .. "from " .. (pluralize("test suite", a1.filesUpdated)) .. "."
        )
    end
    if Boolean.toJSBoolean(a1.filesRemoved) then
        if not a1.didUpdate then
            table.insert(
                u3,
                (u59(" › " .. (pluralize("snapshot file", a1.filesRemoved)) .. " obsolete ")) .. "from " .. (pluralize("test suite", a1.filesRemoved)) .. ". " .. (dim("To remove " .. (if a1.filesRemoved ~= 1 then "them all" else "it") .. ", " .. a3 .. "."))
            )
        else
            table.insert(
                u3,
                (u62(" › " .. (pluralize("snapshot file", a1.filesRemoved)) .. " removed ")) .. "from " .. (pluralize("test suite", a1.filesRemoved)) .. "."
            )
        end
    end
    if a1.filesRemovedList then
        local v1 = #a1.filesRemovedList
        if v1 > 0 then
            v1 = a1.filesRemovedList[1]
            local v2 = table.pack(table.unpack(a1.filesRemovedList, 2))
            table.insert(u3, "  " .. " ↳ " .. " " .. " • " .. (formatTestPath(a2, v1)))
            Array.forEach(v2, function(a1) -- Line: 117 -- upvalues: u3 (val), formatTestPath (upval), a2 (val)
                table.insert(u3, "    " .. " • " .. (formatTestPath(a2, a1)))
            end)
        end
    end
    if Boolean.toJSBoolean(a1.unchecked) then
        if not a1.didUpdate then
            table.insert(
                u3,
                (u59(" › " .. (pluralize("snapshot", a1.unchecked)) .. " obsolete ")) .. "from " .. (pluralize("test suite", #a1.uncheckedKeysByFile)) .. ". " .. (dim("To remove " .. (if a1.unchecked ~= 1 then "them all" else "it") .. ", " .. a3 .. "."))
            )
        else
            table.insert(
                u3,
                (u62(" › " .. (pluralize("snapshot", a1.unchecked)) .. " removed ")) .. "from " .. (pluralize("test suite", #a1.uncheckedKeysByFile)) .. "."
            )
        end
    end
    Array.forEach(a1.uncheckedKeysByFile, function(a1) -- Line: 149 -- upvalues: u3 (val), formatTestPath (upval), a2 (val), Array (upval)
        table.insert(u3, "  " .. " ↳ " .. (formatTestPath(a2, a1.filePath)))
        Array.forEach(a1.keys, function(a1) -- Line: 152 -- upvalues: u3 (upval)
            table.insert(u3, "    " .. " • " .. a1)
        end)
    end)
    return u3
end

return v1