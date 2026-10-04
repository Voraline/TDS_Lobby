-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-roblox-shared@3.10.0.jest-roblox-shared.redactStackTrace
-- Decompile time: 1.09 ms

local u8 = (("\nRedacted.Stack.Trace:1337 function epicDuck"):rep(4)):sub(2)
return function(a1) -- Line: 21 -- upvalues: u8 (val) -- types: a1: string?
    local v1, v2
    if a1 == nil then
        return nil
    end
    local v3 = {}
    local v4 = false
    for i, j in a1:split("\n") do
        v1 = if not v4 then "Redacted.Stack.Trace:1337: The epic duck is coming!" else ""
        v2 = (j:gsub("[%w_%-]+%.[%w_%-%.]+%:%d+[%w \t_]*", if not v4 then u8 else "")):gsub("[%w_%-]+%.[%w_%-%.]+%:%d+%:[%w \t_]*", v1)
        if not (j ~= v2) or v2:match("%S") then
            table.insert(v3, v2)
        end
    end
    return table.concat(v3, "\n")
end