-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Lobby.ShopFocusStore
-- Decompile time: 0.65 ms

local Packages = (game:GetService("ReplicatedStorage")).Packages
local v1, u12 = require(Packages.Charm).signal({})
return {
    getShopFocusData = v1,
    setShopFocusData = function(a1) -- Line: 46 -- upvalues: u12 (val) -- types: a1: table?
        u12(table.clone(a1 or {}))
    end,
}