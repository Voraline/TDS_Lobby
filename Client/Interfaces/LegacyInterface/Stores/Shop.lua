-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Stores.Shop
-- Decompile time: 1.82 ms

local cloneValue
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Charm = require(ReplicatedStorage.Packages.Charm)

local function shouldPopulate(a1, a2) -- Line: 6 -- upvalues: RunService (val)
    if not RunService:IsRunning() then
        return a1
    end
    if a2 == nil then
        return {}
    end
    return a2
end

function cloneValue(a1) -- Line: 14 -- upvalues: cloneValue (val)
    if type(a1) ~= "table" then
        return a1
    end
    local v1 = {}
    for i, j in a1 do
        v1[i] = (cloneValue(j))
    end
    return v1
end

local v1 = DateTime.fromUnixTimestamp(workspace:GetServerTimeNow())
local v2 = {}
local v3 = DateTime.fromUnixTimestamp(v1.UnixTimestamp + 86400)
v2.Expires = if not RunService:IsRunning() then v3 else if v1 ~= nil then v1 else {}
v2.Bundles = if not RunService:IsRunning() then {} else {}
v2.Rotations = if not RunService:IsRunning() then {
    Emotes = {"Monster Mash", "Dab", "Beggin", "Smug"},
    Crates = {"Basic", "Golden", "Premium", "Deluxe"},
    Skins = {
        {Troop = "Ace Pilot", Skin = "Navy", Crate = "Basic"},
        {Troop = "Minigunner", Skin = "Golden", Crate = "Golden"},
        {Troop = "Cowboy", Skin = "Retired", Crate = "Deluxe"},
        {Troop = "Scout", Skin = "Intern", Crate = "Premium"},
        {Troop = "Warden", Skin = "Pirate", Crate = "Pirate"},
    },
    Tags = {"Sunset", "Sour", "Retro", "Red", "Orange", "Noob", "Inverted", "Green"},
} else {}
v2.Featured = {
    {Type = "Tower", Value = "Minigunner"},
    {Type = "Tower", Value = "Accelerator"},
    {Type = "Tower", Value = "Ace Pilot"},
    {Type = "Crate", Value = "Basic"},
    {Type = "Crate", Value = "Golden"},
    {Type = "Crate", Value = "Deluxe"},
}
local u90, u91 = Charm.signal(v2)
return {
    getState = u90,
    getBundles = function() -- Line: 98 -- upvalues: u90 (val)
        return u90().Bundles
    end,
    getExpires = function() -- Line: 102 -- upvalues: u90 (val)
        return u90().Expires
    end,
    getFeatured = function() -- Line: 106 -- upvalues: u90 (val)
        return u90().Featured
    end,
    getRotation = function(a1) -- Line: 110 -- upvalues: u90 (val) -- types: a1: string
        return u90().Rotations[a1] or {}
    end,
    getRotations = function() -- Line: 114 -- upvalues: u90 (val)
        return u90().Rotations
    end,
    setBundles = function(a1) -- Line: 118 -- upvalues: cloneValue (val), u90 (val), u91 (val)
        local v1 = cloneValue(u90())
        v1.Bundles = cloneValue(a1)
        u91(v1)
    end,
    setExpires = function(a1) -- Line: 124 -- upvalues: cloneValue (val), u90 (val), u91 (val) -- types: a1: userdata
        local v1 = cloneValue(u90())
        v1.Expires = a1
        u91(v1)
    end,
    setRotation = function(a1, a2) -- Line: 130 -- upvalues: cloneValue (val), u90 (val), u91 (val) -- types: a1: string
        local v1 = cloneValue(u90())
        v1.Rotations[a1] = (cloneValue(a2))
        u91(v1)
    end,
}