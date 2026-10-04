-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.freezeDeep
-- Decompile time: 0.35 ms

local freezeDeep
require(script.Parent.Parent.Types)

function freezeDeep(a1) -- Line: 22 -- upvalues: freezeDeep (val)
    local v1 = {}
    for k, v in pairs(a1) do
        if type(v) ~= "table" then
            v1[k] = v
        else
            v1[k] = (freezeDeep(v))
        end
    end
    table.freeze(v1)
    return v1
end

return freezeDeep