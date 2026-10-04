-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_string@1.2.7.string.includes
-- Decompile time: 0.53 ms

local u8 = "([" .. (("$%^()-[].?"):gsub("(.)", "%%%1")) .. "])"
return function(a1, a2, a3) -- Line: 4 -- upvalues: u8 (val) -- types: a1: string, a2: string
    local v1, v2 = utf8.len(a1)
    local v3 = ("string `%s` has an invalid byte at position %s"):format(a1, (tostring(v2)))
    assert(v1 ~= nil, v3)
    if v1 == 0 then
        return false
    end
    if #a2 == 0 then
        return true
    end
    local v4 = 1
    if a3 ~= nil and v1 < (tonumber(a3) or 1) then
        return false
    end
    if v4 < 1 then
        v4 = 1
    end
    local v5 = utf8.offset(a1, v4)
    return (string.find(a1, a2:gsub(u8, "%%%1"), v5)) ~= nil
end