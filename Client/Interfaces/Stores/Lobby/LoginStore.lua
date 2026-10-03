-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Lobby.LoginStore
-- Decompile time: 0.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u18, u19 = Charm.signal({day = 0, claimed = -1})
return {
    getState = u18,
    setDay = function(a1) -- Line: 19 -- upvalues: u18 (val), table (val), u19 (val) -- types: a1: number
        local v1 = u18()
        if v1.day == a1 then
            return
        end
        local v2 = table.clone(v1)
        v2.day = a1
        u19(v2)
    end,
    setClaimed = function(a1) -- Line: 30 -- upvalues: u18 (val), table (val), u19 (val) -- types: a1: number
        local v1 = u18()
        if v1.claimed == a1 then
            return
        end
        local v2 = table.clone(v1)
        v2.claimed = a1
        u19(v2)
    end,
}