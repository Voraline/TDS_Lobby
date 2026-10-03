-- Script path: ReplicatedStorage.Content.Cutscenes.StoryModeTutorialIntro
-- Decompile time: 0.83 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CutsceneConfig = require(ReplicatedStorage.Shared.Data.CutsceneConfig)
return {
    Name = "CUTSCENEINTRODUCTION2",
    PackageId = 128562819551787,
    MusicId = "rbxassetid://92949655287692",
    AspectRatio = 2.3333333333333335,
    Skippable = false,
    WorldOffset = Vector3.new(0, 1024, 0),
    Subtitles = {
        {
            delay = 4.600449,
            text = "Hey, you.",
            lifetime = 1.870304,
            speaker = CutsceneConfig.Speaker.Commander,
        },
        {
            text = "You're finally awake.",
            lifetime = 2.363796,
            speaker = CutsceneConfig.Speaker.Commander,
        },
        {
            delay = 1.500694,
            text = "As you already know...",
            lifetime = 1.157678,
            speaker = CutsceneConfig.Speaker.Commander,
        },
        {
            text = "There aren't many places left under our control.",
            lifetime = 2.894196,
            speaker = CutsceneConfig.Speaker.Commander,
        },
        {
            text = "Everything you see in red are where the zombie infestation had taken over.",
            lifetime = 3.891084,
            speaker = CutsceneConfig.Speaker.Commander,
        },
        {
            text = "Only a few major cities, and industrial zone remain. That's it.",
            lifetime = 4.137628,
            speaker = CutsceneConfig.Speaker.Commander,
        },
        {
            text = "Your job, is to think stragetically, and guide our team to success.",
            lifetime = 4.705747,
            speaker = CutsceneConfig.Speaker.Commander,
        },
        {
            text = "T.D.S. is the foundation of our society's defense system",
            lifetime = 3.794611,
            speaker = CutsceneConfig.Speaker.Commander,
        },
        {
            text = "We are the only thing standing between survival and extinction.",
            lifetime = 4.204019,
            speaker = CutsceneConfig.Speaker.Commander,
        },
        {
            text = "Out of every possible candidate, you stood out on top.",
            lifetime = 3.236593,
            speaker = CutsceneConfig.Speaker.Commander,
        },
        {
            text = "From here on out, your team's lives will be in your hands.",
            lifetime = 3.358442,
            speaker = CutsceneConfig.Speaker.Commander,
        },
        {
            text = "Today, you're going on your first mission with them.",
            lifetime = 3.393222,
            speaker = CutsceneConfig.Speaker.Commander,
        },
        {
            text = "Do NOT let the team down.",
            lifetime = 2.358234,
            speaker = CutsceneConfig.Speaker.Commander,
        },
    },
}