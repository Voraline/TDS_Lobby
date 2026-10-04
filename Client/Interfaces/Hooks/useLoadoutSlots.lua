-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useLoadoutSlots
-- Decompile time: 0.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SharedGameConstants = require(ReplicatedStorage.Shared.Modules.SharedGameConstants)
local useVIP = require(script.Parent.useVIP)
return function() -- Line: 6 -- upvalues: useVIP (val), SharedGameConstants (val)
    if useVIP() then
        return SharedGameConstants.MAX_VIP_LOADOUT_SLOTS
    end
    return SharedGameConstants.MAX_LOADOUT_SLOTS
end