-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Lobby.ServerCountStore
-- Decompile time: 0.97 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u19, u20 = Charm.signal({serverCount = {}})
return {
    getState = u19,
    getServerCount = function() -- Line: 20 -- upvalues: u19 (val)
        return u19().serverCount
    end,
    updateServerCount = function(a1) -- Line: 24 -- upvalues: u19 (val), table (val), u20 (val)
        local v1 = u19()
        if table.deepCompare(v1.serverCount, a1) then
            return
        end
        local v2 = table.clone(v1)
        v2.serverCount = a1 or v1.serverCount
        u20(v2)
    end,
}