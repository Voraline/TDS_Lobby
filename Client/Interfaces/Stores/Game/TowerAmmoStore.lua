-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.TowerAmmoStore
-- Decompile time: 0.74 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u18, u19 = Charm.signal({enabled = false, reloading = false, maxAmmo = 0, ammo = 0})
return {
    getState = u18,
    setEnabled = function(a1) -- Line: 21 -- upvalues: u19 (val), table (val), u18 (val) -- types: a1: boolean?
        u19((table.merge(u18(), {enabled = a1 or false})))
    end,
    setMaxAmmo = function(a1) -- Line: 27 -- upvalues: u19 (val), table (val), u18 (val) -- types: a1: number?
        u19((table.merge(u18(), {maxAmmo = a1 or 0})))
    end,
    setAmmo = function(a1) -- Line: 33 -- upvalues: u19 (val), table (val), u18 (val) -- types: a1: number?
        u19((table.merge(u18(), {ammo = a1 or 0})))
    end,
    setReloading = function(a1) -- Line: 39 -- upvalues: u19 (val), table (val), u18 (val) -- types: a1: boolean?
        u19((table.merge(u18(), {reloading = a1 or false})))
    end,
}