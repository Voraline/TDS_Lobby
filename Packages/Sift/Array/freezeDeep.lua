-- Script path: ReplicatedStorage.Packages.Sift.Array.freezeDeep
-- Decompile time: 0.33 ms

local freezeDeep

function freezeDeep(a1) -- Line: 21 -- upvalues: freezeDeep (val) -- types: a1: table
    local v1
    local v2 = {}
    local v3 = #a1
    for i = 1, v3 do
        v1 = a1[i]
        if type(v1) ~= "table" then
            table.insert(v2, v1)
        else
            table.insert(v2, (freezeDeep(v1)))
        end
    end
    table.freeze(v2)
    return v2
end

return freezeDeep