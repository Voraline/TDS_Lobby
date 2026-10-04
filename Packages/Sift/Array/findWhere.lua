-- Script path: ReplicatedStorage.Packages.Sift.Array.findWhere
-- Decompile time: 0.27 ms

return function(a1, a2, a3) -- Line: 21 -- types: a1: table, a2: function, a3: number?
    local v1 = #a1
    if type(a3) ~= "number" then
        a3 = 1
    elseif a3 < 1 then
        a3 = v1 + a3
    end
    local v2 = #a1
    for i = a3, v2 do
        if a2(a1[i], i, a1) then
            return i
        end
    end
end