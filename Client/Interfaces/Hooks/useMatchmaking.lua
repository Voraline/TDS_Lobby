-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useMatchmaking
-- Decompile time: 1.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local MatchmakingStore = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.MatchmakingStore)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
return function() -- Line: 7 -- upvalues: ReactCharm (val), MatchmakingStore (val), RunService (val), ReplicatedStorage (val)
    local v1 = ReactCharm.useSignalState(MatchmakingStore.getIsInParty)
    local u18 = nil
    if RunService:IsRunning() then
        u18 = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.MatchmakingController)
        u18:init()
    end
    return v1, function() -- Line: 19 -- upvalues: u18 (ref)
        if not u18 then
            return
        end
        return u18:createParty(false)
    end, function(a1) -- Line: 26 -- upvalues: u18 (ref) -- types: a1: userdata
        if not u18 then
            return
        end
        return u18:createInvite(a1)
    end
end