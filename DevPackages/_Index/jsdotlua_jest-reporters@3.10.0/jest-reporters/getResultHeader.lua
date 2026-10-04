-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-reporters@3.10.0.jest-reporters.getResultHeader
-- Decompile time: 3.78 ms

local Boolean = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Boolean
local v1 = {}
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
require(script.Parent.Parent:WaitForChild("jest-test-result"))
require(script.Parent.Parent:WaitForChild("jest-types"))
local formatTime = require(script.Parent.Parent:WaitForChild("jest-util")).formatTime
local utils = require(script.Parent:WaitForChild("utils"))
local formatTestPath = utils.formatTestPath
local printDisplayName = utils.printDisplayName

local function u58(...) -- Line: 34 -- upvalues: chalk (val)
    return chalk.reset(chalk.bold(chalk.bgRed(...)))
end

local u61 = if chalk.supportsColor == nil then chalk.reset(chalk.inverse(chalk.bold(chalk.red(string.format(" %s ", "FAIL"))))) else if chalk.supportsColor ~= true then "FAIL" else chalk.reset(chalk.inverse(chalk.bold(chalk.red(string.format(" %s ", "FAIL")))))
local u78 = if chalk.supportsColor == nil then chalk.reset(chalk.inverse(chalk.bold(chalk.green(string.format(" %s ", "PASS"))))) else if chalk.supportsColor ~= true then "PASS" else chalk.reset(chalk.inverse(chalk.bold(chalk.green(string.format(" %s ", "PASS")))))

function v1.default(a1, a2, a3) -- Line: 54
    -- upvalues: formatTestPath (val), u61 (val), u78 (val), Boolean (val), u58 (val), formatTime (val)
    -- upvalues: printDisplayName (val)
    local v1 = formatTestPath(a3 or a2, a1.testFilePath)
    if a1.numFailingTests == nil then
        a1.numFailingTests = 0
    end
    local v2 = if 0 < a1.numFailingTests then u61 else if a1.testExecError == nil then u78 else u61
    local v3 = {}
    if a1.perfStats ~= nil and Boolean.toJSBoolean(a1.perfStats.slow) then
        table.insert(v3, (u58((formatTime(a1.perfStats.runtime / 1000, 0)))))
    end
    if a1.memoryUsage ~= nil then
        local function v4(a1) -- Line: 72 -- types: a1: number
            return (math.floor(a1 / 1024 / 1024))
        end

        table.insert(v3, ((" %sMB heap size"):format((tostring((math.floor(a1.memoryUsage / 1024 / 1024)))))))
    end
    return string.format(
        "%s %s%s %s",
        v2,
        if a3 == nil or not Boolean.toJSBoolean(a3.displayName) then "" else (printDisplayName(a3)) .. " ",
        v1,
        table.concat(v3, " ")
    )
end

return v1