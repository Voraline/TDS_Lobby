-- Script path: ReplicatedStorage.Client.Modules.Comma
-- Decompile time: 0.19 ms

return function(a1) -- Line: 1
    local v1, v2
    local v3 = tostring(a1)
    repeat
        v1, v2 = string.gsub(v3, "^(-?%d+)(%d%d%d)", "%1,%2")
        v3 = v1
    until v2 == 0
    return v3
end