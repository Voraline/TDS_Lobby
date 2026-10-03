-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-each@3.10.0.jest-each.table.format
-- Decompile time: 1.01 ms

local NaN = (require((script.Parent.Parent.Parent:WaitForChild("luau-polyfill")))).Number.NaN
local HttpService = game:GetService("HttpService")
return function(...) -- Line: 30 -- upvalues: NaN (val), HttpService (val)
    local u0 = 2
    local u1 = {}
    u1[1] = ...
    local v1 = u1[1]
    local u4 = #u1
    return (v1:gsub("%%[sdj%%]", function(a1) -- Line: 36 -- upvalues: u0 (ref), u4 (val), u1 (val), NaN (upval), HttpService (upval)
        local v1
        if a1 == "%%" then
            return "%"
        end
        if u4 < u0 then
            return a1
        end
        if a1 == "%s" then
            v1 = if typeof(u1[u0]) ~= "function" then tostring(u1[u0]) else "Function"
            u0 = u0 + 1
            return v1
        end
        if a1 == "%d" then
            v1 = tonumber(u1[u0]) or NaN
            u0 = u0 + 1
            return (tostring(v1))
        end
        if a1 ~= "%j" then
            return a1
        end
        local success, result = pcall(function() -- Line: 57 -- upvalues: HttpService (upval), u1 (upval), u0 (upval)
            local v1 = HttpService:JSONEncode(u1[u0])
            u0 = u0 + 1
            return v1
        end)
        if success then
            return result
        end
        u0 = u0 + 1
        return "[Circular]"
    end))
end