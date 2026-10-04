-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-diff@3.10.0.jest-diff.DiffStrings
-- Decompile time: 3.28 ms

require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local u17 = require(script.Parent.Parent:WaitForChild("diff-sequences"))
local CleanupSemantic = require(script.Parent:WaitForChild("CleanupSemantic"))
local DIFF_DELETE = CleanupSemantic.DIFF_DELETE
local DIFF_EQUAL = CleanupSemantic.DIFF_EQUAL
local DIFF_INSERT = CleanupSemantic.DIFF_INSERT
local Diff = CleanupSemantic.Diff
return function(a1, a2) -- Line: 21
    -- upvalues: Diff (val), DIFF_DELETE (val), DIFF_INSERT (val), DIFF_EQUAL (val), u17 (val)
    local u3 = 0
    local u4 = 0
    local u5 = {}
    u17(#a1, #a2, function(a1_2, a2_2) -- Line: 22 -- upvalues: a1 (val), a2 (val) -- types: a1_2: number, a2_2: number
        return (a1:sub(a1_2 + 1, a1_2 + 1)) == a2:sub(a2_2 + 1, a2_2 + 1)
    end, function(a1_2, a2_2, a3) -- Line: 30
        -- upvalues: u3 (ref), u5 (val), Diff (upval), DIFF_DELETE (upval), a1 (val), u4 (ref), DIFF_INSERT (upval)
        -- upvalues: a2 (val), DIFF_EQUAL (upval)
        if u3 ~= a2_2 then
            table.insert(u5, (Diff.new(DIFF_DELETE, (a1:sub(u3 + 1, a2_2)))))
        end
        if u4 ~= a3 then
            table.insert(u5, (Diff.new(DIFF_INSERT, (a2:sub(u4 + 1, a3)))))
        end
        u3 = a2_2 + a1_2
        u4 = a3 + a1_2
        table.insert(u5, (Diff.new(DIFF_EQUAL, (a2:sub(a3 + 1, u4)))))
    end)
    if u3 ~= #a1 then
        table.insert(u5, (Diff.new(DIFF_DELETE, (a1:sub(u3 + 1)))))
    end
    if u4 ~= #a2 then
        table.insert(u5, (Diff.new(DIFF_INSERT, (a2:sub(u4 + 1)))))
    end
    return u5
end