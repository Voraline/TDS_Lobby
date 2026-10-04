-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_boolean@1.2.7.boolean.toJSBoolean
-- Decompile time: 0.30 ms

local number = require(script.Parent.Parent:WaitForChild("number"))
return function(a1) -- Line: 4 -- upvalues: number (val)
    local v1 = not not a1
    if v1 then
        v1 = false
        if a1 ~= 0 then
            v1 = false
            if a1 ~= "" then
                v1 = not number.isNaN(a1)
            end
        end
    end
    return v1
end