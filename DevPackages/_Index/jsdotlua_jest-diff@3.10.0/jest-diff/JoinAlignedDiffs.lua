-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-diff@3.10.0.jest-diff.JoinAlignedDiffs
-- Decompile time: 21.91 ms

local Array = (require((script.Parent.Parent:WaitForChild("luau-polyfill")))).Array
local CleanupSemantic = require(script.Parent:WaitForChild("CleanupSemantic"))
local DIFF_DELETE = CleanupSemantic.DIFF_DELETE
local DIFF_EQUAL = CleanupSemantic.DIFF_EQUAL
local DIFF_INSERT = CleanupSemantic.DIFF_INSERT
require(script.Parent:WaitForChild("types"))

local function formatTrailingSpaces(a1, a2) -- Line: 23 -- types: a1: string
    return a1:gsub("%s+$", function(a1) -- Line: 24 -- upvalues: a2 (val)
        return a2(a1)
    end)
end

local function printDiffLine(a1, a2, a3, a4, a5, a6) -- Line: 29
    -- upvalues: 
    if #a1 ~= 0 then
        return a3(a4 .. " " .. a1:gsub("%s+$", function(a1) -- Line: 24 -- upvalues: a5 (val)
            return a5(a1)
        end))
    end
    if a4 ~= " " then
        return a3(a4)
    end
    if a2 and #a6 ~= 0 then
        return a3(a4 .. " " .. a6)
    end
    return ""
end

local function printDeleteLine(a1, a2, a3) -- Line: 47
    -- upvalues: printDiffLine (val)
    return printDiffLine(a1, a2, a3.aColor, a3.aIndicator, a3.changeLineTrailingSpaceColor, a3.emptyFirstOrLastLinePlaceholder)
end

local function printInsertLine(a1, a2, a3) -- Line: 58
    -- upvalues: printDiffLine (val)
    return printDiffLine(a1, a2, a3.bColor, a3.bIndicator, a3.changeLineTrailingSpaceColor, a3.emptyFirstOrLastLinePlaceholder)
end

local function printCommonLine(a1, a2, a3) -- Line: 69
    -- upvalues: printDiffLine (val)
    return printDiffLine(a1, a2, a3.commonColor, a3.commonIndicator, a3.commonLineTrailingSpaceColor, a3.emptyFirstOrLastLinePlaceholder)
end

local function createPatchMark(a1, a2, a3, a4, a5) -- Line: 81 -- types: a1: number, a2: number, a3: number, a4: number
    return a5.patchColor(string.format("@@ -%d,%d +%d,%d @@", a1 + 1, a2 - a1, a3 + 1, a4 - a3))
end

return {
    joinAlignedDiffsNoExpand = function(a1, a2) -- Line: 97
        -- upvalues: DIFF_EQUAL (val), printCommonLine (val), printDeleteLine (val), printInsertLine (val)
        -- upvalues: DIFF_DELETE (val), DIFF_INSERT (val)
        local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15
        local v16 = #a1
        local contextLines = a2.contextLines
        local v17 = contextLines + contextLines
        local v18 = v16
        local v19 = false
        local v20 = 0
        local v21 = 0
        while v21 ~= v16 do
            v15 = v21
            while v21 ~= v16 do
                if v1[v21 + 1][1] ~= DIFF_EQUAL then
                    break
                end
                v21 = v21 + 1
            end
            if v15 ~= v21 then
                if v15 ~= 0 then
                    if v21 ~= v16 then
                        v2 = v21 - v15
                        if v17 < v2 then
                            v18 = v18 - (v2 - v17)
                            v20 = v20 + 1
                        end
                    else
                        v2 = v21 - v15
                        if contextLines < v2 then
                            v18 = v18 - (v2 - contextLines)
                            v19 = true
                        end
                    end
                elseif contextLines < v21 then
                    v18 = v18 - (v21 - contextLines)
                    v19 = true
                end
            end
            while v21 ~= v16 do
                if v1[v21 + 1][1] == DIFF_EQUAL then
                    break
                end
                v21 = v21 + 1
            end
        end
        v15 = true
        if v20 == 0 then
            v15 = v19
        end
        if v20 ~= 0 then
            v18 = v18 + (v20 + 1)
        elseif v19 then
            v18 = v18 + 1
        end
        local u479 = v18 - 1
        local u480 = {}
        local v22 = 0
        if v15 then
            table.insert(u480, "")
        end
        local v23 = 0
        local v24 = 0
        local u523 = 0
        local u680 = 0

        local function v25(a1) -- Line: 163
            -- upvalues: u480 (val), printCommonLine (upval), u479 (val), a2 (val), u523 (ref), u680 (ref)
            local v1 = #u480
            local v2 = printCommonLine
            local v3 = true
            if v1 ~= 0 then
                v3 = v1 == u479
            end
            v2 = v2(a1, v3, a2)
            table.insert(u480, v2)
            u523 = u523 + 1
            u680 = u680 + 1
        end

        local function v26(a1) -- Line: 170
            -- upvalues: u480 (val), printDeleteLine (upval), u479 (val), a2 (val), u523 (ref)
            local v1 = #u480
            local v2 = printDeleteLine
            local v3 = true
            if v1 ~= 0 then
                v3 = v1 == u479
            end
            v2 = v2(a1, v3, a2)
            table.insert(u480, v2)
            u523 = u523 + 1
        end

        local function v27(a1) -- Line: 176
            -- upvalues: u480 (val), printInsertLine (upval), u479 (val), a2 (val), u680 (ref)
            local v1 = #u480
            local v2 = printInsertLine
            local v3 = true
            if v1 ~= 0 then
                v3 = v1 == u479
            end
            v2 = v2(a1, v3, a2)
            table.insert(u480, v2)
            u680 = u680 + 1
        end

        v21 = 0
        while v21 ~= v16 do
            v3 = v21
            while v21 ~= v16 do
                if v1[v21 + 1][1] ~= DIFF_EQUAL then
                    break
                end
                v21 = v21 + 1
            end
            if v3 ~= v21 then
                if v3 == 0 then
                    if contextLines < v21 then
                        v3 = v21 - contextLines
                        u523 = v3
                        u680 = v3
                    end
                    v4 = v3
                    while v4 ~= v21 do
                        v5 = v1[v4 + 1][2]
                        v6 = #u480
                        v9 = printCommonLine
                        v11 = true
                        if v6 ~= 0 then
                            v11 = v6 == u479
                        end
                        v9 = v9(v5, v11, a2)
                        table.insert(u480, v9)
                        u523 = u523 + 1
                        u680 = u680 + 1
                        v4 = v4 + 1
                    end
                elseif v21 ~= v16 then
                    v4 = v21 - v3
                    if not (v17 < v4) then
                        v5 = v3
                        while v5 ~= v21 do
                            v6 = v1[v5 + 1][2]
                            v7 = #u480
                            v10 = printCommonLine
                            v12 = true
                            if v7 ~= 0 then
                                v12 = v7 == u479
                            end
                            v10 = v10(v6, v12, a2)
                            table.insert(u480, v10)
                            u523 = u523 + 1
                            u680 = u680 + 1
                            v5 = v5 + 1
                        end
                    else
                        v5 = v3 + contextLines
                        v6 = v3
                        while v6 ~= v5 do
                            v7 = v1[v6 + 1][2]
                            v8 = #u480
                            v11 = printCommonLine
                            v13 = true
                            if v8 ~= 0 then
                                v13 = v8 == u479
                            end
                            v11 = v11(v7, v13, a2)
                            table.insert(u480, v11)
                            u523 = u523 + 1
                            u680 = u680 + 1
                            v6 = v6 + 1
                        end
                        v7 = v22 + 1
                        v12 = u680
                        u480[v7] = (a2.patchColor(string.format("@@ -%d,%d +%d,%d @@", v23 + 1, u523 - v23, v24 + 1, v12 - v24)))
                        v22 = #u480
                        table.insert(u480, "")
                        v7 = v4 - v17
                        v23 = u523 + v7
                        v24 = u680 + v7
                        u523 = v23
                        u680 = v24
                        v6 = v21 - contextLines
                        while v6 ~= v21 do
                            v8 = v1[v6 + 1][2]
                            v9 = #u480
                            v12 = printCommonLine
                            v14 = true
                            if v9 ~= 0 then
                                v14 = v9 == u479
                            end
                            v12 = v12(v8, v14, a2)
                            table.insert(u480, v12)
                            u523 = u523 + 1
                            u680 = u680 + 1
                            v6 = v6 + 1
                        end
                    end
                else
                    v4 = v21
                    if contextLines < v21 - v3 then
                        v4 = v3 + contextLines
                    end
                    v5 = v3
                    while v5 ~= v4 do
                        v6 = v1[v5 + 1][2]
                        v7 = #u480
                        v10 = printCommonLine
                        v12 = true
                        if v7 ~= 0 then
                            v12 = v7 == u479
                        end
                        v10 = v10(v6, v12, a2)
                        table.insert(u480, v10)
                        u523 = u523 + 1
                        u680 = u680 + 1
                        v5 = v5 + 1
                    end
                end
            end
            while v21 ~= v16 do
                if v1[v21 + 1][1] ~= DIFF_DELETE then
                    break
                end
                v4 = v1[v21 + 1][2]
                v5 = #u480
                v8 = printDeleteLine
                v10 = true
                if v5 ~= 0 then
                    v10 = v5 == u479
                end
                v8 = v8(v4, v10, a2)
                table.insert(u480, v8)
                u523 = u523 + 1
                v21 = v21 + 1
            end
            while v21 ~= v16 do
                if v1[v21 + 1][1] ~= DIFF_INSERT then
                    break
                end
                v4 = v1[v21 + 1][2]
                v5 = #u480
                v8 = printInsertLine
                v10 = true
                if v5 ~= 0 then
                    v10 = v5 == u479
                end
                v8 = v8(v4, v10, a2)
                table.insert(u480, v8)
                u680 = u680 + 1
                v21 = v21 + 1
            end
        end
        if v15 then
            v3 = v22 + 1
            v8 = u680
            u480[v3] = (a2.patchColor(string.format("@@ -%d,%d +%d,%d @@", v23 + 1, u523 - v23, v24 + 1, v8 - v24)))
        end
        return (table.concat(u480, "\n"))
    end,
    joinAlignedDiffsExpand = function(a1, a2) -- Line: 278
        -- upvalues: Array (val), DIFF_DELETE (val), printDeleteLine (val), DIFF_INSERT (val), printInsertLine (val)
        -- upvalues: printCommonLine (val)
        return table.concat(Array.map(a1, function(a1, a2_2, a3) -- Line: 280
            -- upvalues: DIFF_DELETE (upval), printDeleteLine (upval), a2 (val), DIFF_INSERT (upval)
            -- upvalues: printInsertLine (upval), printCommonLine (upval)
            local v1 = a1[2]
            local v2 = true
            if a2_2 ~= 1 then
                v2 = a2_2 == #a3
            end
            local v3 = a1[1]
            if v3 == DIFF_DELETE then
                return printDeleteLine(v1, v2, a2)
            end
            if v3 == DIFF_INSERT then
                return printInsertLine(v1, v2, a2)
            end
            return printCommonLine(v1, v2, a2)
        end), "\n")
    end,
}