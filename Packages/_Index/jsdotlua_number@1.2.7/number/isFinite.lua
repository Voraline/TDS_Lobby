-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_number@1.2.7.number.isFinite
-- Decompile time: 0.17 ms

return function(a1) -- Line: 1
    local v1 = false
    if typeof(a1) == "number" then
        v1 = false
        if a1 == a1 then
            v1 = false
            if a1 ~= (1 / 0) then
                v1 = a1 ~= (-1 / 0)
            end
        end
    end
    return v1
end