-- Script path: ReplicatedStorage.Shared.Modules.StoryMissionAvailability
-- Decompile time: 0.46 ms

local u0 = {LOCK_REASON = "This mission is not available yet."}

function u0.isMissionReleased(a1, a2, a3) -- Line: 19 -- types: a1: table, a2: number, a3: number
    local v1 = a1.Missions[a2]
    if not v1 then
        return false
    end
    local StartsAt = v1.StartsAt
    if StartsAt == nil then
        return true
    end
    if typeof(StartsAt) ~= "DateTime" then
        return false
    end
    return StartsAt.UnixTimestamp <= a3
end

function u0.getMissionLockReason(a1, a2, a3) -- Line: 41
    -- upvalues: u0 (val)
    if u0.isMissionReleased(a1, a2, a3) then
        return nil
    end
    return "This mission is not available yet."
end

return table.freeze(u0)