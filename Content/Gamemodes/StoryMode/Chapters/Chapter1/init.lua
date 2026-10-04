-- Script path: ReplicatedStorage.Content.Gamemodes.StoryMode.Chapters.Chapter1
-- Decompile time: 0.46 ms

local v1 = DateTime.fromUniversalTime(2026, 8, 7, 16, 0, 0)
return {
    Image = 102445581890397,
    Title = "TDS: Origins",
    Description = "Do we even need this?",
    Missions = {
        require(script.Mission1)(),
        require(script.Mission2)(),
        require(script.Mission3)(),
        require(script.Mission4)(),
        require(script.Mission5)(v1),
        require(script.Mission6)(v1),
        require(script.Mission7)(v1),
        (require(script.Mission8)(v1)),
    },
    Cutscenes = {
        {
            Title = "The Beginning",
            Image = 125722495262868,
            AfterMission = 0,
            BeforeMission = 1,
            UnlockOnMissionStart = true,
            CutsceneName = "StoryModeCutscene1",
        },
        {
            Title = "A Growing Threat",
            Image = 123451400919779,
            AfterMission = 4,
            CutsceneName = "StoryModeCutscene2",
        },
        {
            Title = "The Final Approach",
            Image = 109567720364830,
            AfterMission = 7,
            CutsceneName = "StoryModeCutscene3",
        },
        {
            Title = "Aftermath",
            Image = 79126131154643,
            AfterMission = 8,
            CutsceneName = "StoryModeCutscene4",
        },
    },
}