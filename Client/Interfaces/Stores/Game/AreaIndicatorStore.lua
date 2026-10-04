-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore
-- Decompile time: 0.92 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u18, u19 = Charm.signal({})
return {
    getState = u18,
    create = function(a1, a2) -- Line: 17 -- upvalues: table (val), u18 (val), u19 (val) -- types: a2: table
        local v1 = table.clone(u18())
        v1[a1] = a2
        u19(v1)
    end,
    remove = function(a1) -- Line: 23 -- upvalues: u18 (val), table (val), u19 (val)
        local v1 = u18()
        if v1[a1] == nil then
            return
        end
        local v2 = table.clone(v1)
        v2[a1] = nil
        u19(v2)
    end,
}