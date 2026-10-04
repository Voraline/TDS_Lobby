-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.MusicSyncStore
-- Decompile time: 0.89 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u18, u19 = Charm.signal({enabled = false, fadeOutTime = 0})
return {
    getState = u18,
    setEnabled = function(a1, a2) -- Line: 19 -- upvalues: u19 (val), table (val), u18 (val) -- types: a1: boolean?, a2: number?
        u19((table.merge(u18(), {enabled = a1 or false, fadeOutTime = a2 or 0})))
    end,
}