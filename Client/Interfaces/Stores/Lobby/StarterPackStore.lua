-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Lobby.StarterPackStore
-- Decompile time: 0.80 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u11, u12 = require(ReplicatedStorage.Packages.Charm).signal({})
return {
    getBundles = u11,
    getEndTime = function() -- Line: 15 -- upvalues: u11 (val)
        return u11().StarterPack or 0
    end,
    setBundles = function(a1) -- Line: 20 -- upvalues: u12 (val) -- types: a1: table?
        u12(table.clone(a1 or {}))
    end,
}