-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-diff@3.10.0.jest-diff.DiffLines
-- Decompile time: 5.47 ms

require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local u17 = require(script.Parent.Parent:WaitForChild("diff-sequences"))
local CleanupSemantic = require(script.Parent:WaitForChild("CleanupSemantic"))
local DIFF_DELETE = CleanupSemantic.DIFF_DELETE
local DIFF_EQUAL = CleanupSemantic.DIFF_EQUAL
local DIFF_INSERT = CleanupSemantic.DIFF_INSERT
local Diff = CleanupSemantic.Diff
local joinAlignedDiffsExpand = require(script.Parent:WaitForChild("JoinAlignedDiffs")).joinAlignedDiffsExpand
local joinAlignedDiffsNoExpand = require(script.Parent:WaitForChild("JoinAlignedDiffs")).joinAlignedDiffsNoExpand
local normalizeDiffOptions = require(script.Parent:WaitForChild("NormalizeDiffOptions")).normalizeDiffOptions
require(script.Parent:WaitForChild("types"))
local diffLinesRaw = nil

local function isEmptyString(a1) -- Line: 32 -- types: a1: table
    local v1 = false
    if #a1 == 1 then
        v1 = #a1[1] == 0
    end
    return v1
end

local function countChanges(a1) -- Line: 38 -- upvalues: DIFF_DELETE (val), DIFF_INSERT (val)
    local v1
    local v2 = 0
    local v3 = 0
    for i, v in ipairs(a1) do
        v1 = v[1]
        if v1 == DIFF_DELETE then
            v2 = v2 + 1
        elseif v1 == DIFF_INSERT then
            v3 = v3 + 1
        end
    end
    return {a = v2, b = v3}
end

local function printAnnotation(a1, a2) -- Line: 54 -- types: a2: table
    local aAnnotation = a1.aAnnotation
    local aColor = a1.aColor
    local aIndicator = a1.aIndicator
    local bAnnotation = a1.bAnnotation
    local bColor = a1.bColor
    local bIndicator = a1.bIndicator
    local includeChangeCounts = a1.includeChangeCounts
    if a1.omitAnnotationLines then
        return ""
    end
    local v1 = ""
    local v2 = ""
    if includeChangeCounts then
        local v3 = tostring(a2.a)
        local v4 = tostring(a2.b)
        local v5 = #bAnnotation - #aAnnotation
        local v6 = string.rep(" ", (math.max(0, v5)))
        local v7 = string.rep(" ", (math.max(0, -v5)))
        local v8 = #v4 - #v3
        local v9 = string.rep(" ", (math.max(0, v8)))
        local v10 = string.rep(" ", (math.max(0, -v8)))
        v1 = v6 .. "  " .. aIndicator .. " " .. v9 .. v3
        v2 = v7 .. "  " .. bIndicator .. " " .. v10 .. v4
    end
    return (aColor(aIndicator .. " " .. aAnnotation .. v1)) .. "\n" .. (bColor(bIndicator .. " " .. bAnnotation .. v2)) .. "\n\n"
end

local function printDiffLines(a1, a2) -- Line: 95
    -- upvalues: printAnnotation (val), countChanges (val), joinAlignedDiffsExpand (val), joinAlignedDiffsNoExpand (val)
    if a2.expand then
        return (printAnnotation(a2, (countChanges(a1)))) .. joinAlignedDiffsExpand(a1, a2)
    end
    return (printAnnotation(a2, (countChanges(a1)))) .. joinAlignedDiffsNoExpand(a1, a2)
end

local function diffLinesUnified(a1, a2, a3) -- Line: 103
    -- upvalues: printDiffLines (val), diffLinesRaw (ref), normalizeDiffOptions (val)
    local v1 = false
    if #a1 == 1 then
        v1 = #a1[1] == 0
    end
    local v2 = if not v1 then a1 else {}
    v1 = false
    if #a2 == 1 then
        v1 = #a2[1] == 0
    end
    return (printDiffLines(diffLinesRaw(v2, if not v1 then a2 else {}), normalizeDiffOptions(a3)))
end

function diffLinesRaw(a1, a2) -- Line: 166
    -- upvalues: Diff (val), DIFF_DELETE (val), DIFF_INSERT (val), DIFF_EQUAL (val), u17 (val)
    local v1 = #a1
    local v2 = #a2
    local u5 = {}
    local u28 = 0
    local u42 = 0
    u17(v1, v2, function(a1_2, a2_2) -- Line: 170 -- upvalues: a1 (val), a2 (val) -- types: a1_2: number, a2_2: number
        return a1[a1_2 + 1] == a2[a2_2 + 1]
    end, function(a1_2, a2_2, a3) -- Line: 178
        -- upvalues: u28 (ref), u5 (val), Diff (upval), DIFF_DELETE (upval), a1 (val), u42 (ref), DIFF_INSERT (upval)
        -- upvalues: a2 (val), DIFF_EQUAL (upval)
        local v1
        while u28 ~= a2_2 do
            table.insert(u5, (Diff.new(DIFF_DELETE, a1[u28 + 1])))
            u28 = u28 + 1
        end
        while u42 ~= a3 do
            table.insert(u5, (Diff.new(DIFF_INSERT, a2[u42 + 1])))
            u42 = u42 + 1
        end
        while v1 ~= 0 do
            table.insert(u5, (Diff.new(DIFF_EQUAL, a2[u42 + 1])))
            v1 = v1 - 1
            u28 = u28 + 1
            u42 = u42 + 1
        end
    end)
    while u28 ~= v1 do
        table.insert(u5, (Diff.new(DIFF_DELETE, a1[u28 + 1])))
        u28 = u28 + 1
    end
    while u42 ~= v2 do
        table.insert(u5, (Diff.new(DIFF_INSERT, a2[u42 + 1])))
        u42 = u42 + 1
    end
    return u5
end

return {
    printDiffLines = printDiffLines,
    diffLinesUnified = diffLinesUnified,
    diffLinesUnified2 = function(a1, a2, a3, a4, a5) -- Line: 121
        -- upvalues: diffLinesUnified (val), diffLinesRaw (ref), DIFF_DELETE (val), DIFF_INSERT (val)
        -- upvalues: printDiffLines (val), normalizeDiffOptions (val)
        local v1, v2, v3, v4
        local v5 = false
        if #a1 == 1 then
            v5 = #a1[1] == 0
        end
        if not v5 then
            v1, v3 = a1, a3
        else
            v5 = false
            if #a3 == 1 then
                v5 = #a3[1] == 0
            end
            if not v5 then
                v1, v3 = a1, a3
            else
                v1 = {}
                v3 = {}
            end
        end
        v5 = false
        if #a2 == 1 then
            v5 = #a2[1] == 0
        end
        if not v5 then
            v2, v4 = a2, a4
        else
            v5 = false
            if #a4 == 1 then
                v5 = #a4[1] == 0
            end
            if not v5 then
                v2, v4 = a2, a4
            else
                v2 = {}
                v4 = {}
            end
        end
        if #v1 == #v3 and #v2 == #v4 then
            local v6
            v5 = diffLinesRaw(v3, v4)
            local v7 = 0
            local v8 = 0
            for i, v in ipairs(v5) do
                v6 = v[1]
                if v6 == DIFF_DELETE then
                    v[2] = v1[v7 + 1]
                    v7 = v7 + 1
                else
                    if v6 ~= DIFF_INSERT then
                        v[2] = v2[v8 + 1]
                        v7 = v7 + 1
                    else
                        v[2] = v2[v8 + 1]
                    end
                    v8 = v8 + 1
                end
            end
            return (printDiffLines(v5, normalizeDiffOptions(a5)))
        end
        return (diffLinesUnified(v1, v2, a5))
    end,
    diffLinesRaw = diffLinesRaw,
}