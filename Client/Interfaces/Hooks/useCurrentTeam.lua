-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useCurrentTeam
-- Decompile time: 1.09 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local usePlayerTeams = require(ReplicatedStorage.Client.Interfaces.Hooks.usePlayerTeams)
local useMemo = React.useMemo
local LocalPlayer = Players.LocalPlayer
return function() -- Line: 12 -- upvalues: usePlayerTeams (val), useMemo (val), LocalPlayer (val), Enum (val)
    local u1 = usePlayerTeams()
    return useMemo(function() -- Line: 14 -- upvalues: u1 (val), LocalPlayer (upval), Enum (upval)
        for i, j in u1 do
            if j[LocalPlayer] then
                return i
            end
        end
        return Enum.Team.Player
    end, {u1})
end