-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.TutorialStore
-- Decompile time: 0.65 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u19, u20 = Charm.signal({ValidInstancesOrRefs = {}})
return {
    getState = u19,
    setUnlockedTower = function(a1) -- Line: 23 -- upvalues: table (val), u19 (val), u20 (val) -- types: a1: string?
        local v1 = table.deepClone(u19())
        v1.UnlockedTower = a1
        u20(v1)
    end,
    setSpotlightKeyName = function(a1) -- Line: 29 -- upvalues: table (val), u19 (val), u20 (val) -- types: a1: string?
        local v1 = table.deepClone(u19())
        v1.SpotlightKeyName = a1
        u20(v1)
    end,
    addValidInstanceOrRef = function(a1, a2) -- Line: 35 -- upvalues: table (val), u19 (val), u20 (val) -- types: a1: string
        local v1 = table.deepClone(u19())
        v1.ValidInstancesOrRefs[a1] = a2
        u20(v1)
    end,
    removeValidInstanceOrRef = function(a1) -- Line: 41 -- upvalues: table (val), u19 (val), u20 (val) -- types: a1: string
        local v1 = table.deepClone(u19())
        v1.ValidInstancesOrRefs[a1] = nil
        u20(v1)
    end,
    setSpotlightId = function(a1) -- Line: 47 -- upvalues: table (val), u19 (val), u20 (val) -- types: a1: string?
        local v1 = table.deepClone(u19())
        v1.SpotlightId = a1
        u20(v1)
    end,
}