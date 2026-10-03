-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.GlitchScreenStore
-- Decompile time: 0.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u12, u13 = (require(ReplicatedStorage.Packages.Charm)).signal({enabled = false})
return {
    getState = u12,
    getEnabled = function() -- Line: 19 -- upvalues: u12 (val)
        return u12().enabled
    end,
    setEnabled = function(a1) -- Line: 23 -- upvalues: u12 (val), u13 (val) -- types: a1: boolean
        if u12().enabled == a1 then
            return
        end
        u13({enabled = a1})
    end,
}