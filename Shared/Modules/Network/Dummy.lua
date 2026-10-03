-- Script path: ReplicatedStorage.Shared.Modules.Network.Dummy
-- Decompile time: 0.20 ms

local v1 = {}
v1.__index = v1

local function u1() end

local v2 = {
    __index = function() -- Line: 7 -- upvalues: u1 (val)
        return u1
    end,
}
setmetatable(v1, v2)
return v1