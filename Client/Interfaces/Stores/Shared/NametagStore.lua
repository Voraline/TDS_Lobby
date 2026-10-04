-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Shared.NametagStore
-- Decompile time: 0.86 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local u11, u12 = Charm.signal(true)
local u15, u16 = Charm.signal(true)
return {
    getEnabled = u11,
    getSettingEnabled = u15,
    getVisible = function() -- Line: 13 -- upvalues: u11 (val), u15 (val)
        return u11() and u15()
    end,
    setEnabled = function(a1) -- Line: 17 -- upvalues: u11 (val), u12 (val) -- types: a1: boolean
        if u11() == a1 then
            return
        end
        u12(a1)
    end,
    setSettingEnabled = function(a1) -- Line: 25 -- upvalues: u15 (val), u16 (val) -- types: a1: boolean
        if u15() == a1 then
            return
        end
        u16(a1)
    end,
}