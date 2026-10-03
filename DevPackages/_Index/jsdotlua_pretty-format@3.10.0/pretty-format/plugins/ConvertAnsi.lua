-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_pretty-format@3.10.0.pretty-format.plugins.ConvertAnsi
-- Decompile time: 0.83 ms

local Boolean = (require((script.Parent.Parent.Parent:WaitForChild("luau-polyfill")))).Boolean
require(script.Parent.Parent:WaitForChild("Types"))
local chalk = require(script.Parent.Parent.Parent:WaitForChild("chalk"))
local u30 = {
    [chalk.red.close] = "</>",
    [chalk.green.close] = "</>",
    [chalk.cyan.close] = "</>",
    [chalk.gray.close] = "</>",
    [chalk.white.close] = "</>",
    [chalk.yellow.close] = "</>",
    [chalk.bgRed.close] = "</>",
    [chalk.bgGreen.close] = "</>",
    [chalk.bgYellow.close] = "</>",
    [chalk.inverse.close] = "</>",
    [chalk.dim.close] = "</>",
    [chalk.bold.close] = "</>",
    [chalk.reset.open] = "</>",
    [chalk.reset.close] = "</>",
    [chalk.red.open] = "<red>",
    [chalk.green.open] = "<green>",
    [chalk.cyan.open] = "<cyan>",
    [chalk.gray.open] = "<gray>",
    [chalk.white.open] = "<white>",
    [chalk.yellow.open] = "<yellow>",
    [chalk.bgRed.open] = "<bgRed>",
    [chalk.bgGreen.open] = "<bgGreen>",
    [chalk.bgYellow.open] = "<bgYellow>",
    [chalk.inverse.open] = "<inverse>",
    [chalk.dim.open] = "<dim>",
    [chalk.bold.open] = "<bold>",
}
return {
    ansiRegex = "\027%[%d+;?5?;?%d*m",
    test = function(a1) -- Line: 61 -- upvalues: Boolean (val)
        local v1 = false
        if typeof(a1) == "string" then
            v1 = Boolean.toJSBoolean(a1:match("\027%[%d+;?5?;?%d*m"))
        end
        return v1
    end,
    serialize = function(a1, a2, a3, a4, a5, a6) -- Line: 65 -- upvalues: u30 (val) -- types: a1: string, a3: string, a4: number
        return a6(a1:gsub("\027%[%d+;?5?;?%d*m", function(a1) -- Line: 52 -- upvalues: u30 (upval)
            if u30[a1] then
                return u30[a1]
            end
            return ""
        end), a2, a3, a4, a5)
    end,
    toHumanReadableAnsi = function(a1) -- Line: 51 -- upvalues: u30 (val) -- types: a1: string
        return a1:gsub("\027%[%d+;?5?;?%d*m", function(a1) -- Line: 52 -- upvalues: u30 (upval)
            if u30[a1] then
                return u30[a1]
            end
            return ""
        end)
    end,
}