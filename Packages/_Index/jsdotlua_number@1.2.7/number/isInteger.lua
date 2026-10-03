-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_number@1.2.7.number.isInteger
-- Decompile time: 0.19 ms

return function(a1) -- Line: 2
    local v1 = false
    if type(a1) == "number" then
        v1 = false
        if a1 ~= (1 / 0) then
            v1 = a1 == math.floor(a1)
        end
    end
    return v1
end