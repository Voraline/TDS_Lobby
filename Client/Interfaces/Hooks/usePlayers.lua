-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.usePlayers
-- Decompile time: 0.47 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useEvent = require(ReplicatedStorage.Client.Interfaces.Hooks.useEvent)
return function() -- Line: 7 -- upvalues: React (val), Players (val), useEvent (val)
    local v1, u7 = React.useState(Players:GetPlayers())
    useEvent(Players.PlayerAdded, function(a1) -- Line: 10 -- upvalues: u7 (val), Players (upval)
        u7(Players:GetPlayers())
    end, {})
    useEvent(Players.PlayerRemoving, function(a1) -- Line: 14 -- upvalues: u7 (val), Players (upval)
        u7(Players:GetPlayers())
    end, {})
    return v1
end