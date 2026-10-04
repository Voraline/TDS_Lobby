-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-reporters@3.10.0.jest-reporters.utils
-- Decompile time: 20.62 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local String = v1.String
local v2 = {}
local path = require(script.Parent.Parent:WaitForChild("path")).path
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))

local function u32(a1) -- Line: 22 -- types: a1: string
    return a1:gsub("\\", "/")
end

require(script.Parent.Parent:WaitForChild("jest-test-result"))
require(script.Parent.Parent:WaitForChild("jest-types"))
local v3 = require(script.Parent.Parent:WaitForChild("jest-util"))
local formatTime = v3.formatTime
local pluralize = v3.pluralize
require(script.Parent:WaitForChild("types"))
local relativePath = nil
local renderTime = nil

function v2.printDisplayName(a1) -- Line: 49 -- upvalues: chalk (val), Boolean (val)
    local displayName = a1.displayName

    local function u2(...) -- Line: 53 -- upvalues: chalk (upval)
        return chalk.reset(chalk.inverse(chalk.white(...)))
    end

    if not Boolean.toJSBoolean(displayName) then
        return ""
    end
    local name = nil
    local color = nil
    if displayName ~= nil then
        name = displayName.name
        color = displayName.color
    end
    return if chalk.supportsColor == nil then (function(...) -- Line: 64 -- upvalues: Boolean (upval), color (ref), chalk (upval), u2 (val)
        if Boolean.toJSBoolean(color) and chalk[color] ~= nil then
            return chalk.reset(chalk.inverse(chalk[color](...)))
        end
        return u2(...)
    end)((" %s "):format(name)) else if chalk.supportsColor ~= true then name else (function(...) -- Line: 64 -- upvalues: Boolean (upval), color (ref), chalk (upval), u2 (val)
        if Boolean.toJSBoolean(color) and chalk[color] ~= nil then
            return chalk.reset(chalk.inverse(chalk[color](...)))
        end
        return u2(...)
    end)((" %s "):format(name))
end

function v2.trimAndFormatPath(a1, a2, a3, a4) -- Line: 80
    -- upvalues: relativePath (ref), path (val), u32 (val), chalk (val), String (val)
    local v1 = a4 - a1
    local v2 = relativePath(a2, a3)
    local basename = v2.basename
    local dirname = v2.dirname
    local v3 = utf8.len(dirname .. path.sep .. basename)
    assert(v3 ~= nil)
    if v3 <= v1 then
        return u32((chalk.dim(dirname .. path.sep)) .. chalk.bold(basename))
    end
    local v4 = utf8.len(basename)
    assert(v4)
    if v4 + 4 < v1 then
        return u32((chalk.dim(("..." .. String.slice(dirname, utf8.len(dirname) - (v1 - 4 - v4) + 1, utf8.len(dirname) + 1)) .. path.sep)) .. chalk.bold(basename))
    end
    if v4 + 4 == v1 then
        return u32((chalk.dim("..." .. path.sep)) .. chalk.bold(basename))
    end
    return u32(chalk.bold("..." .. String.slice(basename, v4 - v1 - 4, v4 + 1)))
end

function v2.formatTestPath(a1, a2) -- Line: 125 -- upvalues: relativePath (ref), u32 (val), chalk (val), path (val)
    local v1 = relativePath(a1, a2)
    return u32((chalk.dim(v1.dirname .. path.sep)) .. chalk.bold(v1.basename))
end

function relativePath(a1, a2) -- Line: 132 -- upvalues: path (val) -- types: a2: string
    local v1 = path:dirname(a2)
    return {basename = path:basename(a2), dirname = v1}
end

v2.relativePath = relativePath

local function getValuesCurrentTestCases(a1) -- Line: 153 -- upvalues: Array (val)
    if a1 == nil then
        a1 = {}
    end
    local u2 = 0
    local u3 = 0
    local u4 = 0
    local u5 = 0
    local u6 = 0
    Array.forEach(a1, function(a1) -- Line: 162 -- upvalues: u2 (ref), u3 (ref), u4 (ref), u5 (ref), u6 (ref)
        local status = a1.testCaseResult.status
        if status == "failed" then
            u2 = u2 + 1
        elseif status == "passed" then
            u3 = u3 + 1
        elseif status == "skipped" then
            u4 = u4 + 1
        elseif status == "todo" then
            u5 = u5 + 1
        end
        u6 = u6 + 1
    end)
    return {
        numFailingTests = u2,
        numPassingTests = u3,
        numPendingTests = u4,
        numTodoTests = u5,
        numTotalTests = u6,
    }
end

function v2.getSummary(a1, a2) -- Line: 185
    -- upvalues: getValuesCurrentTestCases (val), chalk (val), Boolean (val), pluralize (val), renderTime (ref)
    -- upvalues: Array (val)
    local v1 = (DateTime.now().UnixTimestampMillis - a1.startTime) / 1000
    if a2 ~= nil and a2.roundTime then
        v1 = math.floor(v1)
    end
    local v2 = getValuesCurrentTestCases(if a2 == nil then nil else a2.currentTestCases)
    local estimatedTime = not (a2 == nil) and a2.estimatedTime or 0
    local snapshot = a1.snapshot
    local added = snapshot.added
    local unmatched = snapshot.unmatched
    local unchecked = snapshot.unchecked
    local filesRemoved = snapshot.filesRemoved
    local didUpdate = snapshot.didUpdate
    local matched = snapshot.matched
    local total = snapshot.total
    local updated = snapshot.updated
    local v3 = a1.numFailedTestSuites or 0
    local v4 = a1.numPassedTestSuites or 0
    local v5 = a1.numPendingTestSuites or 0
    local v6 = v3 + v4
    local v7 = a1.numTotalTestSuites or 0
    local v8 = a1.numFailedTests or 0
    local v9 = a1.numPassedTests or 0
    local v10 = a1.numPendingTests or 0
    local v11 = a1.numTodoTests or 0
    local v12 = a1.numTotalTests or 0
    local width = not (a2 == nil) and a2.width or 0
    local v13 = chalk.bold("Test Suites: ")
    local v14 = if not (v3 > 0) then "" else (chalk.bold(chalk.red(("%d failed"):format(v3)))) .. ", "
    local v15 = if not (v5 > 0) then "" else (chalk.bold(chalk.yellow(("%d skipped"):format(v5)))) .. ", "
    local v16 = if not (v4 > 0) then "" else (chalk.bold(chalk.green(("%d passed"):format(v4)))) .. ", "
    local v17 = if v6 == v7 then tostring(v7) else (tostring(v6)) .. " of " .. tostring(v7)
    local v18 = v13 .. v14 .. v15 .. v16 .. v17 .. " total"
    v13 = v8 + v2.numFailingTests
    v14 = v10 + v2.numPendingTests
    v15 = v11 + v2.numTodoTests
    v16 = v9 + v2.numPassingTests
    return Array.join({
        v18,
        (chalk.bold("Tests:       ")) .. (if not (v13 > 0) then "" else (chalk.bold(chalk.red(("%d failed"):format(v13)))) .. ", ") .. (if not (v14 > 0) then "" else (chalk.bold(chalk.yellow(("%d skipped"):format(v14)))) .. ", ") .. (if not (v15 > 0) then "" else (chalk.bold(chalk.magenta(("%d todo"):format(v15)))) .. ", ") .. (if not (v16 > 0) then "" else (chalk.bold(chalk.green(("%d passed"):format(v16)))) .. ", ") .. ("%d total"):format(v12 + v2.numTotalTests),
        (chalk.bold("Snapshots:   ")) .. (if not (unmatched > 0) then "" else (chalk.bold(chalk.red(("%d failed"):format(unmatched)))) .. ", ") .. (if not Boolean.toJSBoolean(unchecked) or didUpdate then "" else (chalk.bold(chalk.yellow(("%d obsolete"):format(unchecked)))) .. ", ") .. (if not Boolean.toJSBoolean(unchecked) or not didUpdate then "" else (chalk.bold(chalk.green(("%d removed"):format(unchecked)))) .. ", ") .. (if not Boolean.toJSBoolean(filesRemoved) or didUpdate then "" else (chalk.bold(chalk.yellow((pluralize("file", filesRemoved)) .. " obsolete"))) .. ", ") .. (if not Boolean.toJSBoolean(filesRemoved) or not didUpdate then "" else (chalk.bold(chalk.green((pluralize("file", filesRemoved)) .. " removed"))) .. ", ") .. (if not Boolean.toJSBoolean(updated) then "" else (chalk.bold(chalk.green(("%d updated"):format(updated)))) .. ", ") .. (if not Boolean.toJSBoolean(added) then "" else (chalk.bold(chalk.green(("%d written"):format(added)))) .. ", ") .. (if not Boolean.toJSBoolean(matched) then "" else (chalk.bold(chalk.green(("%d passed"):format(matched)))) .. ", ") .. ("%d total"):format(total),
        (renderTime(v1, estimatedTime, width)),
    }, "\n")
end

function renderTime(a1, a2, a3) -- Line: 274
    -- upvalues: Boolean (val), chalk (val), formatTime (val)
    local v1 = if not Boolean.toJSBoolean(a2) then formatTime(a1, 0) else if not (a2 + 1 <= a1) then formatTime(a1, 0) else chalk.bold(chalk.yellow(formatTime(a1, 0)))
    local v2 = (chalk.bold("Time:")) .. ("        %s"):format(v1)
    if a1 < a2 then
        v2 = v2 .. (", estimated %s"):format((formatTime(a2, 0)))
    end
    local toJSBoolean = Boolean.toJSBoolean
    local v3 = false
    if a2 > 2 then
        v3 = false
        if a1 < a2 then
            v3 = a3
        end
    end
    if toJSBoolean(v3) then
        local v4 = math.min(40, a3)
        v3 = math.min(math.floor(a1 / a2 * v4), v4)
        if v4 >= 2 then
            v2 = v2 .. "\n" .. (chalk.green("█"):rep(v3)) .. tostring(((chalk.white("█")):rep(v4 - v3)))
        end
    end
    return v2
end

function v2.wrapAnsiString(a1, a2) -- Line: 305 -- types: a1: string, a2: number
    return a1
end

return v2