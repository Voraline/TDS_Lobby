-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-snapshot@3.10.0.jest-snapshot.dedentLines
-- Decompile time: 2.55 ms

require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local dedentMarkup = nil

local function getIndentationLength(a1) -- Line: 14 -- types: a1: string
    local v1 = string.match(a1, "^[ ]+")
    if v1 == nil then
        return 0
    end
    return (v1:len()) - v1:len() % 2
end

local function dedentLine(a1) -- Line: 24 -- upvalues: getIndentationLength (ref) -- types: a1: string
    return a1:sub((getIndentationLength(a1)) + 1)
end

local function hasUnmatchedDoubleQuoteMarks(a1) -- Line: 31 -- types: a1: string
    local v1 = 0
    local v2 = string.find(a1, "\"")
    local v3 = a1
    while v2 do
        if v2 == 1 or string.sub(v3, v2 - 1, v2 - 1) ~= "\\" then
            v1 = v1 + 1
        end
        v2 = string.find(v3, "\"", v2 + 1)
    end
    return v1 % 2 ~= 0
end

local function isFirstLineOfTag(a1) -- Line: 47 -- types: a1: string
    return string.find(a1, "^[ ]*<") ~= nil
end

local function dedentStartTag(a1, a2) -- Line: 57
    -- upvalues: dedentLine (ref), hasUnmatchedDoubleQuoteMarks (ref), isFirstLineOfTag (ref), dedentMarkup (ref)
    local v1 = a1[#a2 + 1]
    table.insert(a2, (dedentLine(v1)))
    if string.find(v1, ">") then
        return true
    end
    local v2, v3 = a2, a1
    while #v2 < #v3 do
        v1 = v3[#v2 + 1]
        if hasUnmatchedDoubleQuoteMarks(v1) then
            return false
        end
        if not isFirstLineOfTag(v1) then
            table.insert(v2, (dedentLine(v1)))
            if string.find(v1, ">") then
                return true
            end
        elseif not dedentMarkup(v3, v2) then
            return false
        end
    end
    return false
end

function dedentMarkup(a1, a2) -- Line: 92
    -- upvalues: dedentStartTag (ref), getIndentationLength (ref), isFirstLineOfTag (ref), dedentLine (ref)
    local v1 = a1[#a2 + 1]
    if not dedentStartTag(a1, a2) then
        return false
    end
    if string.find(a1[#a2], "/>") then
        return true
    end
    local v2 = false
    local v3 = {}
    table.insert(v3, (getIndentationLength(v1)))
    local v4, v5 = a2, a1
    while #v3 > 0 do
        if not (#v4 < #v5) then
            break
        end
        v1 = v5[#v4 + 1]
        if not isFirstLineOfTag(v1) then
            if v2 then
                return false
            end
            table.insert(v4, (v1:sub(v3[#v3] + 3)))
        elseif not string.find(v1, "</") then
            if not dedentStartTag(v5, v4) then
                return false
            end
            if not string.find(v5[#v4], "/>") then
                table.insert(v3, (getIndentationLength(v1)))
            end
        else
            table.insert(v4, (dedentLine(v1)))
            table.remove(v3)
        end
    end
    return #v3 == 0
end

return function(a1) -- Line: 143
    -- upvalues: hasUnmatchedDoubleQuoteMarks (ref), isFirstLineOfTag (ref), dedentMarkup (ref), dedentLine (ref)
    local v1
    local v2 = {}
    local v3 = a1
    while #v2 < #v3 do
        v1 = v3[#v2 + 1]
        if hasUnmatchedDoubleQuoteMarks(v1) then
            return nil
        end
        if not isFirstLineOfTag(v1) then
            table.insert(v2, (dedentLine(v1)))
        elseif not dedentMarkup(v3, v2) then
            return nil
        end
    end
    return v2
end