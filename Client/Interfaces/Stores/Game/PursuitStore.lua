-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.PursuitStore
-- Decompile time: 0.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u18, u19 = Charm.signal({visible = false})
return {
    getState = u18,
    setVisible = function(a1) -- Line: 19 -- upvalues: table (val), u18 (val), u19 (val) -- types: a1: boolean
        local v1 = table.clone(u18())
        v1.visible = a1
        u19(v1)
    end,
    setModel = function(a1) -- Line: 25 -- upvalues: table (val), u18 (val), u19 (val)
        local v1 = table.clone(u18())
        v1.model = a1
        u19(v1)
    end,
}