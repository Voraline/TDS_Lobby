-- Script path: ReplicatedStorage.Content.Cutscenes.StoryModeCutscene1
-- Decompile time: 0.79 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CutsceneConfig = require(ReplicatedStorage.Shared.Data.CutsceneConfig)
return {
    Name = "CUTSCENE1ABANDONEDTOWN",
    PackageId = 132594781843093,
    MusicId = "rbxassetid://139140537348412",
    AspectRatio = 2.3333333333333335,
    Subtitles = {
        {
            delay = 7.04,
            text = "Your mission is to find the survivors and bring them back to base.",
            lifetime = 3.46,
            speaker = CutsceneConfig.Speaker.Dispatcher,
        },
        {
            text = "Eliminate the zombies as needed. You don't wanna attract anything you can't handle.",
            lifetime = 4,
            speaker = CutsceneConfig.Speaker.Dispatcher,
        },
        {
            delay = 2.5,
            text = "This town held out 6 months longer than anyone expected.",
            lifetime = 3.69,
            speaker = CutsceneConfig.Speaker.Commander,
        },
        {
            text = "There were only a few hundred ramaining survivors after the evacuation. All of them said the same thing.",
            lifetime = 4.63,
            speaker = CutsceneConfig.Speaker.Commander,
        },
        {
            text = "They'd rather take their chances out here, instead of heading to the city",
            lifetime = 3.28,
            speaker = CutsceneConfig.Speaker.Commander,
        },
        {
            delay = 0.73,
            text = "Who could blame them? The cities aren't exactly paradise.",
            lifetime = 3.42,
            speaker = CutsceneConfig.Speaker.Sniper,
        },
        {
            text = "They're crowded and every day you're fighting for work just to survive",
            lifetime = 3.74,
            speaker = CutsceneConfig.Speaker.Sniper,
        },
        {
            text = "The way I see it. These guys just chose a different kind of survival.",
            lifetime = 3.51,
            speaker = CutsceneConfig.Speaker.Sniper,
        },
        {
            delay = 6.93,
            text = "We've attracted the horde, they need to be cleared before moving foward.",
            lifetime = 3.29,
            speaker = CutsceneConfig.Speaker.TruckDriver,
        },
        {
            delay = 4.07,
            text = "Everybody, gear up. Secure the area and search for survivors.",
            lifetime = 4.12,
            speaker = CutsceneConfig.Speaker.Commander,
        },
        {
            delay = 0.19,
            text = "Cmon recruit, let's see what you've got.",
            lifetime = 2.08,
            speaker = CutsceneConfig.Speaker.Commander,
        },
        {
            delay = 2.77,
            text = "Over there!",
            lifetime = 0.99,
            speaker = CutsceneConfig.Speaker.Commander,
        },
        {
            delay = 1.98,
            text = "FIRE!!!",
            lifetime = 1.51,
            speaker = CutsceneConfig.Speaker.Commander,
        },
    },
}