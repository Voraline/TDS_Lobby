-- Script path: ReplicatedStorage.Shared.Data.LobbyNPCs.TestFlow
-- Decompile time: 0.31 ms

local Dialogues = script.Dialogues
return {
    Id = "Commander",
    PromptAction = "Talk",
    PromptObject = "Commander",
    BlipSpeaker = "commander",
    IsWatchingPlayer = true,
    LookBones = {Head = {damper = 0.7, speed = 8, weight = 1, axisMask = Vector3.new(1, 1, 0)}},
    Dialogues = {
        {
            AfterMission = {Chapter = 1, Mission = 2},
            Dialog = require(Dialogues.AfterChapter1Mission2),
        },
        {
            AfterMission = {Chapter = 1, Mission = 1},
            Dialog = require(Dialogues.AfterChapter1Mission1),
        },
        {Dialog = require(Dialogues.Default)},
    },
}