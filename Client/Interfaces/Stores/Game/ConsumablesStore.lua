-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.ConsumablesStore
-- Decompile time: 0.64 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u23, u24 = Charm.signal({})
return {
    getState = u23,
    create = function(a1) -- Line: 27 -- upvalues: table (val), u23 (val), u24 (val) -- types: a1: table
        local v1 = table.deepClone(u23())
        v1[a1.id] = {
            id = a1.id,
            range = a1.range,
            target = a1.target,
            color = a1.color,
            owner = a1.owner,
            ownerIconOffset = a1.infoOffset,
            replicator = a1.replicator,
            infoOffset = a1.infoOffset,
        }
        u24(v1)
    end,
    update = function(a1) -- Line: 42 -- upvalues: u24 (val), table (val), u23 (val) -- types: a1: table
        u24((table.union(u23(), a1)))
    end,
    remove = function(a1) -- Line: 46 -- upvalues: u23 (val), table (val), u24 (val) -- types: a1: string
        local v1 = u23()
        if not v1[a1] then
            return
        end
        local v2 = table.deepClone(v1)
        v2[a1] = nil
        u24(v2)
    end,
}