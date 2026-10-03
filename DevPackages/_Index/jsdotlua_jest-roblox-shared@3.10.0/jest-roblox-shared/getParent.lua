-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-roblox-shared@3.10.0.jest-roblox-shared.getParent
-- Decompile time: 0.45 ms

return function(a1, a2) -- Line: 2 -- types: a1: string, a2: number?
    local v1 = a2 or 0
    local v2 = string.sub(a1, 1, 1) == "/"
    local v3 = {}
    for i in string.gmatch(a1, "[^\\/][^\\/]*") do
        table.insert(v3, i)
    end
    if v1 > 0 then
        v3 = {table.unpack(v3, 1, #v3 - v1)}
    end
    if v2 then
        return "/" .. table.concat(v3, "/")
    end
    return table.concat(v3, "\\")
end