-- Script path: ReplicatedStorage.Shared.UI.Policy
-- Decompile time: 0.52 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Packages.Fusion)
local UserPolicies = require(ReplicatedStorage.Shared.Modules.UserPolicies)
local Value = Fusion.Value
local u20 = {}
local LocalPlayer = Players.LocalPlayer
return function(a1, a2) -- Line: 11
    -- upvalues: u20 (val), Value (val), UserPolicies (val), LocalPlayer (val)
    if u20[a1] then
        return u20[a1]
    end
    local u8 = Value(a2)
    u20[a1] = u8
    ;(UserPolicies(LocalPlayer)):andThen(function(a1_2) -- Line: 19 -- upvalues: a1 (val), u8 (val)
        local v1 = a1_2[a1]
        if v1 ~= nil then
            u8:set(v1)
        end
    end)
    return u8
end