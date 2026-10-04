-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_string@1.2.7.string.charCodeAt
-- Decompile time: 0.51 ms

local NaN = require(script.Parent.Parent:WaitForChild("number")).NaN
return function(a1, a2) -- Line: 7 -- upvalues: NaN (val) -- types: a1: string, a2: number
    if type(a2) ~= "number" then
        a2 = 1
    end
    local v1 = string.len(a1)
    if not (a2 < 1) and not (v1 < a2) then
        local v2 = utf8.offset(a1, a2)
        if v2 ~= nil and not (v1 < v2) then
            local v3 = utf8.codepoint(a1, v2, v2)
            if v3 == nil then
                return NaN
            end
            return v3
        end
        return NaN
    end
    return NaN
end