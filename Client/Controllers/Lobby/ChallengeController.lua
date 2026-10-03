-- Script path: ReplicatedStorage.Client.Controllers.Lobby.ChallengeController
-- Decompile time: 0.97 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ChallengeMapStore = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.ChallengeMapStore)
local v1 = {}
local Rotation = (require(ReplicatedStorage.Shared.Modules.Network)).Channel("Rotation")
local LocalPlayer = Players.LocalPlayer

local function updateChallenge() -- Line: 13 -- upvalues: Rotation (val), ChallengeMapStore (val), LocalPlayer (val)
    local Data = Rotation:InvokeServer("Request", "Challenges").Data
    ChallengeMapStore.setChallenge(Data.name)
    ChallengeMapStore.setMap(Data.map)
    ChallengeMapStore.setTimeExpires(Data.timeExpires)
    ChallengeMapStore.setRewards(Data.rewards)
    ChallengeMapStore.setTimestamp(Data.currentTimestamp)
    ChallengeMapStore.setCompleted(LocalPlayer:WaitForChild("ChallengeTimestamp").Value == Data.lastSundayTimestamp)
end

function v1.init() -- Line: 26 -- upvalues: updateChallenge (val), LocalPlayer (val), ChallengeMapStore (val)
    (workspace:GetAttributeChangedSignal("ChallengeMapCount")):Connect(updateChallenge)
    ;(LocalPlayer:WaitForChild("ChallengeTimestamp")).Changed:Connect(function(a1) -- Line: 29 -- upvalues: ChallengeMapStore (upval)
        ChallengeMapStore.setCompleted(a1 == ChallengeMapStore.getState().currentTimestamp)
    end)
    updateChallenge()
    task.spawn(function() -- Line: 35 -- upvalues: ChallengeMapStore (upval), updateChallenge (upval)
        local timeExpires
        while task.wait() do
            timeExpires = ChallengeMapStore.getState().timeExpires
            if timeExpires and timeExpires < workspace:GetServerTimeNow() then
                updateChallenge()
            end
        end
    end)
end

task.spawn(v1.init)
return v1