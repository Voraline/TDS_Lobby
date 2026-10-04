-- Script path: ReplicatedStorage.Content.Cutscenes.StoryModeCutscene3
-- Decompile time: 0.43 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CutsceneConfig = require(ReplicatedStorage.Shared.Data.CutsceneConfig)
return {
    Name = "NEWCUTSCENE3FRAMING",
    PackageId = 82853917722920,
    MusicId = "rbxassetid://87302598135761",
    AspectRatio = 2.3333333333333335,
    Subtitles = {
        {
            delay = 4.9,
            text = "Devensive positions!",
            lifetime = 1.68,
            speaker = CutsceneConfig.Speaker.Commander,
        },
        {
            text = "Hey, Soldier. I need you here, now!",
            lifetime = 2.72,
            speaker = CutsceneConfig.Speaker.Commander,
        },
        {
            delay = 8.46,
            text = "Ok, raise the platform.",
            lifetime = 2.05,
            speaker = CutsceneConfig.Speaker.Commander,
        },
        {
            text = "Raising it now.",
            lifetime = 0.97,
            speaker = CutsceneConfig.Speaker.ProfessorV,
        },
        {
            delay = 7.23,
            text = "We need to wait for Demo and Hops.",
            lifetime = 1.82,
            speaker = CutsceneConfig.Speaker.Soldier,
        },
        {
            delay = 0.35,
            text = "We can't wait, theres just too many zombies.",
            lifetime = 2.94,
            speaker = CutsceneConfig.Speaker.Commander,
        },
        {
            text = "They'll have to fight their own way out.",
            lifetime = 1.61,
            speaker = CutsceneConfig.Speaker.Commander,
        },
        {
            delay = 0.66,
            text = "I hope you're right.",
            lifetime = 1.28,
            speaker = CutsceneConfig.Speaker.Soldier,
        },
    },
}