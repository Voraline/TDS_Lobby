-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_string@1.2.7.string.lastIndexOf
-- Decompile time: 0.42 ms

return function(a1, a2, a3) -- Line: 1 -- types: a1: string, a2: string, a3: number?
    local v1, v2, v3
    local v4 = string.len(a1)
    local v5 = if not a3 then v4 else a3
    if a3 and a3 < 1 then
        v5 = 1
    end
    if a3 and v4 < a3 then
        v5 = v4
    end
    if a2 == "" then
        return v5
    end
    local v6 = nil
    local v7 = 0
    repeat
        v1 = v6
        v2, v3 = string.find(a1, a2, v7 + 1, true)
        v6 = v2
    until v6 == nil or v5 < v6
    if v1 == nil then
        return -1
    end
    return v1
end