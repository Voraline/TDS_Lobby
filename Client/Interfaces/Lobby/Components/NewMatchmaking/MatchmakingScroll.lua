-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.MatchmakingScroll
-- Decompile time: 1.71 ms

return {
    isRectVisible = function(a1, a2, a3, a4) -- Line: 3 -- types: a1: userdata, a2: userdata, a3: userdata, a4: userdata
        if not (a2.X <= 0) and not (a2.Y <= 0) and not (a4.X <= 0) and not (a4.Y <= 0) then
            local v1 = a1 + a2
            local v2 = a3 + a4
            local v3 = false
            if a3.X < v1.X then
                v3 = false
                if a1.X < v2.X then
                    v3 = false
                    if a3.Y < v1.Y then
                        v3 = a1.Y < v2.Y
                    end
                end
            end
            return v3
        end
        return false
    end,
    getTargetCanvasY = function(a1, a2, a3, a4, a5, a6) -- Line: 22
        -- upvalues: 
        return (math.clamp(a1 + a3 - a2 - (a6 or 0), 0, (math.max(a4 - a5, 0))))
    end,
    getCenteredTargetCanvasY = function(a1, a2, a3, a4, a5, a6, a7) -- Line: 36
        -- upvalues: 
        local v1 = math.max(a5 - a6, 0)
        local v2 = math.clamp(a7 or 0, 0, a6)
        return (math.clamp(a1 + a3 - a2 + a4 / 2 - (v2 + (a6 - v2) / 2), 0, v1))
    end,
}