-- Script path: ReplicatedStorage.Client.Controllers.Lobby.LegacyLobbyInterfaceController.Matchmaking
-- Decompile time: 0.29 ms

local Controllers = script:WaitForChild("Controllers")
local MatchInfo = require(Controllers:WaitForChild("MatchInfo"))
MatchInfo:Initialize()
MatchInfo:Close()
return {MatchInfo = MatchInfo}