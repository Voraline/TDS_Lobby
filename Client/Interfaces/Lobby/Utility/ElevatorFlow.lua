-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Utility.ElevatorFlow
-- Decompile time: 0.24 ms

return {
    getSetupStep = function(a1, a2, a3, a4) -- Line: 7 -- types: a1: boolean, a2: boolean, a3: boolean, a4: boolean
        if a2 then
            return "controls"
        end
        if not a1 then
            return "waiting"
        end
        if a3 and a4 then
            return "story"
        end
        return "partySize"
    end,
}