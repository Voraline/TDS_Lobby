-- Script path: ReplicatedStorage.Content.Gamemodes.StoryMode.Chapters.Chapter0
-- Decompile time: 0.14 ms

return {
    Image = 16494074891,
    MaxPlayers = 1,
    Title = "TDS: Boot Camp",
    Description = "Train under Commander, master your first towers, and survive the day boot camp becomes a battlefield.",
    Missions = {
        require(script.Mission1),
        require(script.Mission2),
        require(script.Mission3),
        (require(script.Mission4)),
    },
    Cutscenes = {
        {
            Title = "Welcome Recruit",
            Image = 127998628320707,
            AfterMission = 0,
            CutsceneName = "StoryModeTutorialIntro",
            TutorialIntro = true,
        },
    },
}