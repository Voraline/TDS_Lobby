-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.KingpinStore
-- Decompile time: 0.85 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local u9 = {}

local function getDefaultBountySelection() -- Line: 21
    return {enabled = false, canSelect = false}
end

u9.bountySelection = Charm.atom({enabled = false, canSelect = false})
u9.kingpinBounties = Charm.atom({})

local function createBountyEntry(a1) -- Line: 34 -- types: a1: number
    return {amount = a1}
end

function u9.setBountySelection(a1) -- Line: 40 -- upvalues: u9 (val) -- types: a1: table
    u9.bountySelection(a1)
end

function u9.clearBountySelection() -- Line: 44 -- upvalues: u9 (val)
    u9.bountySelection({enabled = false, canSelect = false})
end

function u9.getBounty(a1) -- Line: 48 -- upvalues: u9 (val) -- types: a1: userdata
    return u9.kingpinBounties()[a1]
end

function u9.hasBounty(a1) -- Line: 52 -- upvalues: u9 (val) -- types: a1: userdata
    return u9.getBounty(a1) ~= nil
end

function u9.createBounty(a1, a2) -- Line: 56 -- upvalues: u9 (val) -- types: a1: userdata, a2: number
    u9.kingpinBounties(function(a1_2) -- Line: 57 -- upvalues: a1 (val), a2 (val)
        local v1 = table.clone(a1_2)
        v1[a1] = {amount = a2}
        return v1
    end)
end

function u9.removeBounty(a1) -- Line: 65 -- upvalues: u9 (val) -- types: a1: userdata
    u9.kingpinBounties(function(a1_2) -- Line: 66 -- upvalues: a1 (val)
        local v1 = table.clone(a1_2)
        v1[a1] = nil
        return v1
    end)
end

return u9