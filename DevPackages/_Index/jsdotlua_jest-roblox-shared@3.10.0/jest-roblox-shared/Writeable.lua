-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-roblox-shared@3.10.0.jest-roblox-shared.Writeable
-- Decompile time: 0.66 ms

local u0 = {}
u0.__index = u0

function u0.new(a1) -- Line: 25 -- upvalues: u0 (val) -- types: a1: table?
    local v1 = setmetatable({}, u0)
    v1._writeFn = if a1 == nil then print else if typeof(a1.write) ~= "function" then print else a1.write
    v1.isTTY = false
    return v1
end

function u0.write(a1, a2) -- Line: 32 -- types: a1: table, a2: string
    a1._writeFn(a2)
end

return {Writeable = u0}