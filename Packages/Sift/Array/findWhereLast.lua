-- Script path: ReplicatedStorage.Packages.Sift.Array.findWhereLast
-- Decompile time: 0.42 ms

return function(a1, a2, a3) -- Line: 25 -- types: a1: table, a2: function, a3: number?
    local v1 = #a1
    if type(a3) ~= "number" then
        a3 = v1
    elseif a3 < 1 then
        a3 = v1 + a3
    end
    for i = a3, 1, -1 do
        if a2(a1[i], i, a1) then
            return i
        end
    end
end