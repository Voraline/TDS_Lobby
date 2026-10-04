-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useOwnedTowers
-- Decompile time: 1.52 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local TowerStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.TowerStore)
local useEffect = React.useEffect
return function(a1) -- Line: 9
    -- upvalues: React (val), ReactCharm (val), TowerStore (val), useEffect (val), Players (val)
    local v1, u5 = React.useState({})
    local u10 = ReactCharm.useSignalState(TowerStore.getState)
    local v2 = {}
    local all = a1 and a1.all
    v2[1] = u10
    v2[2] = all
    useEffect(function() -- Line: 13 -- upvalues: a1 (val), u10 (val), Players (upval), u5 (val)
        local v1 = a1 and a1.all == true
        local v2 = {}
        local v3 = nil
        local v4 = nil
        for i, j in u10, v3, v4 do
            if j.State.OwnerId == Players.LocalPlayer.UserId or v1 then
                v2[i] = j
            end
        end
        u5(v2)
    end, v2)
    return v1
end