-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_string@1.2.7.string.indexOf
-- Decompile time: 0.54 ms

local u8 = "([" .. (("$%^()-[].?"):gsub("(.)", "%%%1")) .. "])"
return function(a1, a2, a3) -- Line: 7 -- upvalues: u8 (val) -- types: a1: string, a2: string, a3: number?
    local v1
    local v2 = #a1
    local v3 = if a3 == nil then 1 else if not (a3 < 1) then a3 else 1
    if #a2 == 0 then
        if v2 < v3 then
            return v2
        end
        return v3
    end
    if v2 < v3 then
        return -1
    end
    local v4 = a2:gsub(u8, "%%%1")
    local v5 = #v4
    for i = v3, v2 do
        v1 = i + v5 - 1
        if string.sub(a1, i, v1) == v4 then
            return i
        end
    end
    return -1
end