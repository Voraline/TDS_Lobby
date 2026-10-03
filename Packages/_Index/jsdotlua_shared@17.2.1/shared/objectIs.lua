-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.objectIs
-- Decompile time: 0.35 ms

return function(a1, a2) -- Line: 16
    local v1
    if a1 ~= a2 then
        v1 = false
        if a1 ~= a1 then
            v1 = a2 ~= a2
        end
    else
        v1 = true
        if a1 == 0 then
            v1 = true
            if 1 / a1 ~= 1 / a2 then
                v1 = false
                if a1 ~= a1 then
                    v1 = a2 ~= a2
                end
            end
        end
    end
    return v1
end