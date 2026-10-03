-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.AdidasEventConfig
-- Decompile time: 0.35 ms

local u0 = {
    PromptSeenFlag = "AdidasEventPromptSeen",
    CompletionBadgeIds = {
        2738733646415102,
        1688639168144603,
        2.47083243448498e+15,
        1.04611282015506e+15,
        4145342019657586,
        551823813875402,
    },
}

function u0.hasCompleted(a1) -- Line: 14 -- upvalues: u0 (val) -- types: a1: table?
    if not a1 then
        return false
    end
    for i, j in u0.CompletionBadgeIds do
        if not a1[j] then
            return false
        end
    end
    return true
end

return u0