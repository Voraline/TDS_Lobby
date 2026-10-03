-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.PVPIntermissionStore
-- Decompile time: 0.31 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u18, u19 = Charm.signal({Enabled = false})
return {
    getState = u18,
    setEnabled = function(a1) -- Line: 20 -- upvalues: table (val), u18 (val), u19 (val) -- types: a1: boolean?
        local v1 = table.clone(u18())
        v1.Enabled = a1 or false
        u19(v1)
    end,
}