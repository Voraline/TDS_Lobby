-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.CrosshairStore
-- Decompile time: 1.98 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u15 = {spread = 5, enabled = false, forcedModel = false}
local u18, u19 = Charm.signal(u15)
return {
    getState = u18,
    addSpread = function(a1) -- Line: 20 -- upvalues: u18 (val), u19 (val), table (val) -- types: a1: number
        local v1 = u18()
        u19((table.merge(v1, {spread = v1.spread + a1})))
    end,
    removeSpread = function(a1) -- Line: 27 -- upvalues: u18 (val), u19 (val), table (val), u15 (val) -- types: a1: number
        local v1 = u18()
        u19((table.merge(v1, {spread = math.clamp(v1.spread - a1, u15.spread, 100)})))
    end,
    setEnabled = function(a1) -- Line: 35 -- upvalues: u18 (val), u19 (val), table (val) -- types: a1: boolean
        local v1 = u18()
        if v1.enabled == a1 then
            return
        end
        u19((table.merge(v1, {enabled = a1})))
    end,
    setForcedModel = function(a1) -- Line: 46 -- upvalues: u19 (val), table (val), u18 (val)
        u19((table.merge(u18(), {forcedModel = a1})))
    end,
}