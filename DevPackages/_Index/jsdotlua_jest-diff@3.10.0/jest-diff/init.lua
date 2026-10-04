-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-diff@3.10.0.jest-diff
-- Decompile time: 8.32 ms

local v1 = require(script.Parent:WaitForChild("luau-polyfill"))
local Object = v1.Object
local String = v1.String
local Symbol = v1.Symbol
local v2 = require(script.Parent:WaitForChild("pretty-format"))
local format = v2.format
require(script:WaitForChild("PrettyFormat"))
local chalk = require(script.Parent:WaitForChild("chalk"))
local getType = require(script.Parent:WaitForChild("jest-get-type")).getType
local CleanupSemantic = require(script:WaitForChild("CleanupSemantic"))
local DIFF_DELETE = CleanupSemantic.DIFF_DELETE
local DIFF_EQUAL = CleanupSemantic.DIFF_EQUAL
local DIFF_INSERT = CleanupSemantic.DIFF_INSERT
local Diff = CleanupSemantic.Diff
local normalizeDiffOptions = require(script:WaitForChild("NormalizeDiffOptions")).normalizeDiffOptions
local diffLinesRaw = (require((script:WaitForChild("DiffLines")))).diffLinesRaw
local diffLinesUnified = require(script:WaitForChild("DiffLines")).diffLinesUnified
local diffLinesUnified2 = require(script:WaitForChild("DiffLines")).diffLinesUnified2
local diffStringsRaw = (require((script:WaitForChild("PrintDiffs")))).diffStringsRaw
local diffStringsUnified = (require((script:WaitForChild("PrintDiffs")))).diffStringsUnified
require(script:WaitForChild("types"))
local NO_DIFF_MESSAGE = require(script:WaitForChild("Constants")).NO_DIFF_MESSAGE
local SIMILAR_MESSAGE = (require((script:WaitForChild("Constants")))).SIMILAR_MESSAGE
local comparePrimitive = nil
local compareObjects = nil
local getFormatOptions = nil
local getObjectsDifference = nil

local function getCommonMessage(a1, a2) -- Line: 56 -- upvalues: normalizeDiffOptions (val) -- types: a1: string
    return normalizeDiffOptions(a2).commonColor(a1)
end

local plugins = v2.plugins
local v3 = {plugins.AsymmetricMatcher, plugins.RobloxInstance}
local u135 = {plugins = v3}
local u136 = {callToJSON = false, maxDepth = 10, plugins = v3}

function comparePrimitive(a1, a2, a3) -- Line: 129
    -- upvalues: format (val), u135 (val), getCommonMessage (val), NO_DIFF_MESSAGE (val), diffLinesUnified (val)
    local v1 = format(a1, u135)
    local v2 = format(a2, u135)
    if v1 == v2 then
        return getCommonMessage(NO_DIFF_MESSAGE, a3)
    end
    return diffLinesUnified(string.split(v1, "\n"), string.split(v2, "\n"), a3)
end

function compareObjects(a1, a2, a3) -- Line: 140
    -- upvalues: getFormatOptions (ref), u135 (val), getObjectsDifference (ref), NO_DIFF_MESSAGE (val)
    -- upvalues: normalizeDiffOptions (val), u136 (val), SIMILAR_MESSAGE (val)
    local u51 = nil
    local v1 = false
    if not (pcall(function() -- Line: 144
        -- upvalues: getFormatOptions (upval), u135 (upval), a3 (val), u51 (ref), getObjectsDifference (upval), a1 (val)
        -- upvalues: a2 (val)
        local v0
        v0 = getFormatOptions(u135, a3)
        u51 = getObjectsDifference(a1, a2, v0, a3)
        return
    end)) then
        v1 = true
    end
    local v2 = normalizeDiffOptions(a3).commonColor(NO_DIFF_MESSAGE)
    if u51 == nil or u51 == v2 then
        local v3 = getFormatOptions(u136, a3)
        u51 = getObjectsDifference(a1, a2, v3, a3)
        if u51 ~= v2 and not v1 then
            u51 = normalizeDiffOptions(a3).commonColor(SIMILAR_MESSAGE) .. "\n\n" .. u51
        end
    end
    return u51
end

function getFormatOptions(a1, a2) -- Line: 200 -- upvalues: normalizeDiffOptions (val), Object (val)
    return Object.assign({}, a1, {compareKeys = (normalizeDiffOptions(a2)).compareKeys})
end

function getObjectsDifference(a1, a2, a3, a4) -- Line: 205
    -- upvalues: Object (val), format (val), getCommonMessage (val), NO_DIFF_MESSAGE (val), diffLinesUnified2 (val)
    -- upvalues: String (val)
    local v1 = Object.assign({}, a3, {indent = 0})
    local v2 = format(a1, v1)
    local v3 = format(a2, v1)
    if v2 == v3 then
        return getCommonMessage(NO_DIFF_MESSAGE, a4)
    end
    return diffLinesUnified2(
        String.split(format(a1, a3), "\n"),
        String.split(format(a2, a3), "\n"),
        String.split(v2, "\n"),
        String.split(v3, "\n"),
        a4
    )
end

return {
    diffLinesRaw = diffLinesRaw,
    diffLinesUnified = diffLinesUnified,
    diffLinesUnified2 = diffLinesUnified2,
    diffStringsRaw = diffStringsRaw,
    diffStringsUnified = diffStringsUnified,
    DIFF_DELETE = DIFF_DELETE,
    DIFF_EQUAL = DIFF_EQUAL,
    DIFF_INSERT = DIFF_INSERT,
    Diff = Diff,
    diff = function(a1, a2, a3) -- Line: 82
        -- upvalues: Object (val), getCommonMessage (val), NO_DIFF_MESSAGE (val), getType (val), Symbol (val)
        -- upvalues: chalk (val), diffLinesUnified (val), comparePrimitive (ref), compareObjects (ref)
        if Object.is(a1, a2) then
            return getCommonMessage(NO_DIFF_MESSAGE, a3)
        end
        local v1 = getType(a1)
        local v2 = v1
        local v3 = false
        if v1 == "table" and getType(a1.asymmetricMatch) == "function" then
            if a1["$$typeof"] ~= Symbol.for_("jest.asymmetricMatcher")
                or typeof(a1.getExpectedType) ~= "function" then
                return nil
            end
            v3 = (a1:getExpectedType()) == "string"
        end
        if v2 ~= getType(a2) then
            return string.format(
                "  Comparing two different types of values. Expected %s but received %s.",
                chalk.green(v2),
                chalk.red(getType(a2))
            )
        end
        if v3 then
            return nil
        end
        if v1 == "string" then
            return diffLinesUnified(string.split(a1, "\n"), string.split(a2, "\n"), a3)
        end
        if v1 ~= "boolean" and v1 ~= "number" then
            return compareObjects(a1, a2, a3)
        end
        return comparePrimitive(a1, a2, a3)
    end,
}