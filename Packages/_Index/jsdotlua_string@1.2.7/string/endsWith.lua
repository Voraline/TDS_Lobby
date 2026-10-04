-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_string@1.2.7.string.endsWith
-- Decompile time: 0.29 ms

return function(a1, a2, a3) -- Line: 1 -- types: a1: string, a2: string, a3: number?
    local v1 = a2:len()
    if v1 == 0 then
        return true
    end
    local v2 = a1:len()
    local v3 = a3 or v2
    if v2 < v3 then
        v3 = v2
    end
    if v3 < 1 then
        return false
    end
    local v4 = v3 - v1 + 1
    return a1:find(a2, v4, true) == v4
end