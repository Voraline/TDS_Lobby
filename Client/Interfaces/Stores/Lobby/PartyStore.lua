-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Lobby.PartyStore
-- Decompile time: 2.83 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u22, u23 = Charm.signal({declined = {}, invites = {}, parties = {}, friends = {}})
return {
    getState = u22,
    setDeclined = function(a1) -- Line: 54 -- upvalues: u22 (val), table (val), u23 (val) -- types: a1: table
        local v1 = u22()
        if v1.declined == a1 then
            return
        end
        local v2 = table.clone(v1)
        v2.declined = a1
        u23(v2)
    end,
    setInvites = function(a1) -- Line: 65 -- upvalues: u22 (val), table (val), u23 (val) -- types: a1: table
        local v1 = u22()
        if v1.invites == a1 then
            return
        end
        local v2 = table.clone(v1)
        v2.invites = a1
        u23(v2)
    end,
    setParty = function(a1) -- Line: 76 -- upvalues: u22 (val), table (val), u23 (val) -- types: a1: table?
        local v1 = u22()
        if v1.party == a1 then
            return
        end
        local v2 = table.clone(v1)
        v2.party = a1
        u23(v2)
    end,
    setParties = function(a1) -- Line: 87 -- upvalues: u22 (val), table (val), u23 (val) -- types: a1: table
        local v1 = u22()
        if v1.parties == a1 then
            return
        end
        local v2 = table.clone(v1)
        v2.parties = a1
        u23(v2)
    end,
    setPartyParams = function(a1) -- Line: 98 -- upvalues: u22 (val), table (val), u23 (val) -- types: a1: table
        local v1 = u22()
        if v1.party and v1.party.partyParams ~= a1 then
            local v2 = table.clone(v1.party)
            v2.partyParams = a1
            local v3 = table.clone(v1)
            v3.party = v2
            u23(v3)
            return
        end
    end,
    setFriends = function(a1) -- Line: 112 -- upvalues: u22 (val), table (val), u23 (val) -- types: a1: table
        local v1 = u22()
        if v1.friends == a1 then
            return
        end
        local v2 = table.clone(v1)
        v2.friends = a1
        u23(v2)
    end,
}