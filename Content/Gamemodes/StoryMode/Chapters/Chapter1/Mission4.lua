-- Script path: ReplicatedStorage.Content.Gamemodes.StoryMode.Chapters.Chapter1.Mission4
-- Decompile time: 0.19 ms

return function(a1) -- Line: 1 -- types: a1: userdata?
    return {
        Title = "Burning Bridges",
        Map = "Severing Connection",
        StartsAt = a1 or nil,
        SuggestedTowers = {"Demoman"},
        StarThresholds = {[3] = {Time = 450, Health = 0.75}, [2] = {Time = 600, Health = 0.5}},
    }
end