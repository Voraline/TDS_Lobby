-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Lobby.EventMissionStore
-- Decompile time: 1.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u18, u19 = Charm.signal({})
return {
    getState = u18,
    add = function(a1) -- Line: 24 -- upvalues: u18 (val), table (val), u19 (val) -- types: a1: table
        local v1 = u18()
        for i, j in v1 do
            if j.id == a1.id then
                return
            end
        end
        local v2 = table.clone(v1)
        table.insert(v2, a1)
        u19(v2)
    end,
    remove = function(a1) -- Line: 37 -- upvalues: u18 (val), table (val), u19 (val) -- types: a1: string
        local v1 = {}
        local v2 = false
        for i, j in u18() do
            if j.id ~= a1 then
                table.insert(v1, j)
            else
                v2 = true
            end
        end
        if v2 then
            u19(v1)
        end
    end,
}