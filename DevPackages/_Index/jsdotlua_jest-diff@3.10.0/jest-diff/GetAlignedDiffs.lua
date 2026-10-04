-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-diff@3.10.0.jest-diff.GetAlignedDiffs
-- Decompile time: 8.72 ms

local Array = (require((script.Parent.Parent:WaitForChild("luau-polyfill")))).Array
local CleanupSemantic = require(script.Parent:WaitForChild("CleanupSemantic"))
local DIFF_DELETE = CleanupSemantic.DIFF_DELETE
local DIFF_EQUAL = CleanupSemantic.DIFF_EQUAL
local DIFF_INSERT = CleanupSemantic.DIFF_INSERT
local Diff = CleanupSemantic.Diff
require(script.Parent:WaitForChild("types"))

local function concatenateRelevantDiffs(a1, a2, a3) -- Line: 27
    -- upvalues: Array (val), DIFF_EQUAL (val)
    return Array.reduce(a2, function(a1_2, a2) -- Line: 28 -- upvalues: DIFF_EQUAL (upval), a1 (val), a3 (val) -- types: a1_2: string
        if a2[1] == DIFF_EQUAL then
            return a1_2 .. a2[2]
        end
        if a2[1] == a1 and #a2[2] ~= 0 then
            return a1_2 .. a3(a2[2])
        end
        return a1_2 .. ""
    end, "")
end

local u31 = {}
u31.__index = u31

function u31.new(a1, a2) -- Line: 58 -- upvalues: u31 (val) -- types: a1: number
    local v1 = setmetatable({}, u31)
    v1.op = a1
    v1.line = {}
    v1.lines = {}
    v1.changeColor = a2
    return v1
end

function u31:pushSubstring(a2) -- Line: 68 -- upvalues: Diff (val) -- types: self: table, a2: string
    self:pushDiff((Diff.new(self.op, a2)))
end

function u31:pushLine() -- Line: 72 -- upvalues: Diff (val), concatenateRelevantDiffs (val)
    table.insert(
        self.lines,
        if #self.line == 1 then if self.line[1][1] ~= self.op then Diff.new(self.op, self.line[1][2]) else self.line[1] else Diff.new(self.op, concatenateRelevantDiffs(self.op, self.line, self.changeColor))
    )
    self.line = {}
end

function u31:isLineEmpty() -- Line: 90
    return #self.line == 0
end

function u31:pushDiff(a2) -- Line: 95
    table.insert(self.line, a2)
end

function u31:align(a2) -- Line: 100
    local v1 = a2[2]
    if not v1:match("\n") then
        self:pushDiff(a2)
        return
    end
    local v2 = v1:split("\n")
    local v3 = #v2
    for i, v in ipairs(v2) do
        if i < v3 then
            self:pushSubstring(v)
            self:pushLine()
        elseif #v ~= 0 then
            self:pushSubstring(v)
        end
    end
end

function u31:moveLinesTo(a2) -- Line: 127
    if not self:isLineEmpty() then
        self:pushLine()
    end
    for i, v in ipairs(self.lines) do
        table.insert(a2, v)
    end
    self.lines = {}
end

local u39 = {}
u39.__index = u39

function u39.new(a1, a2) -- Line: 141 -- upvalues: u39 (val)
    local v1 = {deleteBuffer = a1, insertBuffer = a2, lines = {}}
    setmetatable(v1, u39)
    return v1
end

function u39:pushDiffCommonLine(a2) -- Line: 150
    table.insert(self.lines, a2)
end

function u39:pushDiffChangeLines(a2) -- Line: 154
    local v1
    if not (#a2[2] == 0) or self.deleteBuffer:isLineEmpty() then
        self.deleteBuffer:pushDiff(a2)
    end
    if not v1 or self.insertBuffer:isLineEmpty() then
        self.insertBuffer:pushDiff(a2)
    end
end

function u39:flushChangeLines() -- Line: 166
    self.deleteBuffer:moveLinesTo(self.lines)
    self.insertBuffer:moveLinesTo(self.lines)
end

function u39:align(a2) -- Line: 171 -- upvalues: Diff (val)
    local v1
    local v2 = a2[1]
    local v3 = a2[2]
    if not v3:match("\n") then
        self:pushDiffChangeLines(a2)
        return
    end
    local v4 = v3:split("\n")
    local v5 = #v4
    local v6 = self
    for i, v in ipairs(v4) do
        if i == 1 then
            v1 = Diff.new(v2, v)
            if not v6.deleteBuffer:isLineEmpty() or not v6.insertBuffer:isLineEmpty() then
                v6:pushDiffChangeLines(v1)
                v6:flushChangeLines()
            else
                v6:flushChangeLines()
                v6:pushDiffCommonLine(v1)
            end
        elseif i < v5 then
            v6:pushDiffCommonLine((Diff.new(v2, v)))
        elseif #v ~= 0 then
            v6:pushDiffChangeLines((Diff.new(v2, v)))
        end
    end
end

function u39:getLines() -- Line: 211
    self:flushChangeLines()
    return self.lines
end

return function(a1, a2) -- Line: 226 -- upvalues: u31 (val), DIFF_DELETE (val), DIFF_INSERT (val), u39 (val)
    local v1
    local v2 = u31.new(DIFF_DELETE, a2)
    local v3 = u31.new(DIFF_INSERT, a2)
    local v4 = u39.new(v2, v3)
    for i, v in ipairs(a1) do
        v1 = v[1]
        if v1 == DIFF_DELETE then
            v2:align(v)
        elseif v1 ~= DIFF_INSERT then
            v4:align(v)
        else
            v3:align(v)
        end
    end
    return v4:getLines()
end