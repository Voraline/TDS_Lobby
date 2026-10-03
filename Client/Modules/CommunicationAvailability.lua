-- Script path: ReplicatedStorage.Client.Modules.CommunicationAvailability
-- Decompile time: 1.48 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FFlagController = require(ReplicatedStorage.Client.Controllers.Shared.FFlagController)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
local TutorialMatch = require(ReplicatedStorage.Shared.Modules.TutorialMatch)
local u32 = {}
local u36 = FFlagController.get("communication.enabled", false)

local function isGame() -- Line: 12
    local Type = workspace:FindFirstChild("Type")
    local v1 = false
    if Type ~= nil then
        v1 = Type:IsA("StringValue") and Type.Value == "Game"
    end
    return v1
end

function u32.canUseFromState(a1, a2, a3, a4, a5, a6, a7) -- Line: 17
    -- upvalues: u32 (val), TutorialMatch (val), Players (val)
    if a6 == nil then
        a6 = u32.isEnabled()
    end
    if a6 ~= true then
        return false
    end
    local Type = workspace:FindFirstChild("Type")
    local v1 = false
    if Type ~= nil then
        v1 = Type:IsA("StringValue") and Type.Value == "Game"
    end
    if not v1 or a5 == true then
        return false
    end
    if a1 ~= "Sandbox" and a7 ~= true and not TutorialMatch(nil, nil, a1) then
        v1 = if not a3 then nil else if a4 == nil then nil else a3[a4]
        if a1 == "PVP" then
            return 1 < (v1 or 0)
        end
        if v1 and v1 > 0 then
            return v1 > 1
        end
        return 1 < (a2 or #Players:GetPlayers())
    end
    return false
end

function u32.isEnabled() -- Line: 61 -- upvalues: u36 (val)
    return u36() == true
end

function u32.canUse() -- Line: 65
    -- upvalues: Players (val), PlayerReplicator (val), u32 (val), GameState (val), TutorialMatch (val)
    local LocalPlayer = Players.LocalPlayer
    local v1 = LocalPlayer and PlayerReplicator.GetEntityFromPlayer(LocalPlayer)
    return u32.canUseFromState(
        GameState.GameMode,
        GameState.PlayerCount,
        GameState.PlayerCountPerTeam,
        v1 and v1.Team,
        GameState.Intermission,
        nil,
        TutorialMatch(GameState.Tutorial, GameState.StoryChapter, GameState.GameMode)
    )
end

return u32