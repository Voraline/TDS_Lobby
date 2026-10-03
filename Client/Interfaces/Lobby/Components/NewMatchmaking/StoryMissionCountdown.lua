-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.StoryMissionCountdown
-- Decompile time: 0.48 ms

return table.freeze({
    formatSecondsLeft = function(a1) -- Line: 7 -- types: a1: number
        local v1 = math.max(0, (math.floor(a1)))
        local v2 = math.floor(v1 / 86400)
        if not (v2 > 0) then
            return string.format("%02d:%02d:%02d", math.floor(v1 / 3600), math.floor(v1 % 3600 / 60), v1 % 60)
        end
        if v2 == 1 then
            return "1 day"
        end
        return (("%* days"):format(v2))
    end,
})