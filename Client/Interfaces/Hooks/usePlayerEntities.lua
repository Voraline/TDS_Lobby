-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.usePlayerEntities
-- Decompile time: 0.56 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
local useEvent = require(ReplicatedStorage.Client.Interfaces.Hooks.useEvent)
return function() -- Line: 9 -- upvalues: React (val), PlayerReplicator (val), useEvent (val), Players (val)
    local v1, u4 = React.useState(function() -- Line: 10 -- upvalues: PlayerReplicator (upval)
        return PlayerReplicator.GetPlayers()
    end)
    useEvent(PlayerReplicator.PlayerAdded, function(a1) -- Line: 14 -- upvalues: u4 (val), Players (upval)
        u4(Players:GetPlayers())
    end, {})
    useEvent(PlayerReplicator.PlayerRemoving, function(a1) -- Line: 18 -- upvalues: u4 (val), Players (upval)
        u4(Players:GetPlayers())
    end, {})
    return v1
end