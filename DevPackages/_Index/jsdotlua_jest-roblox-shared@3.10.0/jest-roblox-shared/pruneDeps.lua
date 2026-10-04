-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-roblox-shared@3.10.0.jest-roblox-shared.pruneDeps
-- Decompile time: 1.24 ms

local u0 = {"JestRoblox._Index.", "@jsdotlua.jest.", "@jsdotlua.promise."}
local cleanLoadStringStack = require(script.Parent:WaitForChild("cleanLoadStringStack"))
return function(a1) -- Line: 23 -- upvalues: u0 (val), cleanLoadStringStack (val) -- types: a1: string?
    local v1
    if a1 == nil then
        return nil
    end
    local v2 = {}
    for i, j in a1:split("\n") do
        v1 = false
        for k, n in u0 do
            if string.find(j, n, 1, true) then
                v1 = true
                break
            end
        end
        if not v1 then
            table.insert(v2, j)
        end
        table.insert(v2, (cleanLoadStringStack(j)))
    end
    return table.concat(v2, "\n")
end