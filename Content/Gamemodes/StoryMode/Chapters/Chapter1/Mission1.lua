-- Script path: ReplicatedStorage.Content.Gamemodes.StoryMode.Chapters.Chapter1.Mission1
-- Decompile time: 0.18 ms

return function(a1) -- Line: 1 -- types: a1: userdata?
    return {
        Title = "Ghost Town",
        Map = "Abandoned City_SM",
        StartsAt = a1 or nil,
        SuggestedTowers = {"Demoman"},
        StarThresholds = {[3] = {Time = 300, Health = 0.75}, [2] = {Time = 420, Health = 0.5}},
    }
end