-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.TVStatic
-- Decompile time: 0.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u12, u13 = (require(ReplicatedStorage.Packages.Charm)).signal({enabled = false})
return {
    getState = u12,
    setEnabled = function(a1) -- Line: 19 -- upvalues: u12 (val), u13 (val) -- types: a1: boolean
        if u12().enabled == a1 then
            return
        end
        u13({enabled = a1})
    end,
}