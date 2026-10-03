-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-roblox-shared@3.10.0.jest-roblox-shared.cleanLoadStringStack
-- Decompile time: 0.38 ms

local u6 = pcall(debug.loadmodule, Instance.new("ModuleScript"))
return function(a1) -- Line: 3 -- upvalues: u6 (val) -- types: a1: string
    if not u6 then
        local v1, v2, v3, v4 = a1:match("(%s*)%[string \"(.-)\"%]:(%d+)(.*)")
        if v2 then
            local v5 = v2
            if v1 then
                v5 = v1 .. v5
            end
            if v3 then
                v5 = v5 .. ":" .. v3
            end
            if v4 then
                v5 = v5 .. v4
            end
            return v5
        end
    end
    return a1
end