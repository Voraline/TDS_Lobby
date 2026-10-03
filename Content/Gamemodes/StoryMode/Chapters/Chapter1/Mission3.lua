-- Script path: ReplicatedStorage.Content.Gamemodes.StoryMode.Chapters.Chapter1.Mission3
-- Decompile time: 0.17 ms

return function(a1) -- Line: 1 -- types: a1: userdata?
    return {
        Title = "Off The Rails",
        Map = "U-Turn",
        StartsAt = a1 or nil,
        SuggestedTowers = {"Soldier"},
        StarThresholds = {[3] = {Time = 360, Health = 0.75}, [2] = {Time = 450, Health = 0.5}},
    }
end