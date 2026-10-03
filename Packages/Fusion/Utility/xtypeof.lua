-- Script path: ReplicatedStorage.Packages.Fusion.Utility.xtypeof
-- Decompile time: 0.15 ms

return function(a1) -- Line: 9
    local v1 = typeof(a1)
    if v1 == "table" and typeof(a1.type) == "string" then
        return a1.type
    end
    return v1
end