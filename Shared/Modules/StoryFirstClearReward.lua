-- Script path: ReplicatedStorage.Shared.Modules.StoryFirstClearReward
-- Decompile time: 0.52 ms

local u0 = {}

function u0.isFirstClear(a1, a2, a3) -- Line: 5 -- types: a1: table?, a2: number, a3: number
    if typeof(a1) ~= "table" then
        return false
    end
    local StoryMode = a1.StoryMode
    if typeof(StoryMode) ~= "table" then
        return true
    end
    local Chapters = StoryMode.Chapters
    if typeof(Chapters) ~= "table" then
        return true
    end
    local v1 = Chapters[a2]
    if typeof(v1) ~= "table" then
        return true
    end
    local Missions = v1.Missions
    if typeof(Missions) ~= "table" then
        return true
    end
    return Missions[a3] == nil
end

function u0.getAmount(a1, a2, a3, a4, a5) -- Line: 37
    -- upvalues: u0 (val)
    if a4 and u0.isFirstClear(a1, a2, a3) then
        return a5
    end
    return 0
end

return u0