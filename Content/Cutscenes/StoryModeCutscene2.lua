-- Script path: ReplicatedStorage.Content.Cutscenes.StoryModeCutscene2
-- Decompile time: 0.57 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CutsceneConfig = require(ReplicatedStorage.Shared.Data.CutsceneConfig)
return {
    Name = "CUTSCENE2BRIDGE",
    PackageId = 134689647599998,
    MusicId = "rbxassetid://132708153063508",
    AspectRatio = 2.3333333333333335,
    Subtitles = {
        {
            delay = 3.9,
            text = "We need to go, NOW!",
            lifetime = 1.54,
            speaker = CutsceneConfig.Speaker.Hops,
        },
        {
            delay = 8.08,
            text = "The charge is stuck! I need a few more seconds...",
            lifetime = 2.68,
            speaker = CutsceneConfig.Speaker.Demoman,
        },
        {
            text = "Just go! I'm right behind you!",
            lifetime = 2.12,
            speaker = CutsceneConfig.Speaker.Demoman,
        },
        {
            delay = 2.67,
            text = "I'M NOT LEAVING YOU BEHIND!",
            lifetime = 1.82,
            speaker = CutsceneConfig.Speaker.Hops,
        },
        {
            delay = 7.34,
            text = "MOVE! GET TO THE TUNNELS!",
            lifetime = 1.83,
            speaker = CutsceneConfig.Speaker.Commander,
        },
        {
            text = "HEY, WE'RE LEAVING!!!",
            lifetime = 1.51,
            speaker = CutsceneConfig.Speaker.Commander,
        },
        {
            delay = 0.16,
            text = "You think setting a bomb is EASY?!?",
            lifetime = 1.88,
            speaker = CutsceneConfig.Speaker.Demoman,
        },
        {text = "DEMO!", lifetime = 0.8, speaker = CutsceneConfig.Speaker.Hops},
        {text = "Almost...", lifetime = 1.31, speaker = CutsceneConfig.Speaker.Demoman},
        {
            delay = 0.53,
            text = "Oh NO!",
            lifetime = 1.22,
            speaker = CutsceneConfig.Speaker.Demoman,
        },
        {
            delay = 0.58,
            text = "RUN!",
            lifetime = 0.84,
            speaker = CutsceneConfig.Speaker.Demoman,
        },
        {
            delay = 8.49,
            text = "NOOO!",
            lifetime = 2.06,
            speaker = CutsceneConfig.Speaker.Soldier,
        },
    },
}