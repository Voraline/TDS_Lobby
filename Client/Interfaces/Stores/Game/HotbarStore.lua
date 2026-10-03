-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.HotbarStore
-- Decompile time: 0.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u18, u19 = Charm.signal({consumablesEnabled = false})
return {
    getState = u18,
    setConsumablesEnabled = function(a1) -- Line: 18 -- upvalues: u18 (val), table (val), u19 (val) -- types: a1: boolean
        local v1 = u18()
        if v1.consumablesEnabled == a1 then
            return
        end
        local v2 = table.clone(v1)
        v2.consumablesEnabled = a1
        u19(v2)
    end,
}