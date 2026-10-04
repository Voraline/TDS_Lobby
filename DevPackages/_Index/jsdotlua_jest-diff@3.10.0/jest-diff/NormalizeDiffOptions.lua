-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-diff@3.10.0.jest-diff.NormalizeDiffOptions
-- Decompile time: 1.99 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Number = v1.Number
local Object = v1.Object
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
require(script.Parent:WaitForChild("types"))

local function noColor(a1) -- Line: 21
    return a1
end

local u29 = {
    aAnnotation = "Expected",
    aIndicator = "-",
    bAnnotation = "Received",
    bIndicator = "+",
    commonIndicator = " ",
    contextLines = 5,
    emptyFirstOrLastLinePlaceholder = "",
    expand = true,
    includeChangeCounts = false,
    omitAnnotationLines = false,
    aColor = chalk.green,
    bColor = chalk.red,
    changeColor = chalk.inverse,
    changeLineTrailingSpaceColor = noColor,
    commonColor = chalk.dim,
    commonLineTrailingSpaceColor = noColor,
    compareKeys = Object.None,
    patchColor = chalk.yellow,
}

local function getCompareKeys(a1) -- Line: 49 -- upvalues: u29 (val) -- types: a1: function?
    if a1 and typeof(a1) == "function" then
        return a1
    end
    return u29.compareKeys
end

local function getContextLines(a1) -- Line: 53 -- upvalues: Number (val) -- types: a1: number?
    if typeof(a1) == "number" and Number.isSafeInteger(a1) and a1 >= 0 then
        return a1
    end
    return 5
end

return {
    noColor = noColor,
    normalizeDiffOptions = function(a1) -- Line: 61 -- upvalues: Object (val), u29 (val), Number (val)
        local v1
        local assign = Object.assign
        local v2 = {}
        local compareKeys = v1.compareKeys
        v2.compareKeys = if not compareKeys then u29.compareKeys else if typeof(compareKeys) ~= "function" then u29.compareKeys else compareKeys
        local contextLines = v1.contextLines
        v2.contextLines = if typeof(contextLines) ~= "number" then 5 else if not Number.isSafeInteger(contextLines) then 5 else if not (contextLines >= 0) then 5 else contextLines
        return (assign({}, u29, if not a1 then {} else a1, v2))
    end,
}