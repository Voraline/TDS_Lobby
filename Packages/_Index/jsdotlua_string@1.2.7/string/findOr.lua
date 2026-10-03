-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_string@1.2.7.string.findOr
-- Decompile time: 0.87 ms

local u8 = "([" .. (("$%^()-[].?"):gsub("(.)", "%%%1")) .. "])"
return function(a1, a2, a3) -- Line: 9 -- upvalues: u8 (val) -- types: a1: string, a2: table, a3: number?
    local v1, v2, v3, v4, v5
    local v6 = utf8.offset(a1, a3 or 1)
    local v7 = {}
    local v8 = nil
    local v9 = nil
    local v10 = a1
    for i, j in a2, v8, v9 do
        v1, v2 = string.find(v10, j:gsub(u8, "%%%1"), v6)
        if v1 then
            v3 = string.sub(v10, 1, v1 - 1)
            v4, v5 = utf8.len(v3)
            if v4 == nil then
                error(("string `%s` has an invalid byte at position %s"):format(v3, (tostring(v5))))
            end
            table.insert(v7, {index = v4 + 1, match = string.sub(v10, v1, v2)})
        end
    end
    if #v7 == 0 then
        return nil
    end
    local v11 = nil
    v9 = nil
    local v12 = nil
    for k, n in v7, v9, v12 do
        if v11 == nil then
            v11 = n
        end
        if n.index < v11.index then
            v11 = n
        end
    end
    return v11
end