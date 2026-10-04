-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Shared.GiftboxStore
-- Decompile time: 0.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1, u12 = require(ReplicatedStorage.Packages.Charm).signal(false)
return {
    getShowButton = v1,
    setShowButton = function(a1) -- Line: 11 -- upvalues: u12 (val) -- types: a1: boolean
        u12(a1)
    end,
}