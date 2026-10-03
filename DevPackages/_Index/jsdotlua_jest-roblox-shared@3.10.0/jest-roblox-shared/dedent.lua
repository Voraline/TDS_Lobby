-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-roblox-shared@3.10.0.jest-roblox-shared.dedent
-- Decompile time: 1.67 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local String = v1.String

function dedent(a1, ...) -- Line: 12 -- upvalues: Array (val)
    local v1, v2
    local v3 = {...}
    local v4 = ""
    if not Array.isArray(a1) then
        v4 = a1
    else
        v1 = #a1
        for i = 1, v1 do
            v4 = v4 .. a1[i]
            if i <= #v3 then
                v4 = v4 .. v3[i]
            end
        end
    end
    v1 = removeTrailingSpacesAndTabs(removeLeadingNewLines(v4))
    local v5 = ""
    for j = 1, (string.len(v1)) do
        v2 = string.sub(v1, j, j)
        if v2 ~= " " and v2 ~= "\t" then
            break
        end
        v5 = v5 .. v2
    end
    return removeCommonIndent(v1, v5)
end

function removeLeadingNewLines(a1) -- Line: 44 -- upvalues: String (val) -- types: a1: string
    local v1 = String.findOr(a1, {"\n*"})
    if v1 ~= nil and v1.index == 1 then
        a1 = string.sub(a1, (string.len(v1.match)) + 1)
    end
    return a1
end

function removeTrailingSpacesAndTabs(a1) -- Line: 53 -- upvalues: String (val) -- types: a1: string
    local v1
    local v2 = nil
    local v3 = 1
    local v4 = a1
    repeat
        v1 = String.findOr(v4, {" +", "\t+"}, v3)
        if v1 ~= nil then
            v2 = if v2 == nil or v2.index + string.len(v2.match) ~= v1.index then v1 else {index = v2.index, match = v2.match .. v1.match}
            v3 = v1.index + string.len(v1.match)
        end
    until v1 == nil or string.len(v4) < v3
    if v2 ~= nil and v2.index + string.len(v2.match) == string.len(v4) + 1 then
        return (string.sub(v4, 1, v2.index - 1))
    end
    return v4
end

function removeCommonIndent(a1, a2) -- Line: 78 -- types: a1: string, a2: string
    return (string.gsub(string.gsub(a1, a2, "", 1), "\n" .. a2, "\n"))
end

return {dedent = dedent}