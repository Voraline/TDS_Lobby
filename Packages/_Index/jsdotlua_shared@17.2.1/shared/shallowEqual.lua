-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.shallowEqual
-- Decompile time: 0.49 ms

local objectIs = require(script.Parent:WaitForChild("objectIs"))
return function(a1, a2) -- Line: 18 -- upvalues: objectIs (val)
    if objectIs(a1, a2) then
        return true
    end
    if typeof(a1) == "table" and a1 ~= nil and typeof(a2) == "table" and a2 ~= nil then
        for i, j in a1 do
            if not objectIs(a2[i], j) then
                return false
            end
        end
        for k, n in a2 do
            if not objectIs(a1[k], n) then
                return false
            end
        end
        return true
    end
    return false
end