-- Script path: ReplicatedStorage.Shared.Data.Quests.ClientAdapter
-- Decompile time: 5.02 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.QuestTypes)
require(ReplicatedStorage.Shared.Tome)
local u14 = {}

local function getObjectiveSortOrder(a1, a2) -- Line: 52 -- types: a2: number
    return a1.order or a2
end

function u14.getObjectives(a1) -- Line: 56
    local v1 = {}
    for i, j in a1.quest.objectives do
        v1[i] = {index = i, objective = j}
    end
    table.sort(v1, function(a1, a2) -- Line: 65
        local objective = a1.objective
        local index = a1.index
        local v1 = objective.order or index
        local objective_2 = a2.objective
        local index_2 = a2.index
        local v2 = objective_2.order or index_2
        if v1 == v2 then
            return a1.index < a2.index
        end
        return v1 < v2
    end)
    local v2 = {}
    for k, n in v1 do
        v2[k] = n.objective
    end
    return v2
end

function u14.getTrackedQuestIdSet(a1) -- Line: 83
    local v1 = {}
    local trackedQuestIds = a1 and a1.trackedQuestIds
    if trackedQuestIds then
        for i, j in trackedQuestIds do
            if type(j) == "string" then
                v1[j] = true
            elseif type(i) == "string" and j == true then
                v1[i] = true
            end
        end
    end
    local trackedQuestId = a1 and a1.trackedQuestId
    if trackedQuestId then
        v1[trackedQuestId] = true
    end
    return v1
end

function u14.isTracked(a1, a2) -- Line: 107 -- upvalues: u14 (val)
    local v1 = u14.getTrackedQuestIdSet(a2)
    local v2 = true
    if v1[a1.id] ~= true then
        v2 = v1[a1.quest.id] == true
    end
    return v2
end

function u14.getGroup(a1, a2) -- Line: 116 -- types: a2: string
    if a1 and a1.groups then
        return a1.groups[a2] or {}
    end
    return {}
end

function u14.getAvailableMissions(a1) -- Line: 124
    if a1 and a1.availableMissions then
        return a1.availableMissions
    end
    return {}
end

function u14.getMissionRecords(a1) -- Line: 132 -- upvalues: u14 (val)
    return u14.getGroup(a1, "missions")
end

function u14.isComplete(a1) -- Line: 136
    if a1.quest.state == "COMPLETED" then
        return true
    end
    for i, j in a1.quest.objectives do
        if j.requirement ~= "OPTIONAL" and j.current < j.amount then
            return false
        end
    end
    return true
end

function u14.areRewardsClaimed(a1) -- Line: 150
    for i, j in a1.quest.rewards do
        if j.claimed ~= true then
            return false
        end
    end
    return true
end

function u14.isClaimable(a1) -- Line: 160 -- upvalues: u14 (val)
    local started = a1.started
    if started then
        started = u14.isComplete(a1)
        if started then
            started = false
            if #a1.quest.rewards > 0 then
                started = not u14.areRewardsClaimed(a1)
            end
        end
    end
    return started
end

function u14.getProgress(a1) -- Line: 167 -- upvalues: u14 (val)
    local v1, v2
    local v3 = u14.getObjectives(a1)
    local v4 = 0
    local v5 = 0
    local v6 = 0
    local v7 = v3[1]
    local v8 = 1
    local v9 = false
    local v10 = nil
    local v11 = nil
    for i, j in v3, v10, v11 do
        v2 = math.min(j.current, j.amount)
        v4 = v4 + v2
        v5 = v5 + j.amount
        if j.amount <= v2 then
            v6 = v6 + 1
        end
        if j.current < j.amount and not v9 then
            v7 = j
            v8 = i
        end
    end
    if #v3 == 0 then
        v5 = 1
    end
    local v12 = if not (#v3 > 1) then v4 else v6
    v10 = if not (#v3 > 1) then v5 else #v3
    local current = v7 and v7.current or v4
    local amount = v7 and v7.amount or v5
    local description = if not (#v3 > 1) then if not v7 then v1.quest.description else if not v7.description then v1.quest.description else v7.description else ("%* / %* objectives complete"):format(v12, v10)
    local v13 = {
        current = current,
        amount = amount,
        totalCurrent = v12,
        totalAmount = v10,
        progress = math.clamp(if not (v5 > 0) then 0 else v4 / v5, 0, 1),
    }
    local description_2 = if not v7 then v1.quest.description else if not v7.description then v1.quest.description else v7.description
    v13.description = description_2
    v13.summaryDescription = description
    v13.summaryProgress = math.clamp(if not (v10 > 0) then 0 else v12 / v10, 0, 1)
    v13.currentObjectiveIndex = v8
    v13.totalObjectives = math.max(#v3, 1)
    return v13
end

function u14.getQuestAction(a1, a2) -- Line: 224 -- upvalues: u14 (val) -- types: a2: table
    if u14.isClaimable(a1) then
        return {kind = "claim", label = "CLAIM"}
    end
    if u14.isComplete(a1) then
        return nil
    end
    if a2.isAvailableMission then
        if 0 < (a1.price or 0) then
            return {kind = "purchaseMission", label = "PURCHASE", questId = a1.id}
        end
        return {kind = "startMission", label = "START"}
    end
    if a2.groupName ~= "missions" then
        if u14.isTracked(a1, a2) then
            return {kind = "untrack", label = "UNTRACK"}
        end
        return {kind = "track", label = "TRACK"}
    end
    if a1.started and not u14.isComplete(a1) then
        return {kind = "cancelMission", label = "CANCEL"}
    end
    if not a1.started then
        return {kind = "startMission", label = "START"}
    end
    return nil
end

function u14.getMissionLockText(a1) -- Line: 285
    if a1.locked ~= true then
        return nil
    end
    if a1.lockReason == "MISSING_TOWER" then
        for i, j in a1.quest.rewards do
            if j.type == "tower" and j.skin and j.tower then
                return (("Own %* to unlock"):format(j.tower))
            end
        end
    end
    return "Mission requirements not met"
end

function u14.findRecordById(a1, a2) -- Line: 301 -- types: a2: string?
    if a1 and a2 then
        local v1 = nil
        local v2 = nil
        local v3 = a1
        for i, j in a1.groups, v1, v2 do
            for k, n in j do
                if n.id ~= v4 and n.quest.id ~= v4 then
                    continue
                end
                return n
            end
        end
        if v3.availableMissions then
            for m, i5 in v3.availableMissions do
                if i5.id ~= v4 and i5.quest.id ~= v4 then
                    continue
                end
                return i5
            end
        end
        return nil
    end
    return nil
end

return u14