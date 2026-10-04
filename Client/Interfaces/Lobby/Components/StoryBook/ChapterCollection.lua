-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.StoryBook.ChapterCollection
-- Decompile time: 0.74 ms

return {
    getSortedNumericKeys = function(a1) -- Line: 5 -- types: a1: table
        local v1 = {}
        for i in a1 do
            table.insert(v1, i)
        end
        table.sort(v1)
        return v1
    end,
    count = function(a1) -- Line: 14 -- types: a1: table
        local v1 = 0
        for i in a1 do
            v1 = v1 + 1
        end
        return v1
    end,
}