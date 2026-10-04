-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.MatchmakingTrialData
-- Decompile time: 4.48 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local NewMaps = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.NewMaps)
require(script.Parent.MatchmakingModel)
local Rotator = require(ReplicatedStorage.Shared.Modules.Rotator)
local Trials = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Trials)
local Trials_2 = Content("Trials")
local v1 = {}
for i, j in Trials_2:GetChildren() do
    if Trials(j.Name).trial then
        table.insert(v1, j.Name)
    end
end
local u61 = Rotator.makeRotator(v1, 915190147, 10800)
local u62 = {}

function u62.formatSecondsLeft(a1) -- Line: 38 -- types: a1: number
    local v1 = math.max(0, (math.floor(a1)))
    return string.format("%02d:%02d:%02d", math.floor(v1 / 3600), math.floor(v1 % 3600 / 60), v1 % 60)
end

function u62.getRotationEndsAt(a1) -- Line: 47 -- types: a1: number
    return (math.floor(a1 / 10800) + 1) * 10800
end

function u62.getCurrentRotation(a1) -- Line: 52 -- upvalues: u61 (val) -- types: a1: number
    local v1, v2
    v1, _, v2 = u61(a1)
    return {expiresAt = v2, trialName = v1}
end

function u62.resolve(a1) -- Line: 60
    -- upvalues: Trials_2 (val), Trials (val), NewMaps (val), Enum (val)
    if not Trials_2:FindFirstChild(a1.trialName) then
        return nil
    end
    local v1 = Trials(a1.trialName)
    local mapName = a1.mapName or v1.trialMap
    if not mapName then
        return nil
    end
    local v2 = NewMaps(mapName, Enum.Gamemode.Survival)
    if v2 and v2.ImageID then
        local v3 = {
            id = "trial",
            maxPlayers = 4,
            queueName = "Trials",
            tag = "Trial",
            artworkDescriptor = {type = "Modifier", gridTexture = 80830170555292, icon = v1.icon},
            image = v2.ImageID,
            locked = a1.locked or false,
            lockReason = a1.lockReason,
            mapName = mapName,
            queue = {mode = "Trials", requirements = {maxPartySize = 4, minLevel = 40}},
        }
        local description = v1.description or v2.DisplayName or mapName
        v3.subtitle = description
        v3.timerEndsAt = a1.expiresAt
        local title = v1.title or a1.trialName
        v3.title = title
        v3.trialName = a1.trialName
        return v3
    end
    return nil
end

function u62.getTrialNames() -- Line: 104 -- upvalues: Trials_2 (val), Trials (val)
    local v1 = {}
    for i, j in Trials_2:GetChildren() do
        if Trials(j.Name).trial then
            table.insert(v1, j.Name)
        end
    end
    table.sort(v1)
    return v1
end

function u62.getTrialMapNames() -- Line: 118 -- upvalues: u62 (val), Trials (val)
    local v1
    local v2 = {}
    for i, j in u62.getTrialNames() do
        v1 = Trials(j)
        if v1.trialMap and not table.find(v2, v1.trialMap) then
            table.insert(v2, v1.trialMap)
        end
    end
    table.sort(v2)
    return v2
end

return u62