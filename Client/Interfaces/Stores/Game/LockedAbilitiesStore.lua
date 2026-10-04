-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.LockedAbilitiesStore
-- Decompile time: 0.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local u9 = {}
local v1, u13 = Charm.signal(u9)
return {
    getState = v1,
    set = function(a1) -- Line: 15 -- upvalues: u13 (val), u9 (val) -- types: a1: table
        u13(a1 or u9)
    end,
}