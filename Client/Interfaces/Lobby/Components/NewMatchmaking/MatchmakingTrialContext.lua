-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.MatchmakingTrialContext
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
require(script.Parent.MatchmakingModel)
return React.createContext(nil)