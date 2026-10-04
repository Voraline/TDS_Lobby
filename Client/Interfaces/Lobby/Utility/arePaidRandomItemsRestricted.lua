-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Utility.arePaidRandomItemsRestricted
-- Decompile time: 2.09 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Client.Controllers.Shared
local Modules = ReplicatedStorage.Shared.Modules
local FFlagController = require(Shared.FFlagController)
local UserPolicies = require(Modules.UserPolicies)
local LocalPlayer = Players.LocalPlayer
local u25 = FFlagController.get("policies.paid_random_items_restricted_ids", {})

local function isFlaggedUser(a1) -- Line: 19 -- upvalues: u25 (val) -- types: a1: number
    for i, j in u25() do
        if tonumber(j) == a1 then
            return true
        end
    end
    return false
end

return function() -- Line: 29 -- upvalues: LocalPlayer (val), u25 (val), UserPolicies (val)
    local v1, v2
    local UserId = LocalPlayer.UserId
    for i, j in u25() do
        if tonumber(j) == UserId then
            if true then
                return true
            end
            v1, v2 = UserPolicies(LocalPlayer):await()
            if v1 then
                return v2.ArePaidRandomItemsRestricted == true
            end
            warn("Unable to resolve user policies; defaulting to restricted")
            return true
        end
    end
    if false then
        return true
    end
    v1, v2 = UserPolicies(LocalPlayer):await()
    if v1 then
        return v2.ArePaidRandomItemsRestricted == true
    end
    warn("Unable to resolve user policies; defaulting to restricted")
    return true
end