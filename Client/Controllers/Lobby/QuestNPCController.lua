-- Script path: ReplicatedStorage.Client.Controllers.Lobby.QuestNPCController
-- Decompile time: 1.68 ms

local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Cache = require(ReplicatedStorage.Client.Modules.Cache)
local Quill = require(ReplicatedStorage.Packages.Quill)
local StoryModeClient = require(ReplicatedStorage.Client.Modules.StoryModeClient)
local LobbyNPCs = ReplicatedStorage.Shared.Data:WaitForChild("LobbyNPCs")
local StoryMode = Cache("StoryMode")
local u33 = nil
local v1 = {}

local function IsMissionCompleted(a1, a2) -- Line: 21 -- upvalues: u33 (ref) -- types: a1: number, a2: number
    local v1 = u33.Chapters[a1]
    local v2 = false
    if v1 ~= nil then
        v2 = v1.Missions[a2] ~= nil
    end
    return v2
end

local function HookNPC(a1) -- Line: 26 -- upvalues: LobbyNPCs (val), Quill (val), u33 (ref) -- types: a1: userdata
    if not a1:IsA("Model") then
        return
    end
    local v1 = LobbyNPCs:WaitForChild(a1:GetAttribute("NPCDefinition") or a1.Name)
    local u19 = v1
    if u19 then
        u19 = require(v1)
    end
    if not u19 then
        return
    end
    Quill.registerNPC({
        id = u19.Id,
        model = a1,
        dialog = function() -- Line: 45 -- upvalues: u19 (val), u33 (upval)
            local AfterMission, Chapter, Mission, v1, v2
            local v3 = nil
            local v4 = nil
            for i, j in u19.Dialogues, v3, v4 do
                AfterMission = j.AfterMission
                if not AfterMission then
                    return j.Dialog
                end
                Chapter = AfterMission.Chapter
                Mission = AfterMission.Mission
                v2 = u33.Chapters[Chapter]
                v1 = false
                if v2 ~= nil then
                    v1 = v2.Missions[Mission] ~= nil
                end
                if v1 then
                    return j.Dialog
                end
            end
            error((("NPC definition \"%*\" has no fallback dialogue"):format(u19.Id)))
        end,
        lookBones = u19.LookBones,
        isWatchingPlayer = u19.IsWatchingPlayer,
        blipSpeaker = u19.BlipSpeaker,
        promptAction = u19.PromptAction,
        promptObject = u19.PromptObject,
    })
end

function v1.Start(a1) -- Line: 70
    -- upvalues: u33 (ref), StoryModeClient (val), StoryMode (val), CollectionService (val), HookNPC (val)
    u33 = StoryModeClient.getProgress()
    StoryMode:Update(u33)
    StoryMode.Updated:Connect(function(a1) -- Line: 74 -- upvalues: u33 (upval)
        u33 = a1
    end)
    for i, j in CollectionService:GetTagged("QuestNPC") do
        HookNPC(j)
    end
    ;(CollectionService:GetInstanceAddedSignal("QuestNPC")):Connect(HookNPC)
end

v1:Start()
return v1