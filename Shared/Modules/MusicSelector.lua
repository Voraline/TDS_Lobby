-- Script path: ReplicatedStorage.Shared.Modules.MusicSelector
-- Decompile time: 0.34 ms

return {
    pickMusic = function(a1, a2) -- Line: 3 -- types: a1: table, a2: string
        if type(a1) == "table" and type(a2) == "string" then
            local v1 = a1[a2]
            if not v1 then
                error((("No music choices found for type: %*"):format(a2)))
                return
            end
            local v2 = math.random(1, #v1)
            local v3 = v1[v2]
            table.remove(v1, v2)
            return v3
        end
        error("Invalid arguments: musicList must be a table and musicType must be a string")
    end,
}