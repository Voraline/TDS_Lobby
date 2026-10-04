-- Script path: ReplicatedStorage.Content.Gamemodes.StoryMode.Chapters.Chapter1.Mission2
-- Decompile time: 0.16 ms

return function(a1) -- Line: 1 -- types: a1: userdata?
    return {
        Title = "Radio Silence",
        Map = "Forest Camp",
        StartsAt = a1 or nil,
        SuggestedTowers = {"Soldier"},
        StarThresholds = {[3] = {Time = 300, Health = 0.75}, [2] = {Time = 420, Health = 0.5}},
    }
end