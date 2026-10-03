-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_pretty-format@3.10.0.pretty-format.plugins.lib.markup
-- Decompile time: 2.09 ms

local v1 = require(script.Parent.Parent.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local v2 = {}
local printText = nil
require(script.Parent.Parent.Parent:WaitForChild("Types"))
local default = require(script.Parent:WaitForChild("escapeHTML")).default
local u39 = {
    comment = {close = "", open = ""},
    content = {close = "", open = ""},
    prop = {close = "", open = ""},
    tag = {close = "", open = ""},
    value = {close = "", open = ""},
}

function v2.printProps(a1, a2, a3, a4, a5, a6, a7) -- Line: 44
    -- upvalues: u39 (val), Array (val)
    local u9 = a4 .. a3.indent
    local colors = a3.colors
    if not colors then
        colors = u39
    end
    return Array.join(Array.map(a1, function(a1) -- Line: 58
        -- upvalues: a2 (val), a7 (val), a3 (val), u9 (val), a5 (val), a6 (val), a4 (val), colors (val)
        local v1 = a2[a1]
        local v2 = a7(v1, a3, u9, a5, a6)
        if typeof(v1) ~= "string" then
            if string.find(v2, "\n") ~= nil then
                v2 = a3.spacingOuter .. u9 .. v2 .. a3.spacingOuter .. a4
            end
            v2 = "{" .. v2 .. "}"
        end
        return a3.spacingInner .. a4 .. colors.prop.open .. colors.prop.open .. (if typeof(a1) ~= "table" then a1 else if not a1.name then a7(a1, a3, u9, a5, a6) else a1.name) .. colors.prop.close .. "=" .. colors.value.open .. v2 .. colors.value.close .. colors.value.close
    end), "")
end

function v2.printChildren(a1, a2, a3, a4, a5, a6) -- Line: 92
    -- upvalues: Array (val), printText (ref)
    return Array.join(Array.map(a1, function(a1) -- Line: 101 -- upvalues: a2 (val), a3 (val), printText (upval), a6 (val), a4 (val), a5 (val)
        local spacingOuter = a2.spacingOuter
        local v1 = if typeof(a1) ~= "string" then a6(a1, a2, a3, a4, a5) else printText(a1, a2)
        return spacingOuter .. a3 .. v1
    end), "")
end

function printText(a1, a2) -- Line: 113 -- upvalues: u39 (val), default (val) -- types: a1: string
    local colors = a2.colors or u39
    local content = colors.content
    return content.open .. (default(a1)) .. content.close
end

v2.printText = printText

function v2.printComment(a1, a2) -- Line: 122 -- upvalues: u39 (val), default (val) -- types: a1: string
    local colors = a2.colors or u39
    local comment = colors.comment
    return comment.open .. "<!--" .. (default(a1)) .. "-->" .. comment.close
end

function v2.printElement(a1, a2, a3, a4, a5) -- Line: 135
    -- upvalues: u39 (val), Boolean (val)
    local colors = a4.colors or u39
    local tag = colors.tag
    local open = tag.open
    local v1 = if not Boolean.toJSBoolean(a2) then a2 else tag.close .. a2 .. a4.spacingOuter .. a5 .. tag.open
    local v2 = if not Boolean.toJSBoolean(a3) then (if not Boolean.toJSBoolean(a2) then " " else if Boolean.toJSBoolean(a4.min) then " " else "") .. "/" else ">" .. tag.close .. a3 .. a4.spacingOuter .. a5 .. tag.open .. "</" .. a1
    return open .. "<" .. a1 .. v1 .. v2 .. ">" .. tag.close
end

function v2.printElementAsLeaf(a1, a2) -- Line: 167 -- upvalues: u39 (val) -- types: a1: string
    local colors = a2.colors or u39
    local tag = colors.tag
    return tag.open .. "<" .. a1 .. tag.close .. " …" .. tag.open .. " />" .. tag.close
end

return v2