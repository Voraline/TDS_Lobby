-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_string@1.2.7.string.startsWith
-- Decompile time: 0.36 ms

return function(a1, a2, a3) -- Line: 1 -- types: a1: string, a2: string, a3: number?
    if string.len(a2) == 0 then
        return true
    end
    local v1 = if a3 == nil then 1 else if not (a3 < 1) then a3 else 1
    if string.len(a1) < v1 then
        return false
    end
    return a1:find(a2, v1, true) == v1
end