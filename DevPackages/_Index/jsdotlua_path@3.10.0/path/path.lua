-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_path@3.10.0.path.path
-- Decompile time: 16.58 ms

require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local u9 = {env = {}}

function u9.cwd() -- Line: 20
    return ""
end

local u12 = {}
u12.__index = u12

function u12.new() -- Line: 58 -- upvalues: u12 (val)
    return (setmetatable({}, u12))
end

function u12.initialize(a1, a2, a3) -- Line: 63 -- types: a1: table, a2: string, a3: string
    a1.root = a2
    a1.sep = a3
end

function u12:getRoot(a2) -- Line: 68
    return self.root
end

function u12.getSep(a1) -- Line: 72
    return a1.sep
end

function u12.pathsEqual(a1, a2, a3) -- Line: 76 -- types: a1: table, a2: string, a3: string
    return a2 == a3
end

function u12:_splitPath(a2) -- Line: 81 -- types: self: table, a2: string
    local v1 = self:normalizeSeparators(a2)
    if self:isAbsolute(v1) or self:isDriveRelative(v1) then
        v1 = v1:sub(((self:getRoot(v1)):len()) + 1)
    end
    local v2 = v1:match("[" .. self.sep .. "]*$")
    if v2 then
        v1 = v1:sub(1, -(v2:len()) - 1)
    end
    local v3 = v1:match("[^" .. self.sep .. "]+$") or ""
    local v4 = v3 and v1:sub(1, -(v3:len()) - 1) or v1
    return "", v4, v3
end

function u12._normalizeArray(a1, a2, a3) -- Line: 98 -- types: a1: table, a3: boolean
    local v1
    local v2 = 0
    for i = #a2, 1, -1 do
        v1 = a2[i]
        if v1 == "." then
            table.remove(a2, i)
        elseif v1 == ".." then
            table.remove(a2, i)
            v2 = v2 + 1
        elseif v2 > 0 then
            table.remove(a2, i)
            v2 = v2 - 1
        end
    end
    if a3 then
        while v2 > 0 do
            table.insert(a2, 1, "..")
            v2 = v2 - 1
        end
    end
end

function u12:_splitBySeparators(a2) -- Line: 120 -- types: self: table, a2: string
    local v1 = {}
    for i in a2:gmatch("[^" .. self.sep .. "]+") do
        v1[#v1 + 1] = i
    end
    return v1
end

function u12:normalize(a2) -- Line: 128 -- types: self: table, a2: string
    local v1 = self:normalizeSeparators(a2)
    local v2 = self:isAbsolute(v1)
    local v3 = v2 and self:getRoot(v1) or nil
    local v4 = (v1:sub(#v1)) == self.sep
    if v3 then
        v1 = v1:sub((v3:len()) + 1)
    end
    local v5 = self:_splitBySeparators(v1)
    self:_normalizeArray(v5, not v2)
    v1 = table.concat(v5, self.sep)
    if #v1 == 0 then
        if v2 then
            return v3
        end
        return "."
    end
    if v4 then
        v1 = v1 .. self.sep
    end
    if v2 then
        v1 = v3 .. v1
    end
    return v1
end

function u12:_filterparts(a2) -- Line: 157
    local v1 = {}
    for i, v in ipairs(a2) do
        if v and v ~= "" then
            table.insert(v1, v)
        end
    end
    local v2 = self
    for i2, i3 in ipairs(v1) do
        if i2 > 1 then
            while true do
                if (i3:sub(1, 1)) ~= v2.sep then
                    break
                end
                i3 = i3:sub(2)
            end
        end
        if i2 < #v1 then
            while true do
                if (i3:sub(#i3)) ~= v2.sep then
                    break
                end
                i3 = i3:sub(1, #i3 - 1)
            end
        end
        v1[i2] = i3
    end
    return v1
end

function u12:_rawjoin(a2) -- Line: 183
    return table.concat(a2, self.sep)
end

function u12:_filteredjoin(...) -- Line: 187
    local v1 = {...}
    for i, v in ipairs(v1) do
        v1[i] = (self:normalizeSeparators(v))
    end
    local v2 = self:_filterparts(v1)
    return self:_rawjoin(v2), v2
end

function u12:join(...) -- Line: 197
    return self:normalize((self:_filteredjoin(...)))
end

function u12.resolve(a1, ...) -- Line: 205 -- upvalues: u9 (val)
    local v1, v2, v3
    local v4 = {...}
    local v5 = ""
    local v6 = nil
    local v7 = false
    for i = #v4, 1, -1 do
        v2 = v4[i]
        if v2 and v2 ~= "" then
            v3 = v6 and a1:getRoot(v2)
            if a1:isDriveRelative(v2) then
                v3 = v3 or a1:getRoot(v2)
                v6 = v6 or v3
                v2 = v2:sub((v3:len()) + 1)
            end
            if v3 and (v6:sub(1, 2)) ~= v3:sub(1, 2) then
                continue
            end
            v5 = a1:join(a1:normalize(v2), v5)
            if a1:isAbsolute(v5) then
                v7 = true
                break
            end
        end
    end
    if not v7 then
        if not v6 then
            v5 = a1:join("", v5)
        else
            v1 = u9.env["=" .. v6]
            v5 = if not v1 then a1:join(v6, v5) else if not a1:pathsEqual(v1:sub(1, 2), v6) then a1:join(v6, v5) else a1:join(v1, v5)
        end
    end
    v1 = v5:match("[" .. a1.sep .. "]*$")
    if v1 then
        v5 = v5:sub(1, -(v1:len()) - 1)
    end
    return v5
end

function u12:_commonParts(...) -- Line: 251
    local v1, v2
    local v3 = {}
    local v4 = {...}
    local v5 = {}
    for i, v in ipairs(v4) do
        table.insert(v5, (self:_splitBySeparators(v)))
    end
    local v6 = #v5[1]
    for i2 = 1, v6 do
        v1 = v5[1][i2]
        v2 = #v5
        for j = 2, v2 do
            if not self:pathsEqual(v1, v5[j][i2]) then
                return v3
            end
        end
        table.insert(v3, v1)
    end
    return v3
end

function u12.relative(a1, a2, a3) -- Line: 273 -- types: a1: table, a2: string, a3: string
    local v1, v2
    local v3, v4, v5 = a1:_splitPath(a2)
    local v6, v7, v8 = a1:_splitPath(a3)
    if not a1:pathsEqual(v3, v6) then
        return a3
    end
    local v9 = v4 .. v5
    local v10 = v7 .. v8
    local v11 = a1:_commonParts(v9, v10)
    local v12 = a1:_splitBySeparators(v9)
    local v13 = a1:_splitBySeparators(v10)
    local v14 = {}
    if #v11 > 0 then
        v2 = #v11
        v1 = #v12 - 1
        for i = v2, v1 do
            table.insert(v14, "..")
        end
    end
    v2 = #v11 + 1
    v1 = #v13
    for j = v2, v1 do
        table.insert(v14, v13[j])
    end
    return a1:_rawjoin(v14)
end

function u12.dirname(a1, a2) -- Line: 299 -- types: a1: table, a2: string
    local v1 = a1:normalizeSeparators(a2)
    if (v1:sub((v1:len()))) == a1.sep then
        v1 = v1:sub(1, -2)
    end
    local v2, v3 = a1:_splitPath(v1)
    if #v3 > 0 then
        return v2 .. v3:sub(1, #v3 - 1)
    end
    if #v2 > 0 then
        return v2
    end
    return "."
end

function u12:basename(a2, a3) -- Line: 317 -- types: self: table, a2: string, a3: string?
    local v1
    _, _, v1 = self:_splitPath(a2)
    if a3 then
        local v2 = v1:find((a3:gsub(".", ".")) .. "$")
        if v2 then
            v1 = v1:sub(1, v2 - 1)
        end
    end
    return v1
end

function u12.extname(a1, a2) -- Line: 328 -- types: a1: table, a2: string
    local v1 = a1:basename(a2)
    if v1 == ".." then
        return ""
    end
    return v1:match(".(%.[^.]*)$") or ""
end

function u12.isDriveRelative(a1) -- Line: 337
    return false
end

function u12:isAbsolute(a2) -- Line: 341 -- types: self: table, a2: string
    return (a2:sub(1, (self.root:len()))) == self.root
end

function u12.normalizeSeparators(a1, a2) -- Line: 345 -- types: a1: table, a2: string
    return a2
end

return {Path = u12}