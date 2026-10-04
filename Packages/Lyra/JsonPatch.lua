-- Script path: ReplicatedStorage.Packages.Lyra.JsonPatch
-- Decompile time: 10.49 ms

local generate
local Tables = require(script.Parent.Tables)
require(script.Parent.Types)

local function isArray(a1) -- Line: 39
    if typeof(a1) ~= "table" then
        return false
    end
    if next(a1) == nil then
        return true
    end
    if #a1 == 0 then
        return false
    end
    local v1 = 0
    local v2 = 0
    for i in a1 do
        if typeof(i) ~= "number" then
            return false
        end
        if i % 1 == 0 and not (i < 1) then
            v1 = v1 + 1
            v2 = v2 + i
            continue
        end
        return false
    end
    return v2 == v1 * (v1 + 1) / 2
end

local function unescapeSegment(a1) -- Line: 70 -- types: a1: string
    return (string.gsub(string.gsub(a1, "~1", "/"), "~0", "~"))
end

local function escapeSegment(a1) -- Line: 78 -- types: a1: string
    return (string.gsub(string.gsub(a1, "~", "~0"), "/", "~1"))
end

local function parsePointer(a1) -- Line: 86 -- types: a1: string
    local v1
    if a1 == "" then
        return {}
    end
    if string.sub(a1, 1, 1) ~= "/" then
        error("Invalid JSON pointer (must start with / or be empty)")
    end
    local v2 = string.split(string.sub(a1, 2), "/")
    for i, j in v2 do
        v1 = string.gsub(j, "~1", "/")
        v2[i] = (string.gsub(v1, "~0", "~"))
    end
    return v2
end

local function getArrayIndexOrError(a1, a2, a3) -- Line: 104 -- types: a1: string, a2: number, a3: string
    local v1 = tonumber(a1)
    if v1 == nil then
        error((("'%*' path must be a valid numeric index; got '%*'"):format(a3, a1)))
    end
    v1 = v1 + 1
    if v1 < 1 or a2 < v1 then
        error((("Array %* index %* out of bounds for length %*"):format(a3, v1 - 1, a2)))
    end
    return v1
end

local function isStringifiedNumberOk(a1) -- Line: 116 -- types: a1: string
    if a1 == "0" then
        return true
    end
    local v1 = tonumber(a1)
    if v1 == nil then
        return false
    end
    return tostring(v1) == a1
end

local function applyOperation(a1, a2) -- Line: 130 -- upvalues: parsePointer (val), isArray (val), Tables (val)
    local v1, v2, v3, v4, v5, v6
    local op = a2.op
    if typeof(op) ~= "string" then
        error("'op' must be a string")
    end
    local path = a2.path
    if typeof(path) ~= "string" then
        error("missing valid 'path' string")
    end
    local v7 = parsePointer(path)
    local v8 = a1
    local v9 = #v7 - 1
    local v10, v11 = a2, a1
    for i = 1, v9 do
        v6 = v7[i]
        if isArray(v8) then
            if v6 ~= "0" then
                v3 = tonumber(v6)
                v1 = if v3 ~= nil then tostring(v3) == v6 else false
            else
                v1 = true
            end
            if not v1 then
                error((("Path segment '%*' is not a valid array index"):format(v6)))
            end
            v1 = v6
            v2 = #v8
            v6 = tonumber(v1)
            if v6 == nil then
                error((("'%*' path must be a valid numeric index; got '%*'"):format(op, v1)))
            end
            v6 = v6 + 1
            if v6 < 1 or v2 < v6 then
                error((("Array %* index %* out of bounds for length %*"):format(op, v6 - 1, v2)))
            end
        end
        if v8[v6] == nil then
            error("add to a non-existent target")
        end
        if typeof(v8[v6]) ~= "table" then
            error("cannot 'add' into non-table parent")
        end
        v8 = v8[v6]
    end
    if v10.op == "add" then
        local value = v10.value
        if value == nil then
            error("missing 'value' parameter")
        end
        if #v7 == 0 then
            return Tables.copyDeep(value)
        end
        v4 = v7[#v7]
        v5 = isArray(v8)
        v6 = v5
        if v6 then
            v6 = false
            if #v8 == 0 then
                v6 = v4 == "-"
            end
        end
        v1 = v5
        if v1 then
            v1 = false
            if #v8 > 0 then
                v1 = true
                if tonumber(v4) == nil then
                    v1 = v4 == "-"
                end
            end
        end
        if not v6 and not v1 then
            if v5 and #v8 > 0 then
                error("Object operation on array target")
            end
            v8[v4] = (Tables.copyDeep(value))
            return v11
        end
        if v4 == "-" then
            table.insert(v8, (Tables.copyDeep(value)))
            return v11
        end
        if v4 ~= "0" then
            v3 = tonumber(v4)
            v2 = if v3 ~= nil then tostring(v3) == v4 else false
        else
            v2 = true
        end
        if not v2 then
            error("add op shouldn't add to array with bad number")
        end
        v3 = #v8
        v2 = tonumber(v4)
        if v2 == nil then
            error((("'%*' path must be a valid numeric index; got '%*'"):format(op, v4)))
        end
        v2 = v2 + 1
        if v2 < 1 or v3 < v2 then
            error((("Array %* index %* out of bounds for length %*"):format(op, v2 - 1, v3)))
        end
        table.insert(v8, v2, (Tables.copyDeep(value)))
        return v11
    end
    if v10.op == "remove" then
        if #v7 == 0 then
            return nil
        end
        v9 = v7[#v7]
        if isArray(v8) and tonumber(v9) ~= nil then
            if v9 ~= "0" then
                v5 = tonumber(v9)
                v4 = if v5 ~= nil then tostring(v5) == v9 else false
            else
                v4 = true
            end
            if not v4 then
                error("remove op shouldn't remove from array with bad number")
            end
            v5 = #v8
            v4 = tonumber(v9)
            if v4 == nil then
                error((("'%*' path must be a valid numeric index; got '%*'"):format(op, v9)))
            end
            v4 = v4 + 1
            if v4 < 1 or v5 < v4 then
                error((("Array %* index %* out of bounds for length %*"):format(op, v4 - 1, v5)))
            end
            table.remove(v8, v4)
            return v11
        end
        if v8[v9] == nil then
            error((("Cannot remove non-existent key '%*'"):format(v9)))
        end
        v8[v9] = nil
        return v11
    end
    if v10.op ~= "replace" then
        error((("Unrecognized op '%*'"):format(op)))
        return
    end
    local value_2 = v10.value
    if value_2 == nil then
        error("missing 'value' parameter")
    end
    if #v7 == 0 then
        return Tables.copyDeep(value_2)
    end
    v4 = v7[#v7]
    if isArray(v8) and tonumber(v4) ~= nil then
        if v4 ~= "0" then
            v6 = tonumber(v4)
            v5 = if v6 ~= nil then tostring(v6) == v4 else false
        else
            v5 = true
        end
        if not v5 then
            error("replace op shouldn't replace in array with bad number")
        end
        v6 = #v8
        v5 = tonumber(v4)
        if v5 == nil then
            error((("'%*' path must be a valid numeric index; got '%*'"):format(op, v4)))
        end
        v5 = v5 + 1
        if v5 < 1 or v6 < v5 then
            error((("Array %* index %* out of bounds for length %*"):format(op, v5 - 1, v6)))
        end
        v8[v5] = (Tables.copyDeep(value_2))
        return v11
    end
    if v8[v4] == nil then
        error(("Cannot replace non-existent path '%s'"):format(v4))
    end
    v8[v4] = (Tables.copyDeep(value_2))
    return v11
end

local function keys(a1) -- Line: 270 -- types: a1: table
    local v1 = {}
    for i in a1 do
        table.insert(v1, i)
    end
    return v1
end

local function getZeroBasedKey(a1, a2) -- Line: 278 -- types: a2: boolean
    if not a2 then
        return (string.gsub(string.gsub(a1, "~", "~0"), "/", "~1"))
    end
    local v1 = tonumber(a1)
    if v1 == nil then
        return (string.gsub(string.gsub(a1, "~", "~0"), "/", "~1"))
    end
    return (tostring(v1 - 1))
end

function generate(a1, a2, a3, a4) -- Line: 289
    -- upvalues: isArray (val), generate (val), Tables (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16
    if a1 == a2 then
        return
    end
    local v17 = {}
    for i in a2 do
        table.insert(v17, i)
    end
    local v18 = {}
    for j in a1 do
        table.insert(v18, j)
    end
    local v19 = false
    local v20 = isArray(a1)
    local v21 = isArray(a2)
    local v22 = v20 and #a1 or 0
    local v23, v24 = a1, a2
    for k = #v18, 1, -1 do
        v1 = v18[k]
        v2 = v23[v1]
        v3 = v24[v1] ~= nil
        v4 = false
        if v24[v1] == nil then
            v4 = false
            if v2 ~= nil then
                v4 = not v21
            end
        end
        if not v3 then
            if v20 ~= v21 then
                table.insert(v8, {op = "replace", path = v16, value = v24})
            else
                v7 = {op = "remove"}
                if v20 then
                    v12 = tonumber(v1)
                    v11 = if v12 ~= nil then tostring(v12 - 1) else string.gsub(string.gsub(v1, "~", "~0"), "/", "~1")
                else
                    v11 = string.gsub(string.gsub(v1, "~", "~0"), "/", "~1")
                end
                v7.path = v16 .. "/" .. v11
                table.insert(v8, v7)
                v19 = true
            end
        elseif not v4 then
            v5 = v24[v1]
            v6 = false
            if typeof(v2) == "table" then
                v6 = typeof(v5) == "table"
            end
            v7 = (isArray(v2)) == isArray(v5)
            if v6 and v7 then
                if v20 then
                    v15 = tonumber(v1)
                    v14 = if v15 ~= nil then tostring(v15 - 1) else string.gsub(string.gsub(v1, "~", "~0"), "/", "~1")
                else
                    v14 = string.gsub(string.gsub(v1, "~", "~0"), "/", "~1")
                end
                generate(v2, v5, v8, v16 .. "/" .. v14)
            elseif v2 ~= v5 then
                v11 = {op = "replace"}
                if v20 then
                    v14 = tonumber(v1)
                    v13 = if v14 ~= nil then tostring(v14 - 1) else string.gsub(string.gsub(v1, "~", "~0"), "/", "~1")
                else
                    v13 = string.gsub(string.gsub(v1, "~", "~0"), "/", "~1")
                end
                v11.path = v16 .. "/" .. v13
                v11.value = Tables.copyDeep(v5)
                table.insert(v8, v11)
            end
        elseif v20 ~= v21 then
            table.insert(v8, {op = "replace", path = v16, value = v24})
        else
            v7 = {op = "remove"}
            if v20 then
                v12 = tonumber(v1)
                v11 = if v12 ~= nil then tostring(v12 - 1) else string.gsub(string.gsub(v1, "~", "~0"), "/", "~1")
            else
                v11 = string.gsub(string.gsub(v1, "~", "~0"), "/", "~1")
            end
            v7.path = v16 .. "/" .. v11
            table.insert(v8, v7)
            v19 = true
        end
    end
    if not v19 and #v17 == #v18 then
        return
    end
    local v25 = nil
    local v26 = nil
    for n, m in v17, v25, v26 do
        if v23[m] == nil and v24[m] ~= nil then
            if not v20 then
                v5 = {op = "add"}
                if v21 then
                    v10 = tonumber(m)
                    v9 = if v10 ~= nil then tostring(v10 - 1) else string.gsub(string.gsub(m, "~", "~0"), "/", "~1")
                else
                    v9 = string.gsub(string.gsub(m, "~", "~0"), "/", "~1")
                end
                v5.path = v16 .. "/" .. v9
                v5.value = Tables.copyDeep(v24[m])
                table.insert(v8, v5)
            else
                v22 = v22 + 1
                v3 = tonumber(m)
                if v3 == nil or v3 ~= v22 then
                    v5 = {op = "add"}
                    if v21 then
                        v10 = tonumber(m)
                        v9 = if v10 ~= nil then tostring(v10 - 1) else string.gsub(string.gsub(m, "~", "~0"), "/", "~1")
                    else
                        v9 = string.gsub(string.gsub(m, "~", "~0"), "/", "~1")
                    end
                    v5.path = v16 .. "/" .. v9
                    v5.value = Tables.copyDeep(v24[m])
                    table.insert(v8, v5)
                else
                    table.insert(v8, {op = "add", path = v16 .. "/-", value = Tables.copyDeep(v24[m])})
                end
            end
        end
    end
end

return {
    applyPatch = function(a1, a2) -- Line: 375 -- upvalues: applyOperation (val) -- types: a2: table
        local v1 = a1
        for i, j in a2 do
            v1 = applyOperation(v1, j)
        end
        return v1
    end,
    createPatch = function(a1, a2) -- Line: 382 -- upvalues: generate (val)
        local v1 = {}
        generate(a1, a2, v1, "")
        return v1
    end,
}