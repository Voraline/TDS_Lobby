-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-diff@3.10.0.jest-diff.PrintDiffs
-- Decompile time: 3.37 ms

local Array = (require((script.Parent.Parent:WaitForChild("luau-polyfill")))).Array
local CleanupSemantic = require(script.Parent:WaitForChild("CleanupSemantic"))
local DIFF_EQUAL = CleanupSemantic.DIFF_EQUAL
local cleanupSemantic = CleanupSemantic.cleanupSemantic
local DiffLines = require(script.Parent:WaitForChild("DiffLines"))
local diffLinesUnified = DiffLines.diffLinesUnified
local printDiffLines = DiffLines.printDiffLines
local DiffStrings = require(script.Parent:WaitForChild("DiffStrings"))
local GetAlignedDiffs = require(script.Parent:WaitForChild("GetAlignedDiffs"))
local normalizeDiffOptions = require(script.Parent:WaitForChild("NormalizeDiffOptions")).normalizeDiffOptions
require(script.Parent:WaitForChild("types"))
local diffStringsRaw = nil

local function hasCommonDiff(a1, a2) -- Line: 33 -- upvalues: Array (val), DIFF_EQUAL (val) -- types: a2: boolean
    if not a2 then
        return Array.some(a1, function(a1) -- Line: 42 -- upvalues: DIFF_EQUAL (upval)
            return a1[1] == DIFF_EQUAL
        end)
    end
    local u2 = #a1
    return Array.some(a1, function(a1, a2) -- Line: 37 -- upvalues: DIFF_EQUAL (upval), u2 (val)
        local v1 = false
        if a1[1] == DIFF_EQUAL then
            v1 = true
            if a2 == u2 then
                v1 = a1[2] ~= "\n"
            end
        end
        return v1
    end)
end

function diffStringsRaw(a1, a2, a3) -- Line: 73
    -- upvalues: DiffStrings (val), cleanupSemantic (val)
    local v1 = DiffStrings(a1, a2)
    if a3 then
        cleanupSemantic(v1)
    end
    return v1
end

return {
    diffStringsUnified = function(a1, a2, a3) -- Line: 49
        -- upvalues: diffStringsRaw (ref), hasCommonDiff (val), normalizeDiffOptions (val), GetAlignedDiffs (val)
        -- upvalues: printDiffLines (val), diffLinesUnified (val)
        if a1 ~= a2 and #a1 ~= 0 and #a2 ~= 0 then
            local v1 = true
            if a1:find("\n") == nil then
                v1 = a2:find("\n") ~= nil
            end
            local v2 = diffStringsRaw
            local v3 = v1 and a1 .. "\n" or a1
            v2 = v2(v3, v1 and a2 .. "\n" or a2, true)
            if hasCommonDiff(v2, v1) then
                v3 = normalizeDiffOptions(a3)
                return printDiffLines(GetAlignedDiffs(v2, v3.changeColor), v3)
            end
        end
        return diffLinesUnified(a1:split("\n"), a2:split("\n"), a3)
    end,
    diffStringsRaw = diffStringsRaw,
}