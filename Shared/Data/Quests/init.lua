-- Script path: ReplicatedStorage.Shared.Data.Quests
-- Decompile time: 11.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.QuestTypes)
local Tome = require(ReplicatedStorage.Shared.Tome)
local Groups = require(script.Groups)
local u18 = {Groups = Groups}

local function hasListValue(a1, a2) -- Line: 45
    if a2 ~= nil and typeof(a1) == "table" then
        if a1[a2] ~= nil then
            return true
        end
        return table.find(a1, a2) ~= nil
    end
    return false
end

local function ownsSkin(a1, a2, a3) -- Line: 57 -- types: a1: table?, a2: string?, a3: string?
    if a1 and a2 and a3 then
        local Skins = a1.Skins
        if typeof(Skins) ~= "table" then
            return false
        end
        local v1 = Skins[a2] or {}
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            if (if typeof(j) ~= "table" then j else j.Name) == v4 then
                return true
            end
        end
        return false
    end
    return false
end

function u18.isOwnedReward(a1, a2) -- Line: 77 -- upvalues: ownsSkin (val) -- types: a2: table?
    if not a2 then
        return false
    end
    local type = a1.type
    if type == "tower" then
        if a1.skin then
            return (ownsSkin(a2, a1.tower, a1.skin))
        end
        local Troops = a2.Troops
        local v1 = false
        if typeof(Troops) == "table" then
            v1 = Troops[a1.tower] ~= nil
        end
        return v1
    end
    if type == "nametag" then
        local Nametags = a2.Nametags
        local tag = a1.tag or a1.name
        if tag ~= nil and typeof(Nametags) == "table" then
            if Nametags[tag] ~= nil then
                return true
            end
            return table.find(Nametags, tag) ~= nil
        end
        return false
    end
    if type == "emote" then
        local Emotes = a2.Emotes
        local emote = a1.emote or a1.name
        if emote ~= nil and typeof(Emotes) == "table" then
            if Emotes[emote] ~= nil then
                return true
            end
            return table.find(Emotes, emote) ~= nil
        end
        return false
    end
    if type == "sticker" then
        local Stickers = a2.Stickers
        local sticker = a1.sticker or a1.name
        if sticker ~= nil and typeof(Stickers) == "table" then
            if Stickers[sticker] ~= nil then
                return true
            end
            return table.find(Stickers, sticker) ~= nil
        end
        return false
    end
    if type ~= "flair" then
        return false
    end
    local Flairs = a2.Flairs
    local flair = a1.flair or a1.name
    if flair ~= nil and typeof(Flairs) == "table" then
        if Flairs[flair] ~= nil then
            return true
        end
        return table.find(Flairs, flair) ~= nil
    end
    return false
end

function u18.hasOwnedMissionReward(a1, a2) -- Line: 104 -- upvalues: u18 (val) -- types: a2: table?
    local v1 = false
    for i, j in a1.tome.rewards do
        if j.type == "tower" then
            v1 = true
            if u18.isOwnedReward(j, a2) then
                return true
            end
        end
    end
    if v1 then
        return false
    end
    for k, n in a1.tome.rewards do
        if u18.isOwnedReward(n, a2) then
            return true
        end
    end
    return false
end

function u18.createData() -- Line: 131
    return {groups = {}, completed = {}, migrations = {}, trackedQuestIds = {}}
end

function u18.getTrackedQuestIdSet(a1) -- Line: 141
    local trackedQuestIds = a1.trackedQuestIds
    if not trackedQuestIds then
        a1.trackedQuestIds = {}
    end
    if a1.trackedQuestId then
        trackedQuestIds[a1.trackedQuestId] = true
    end
    return trackedQuestIds
end

function u18.syncPrimaryTrackedQuestId(a1) -- Line: 155
    local trackedQuestIds = a1.trackedQuestIds
    if not trackedQuestIds then
        trackedQuestIds = {}
        a1.trackedQuestIds = trackedQuestIds
        if a1.trackedQuestId then
            trackedQuestIds[a1.trackedQuestId] = true
        end
    end
    a1.trackedQuestId = nil
    for i, j in trackedQuestIds do
        if j then
            a1.trackedQuestId = i
            break
        end
    end
    return a1.trackedQuestId
end

function u18.untrackQuest(a1, a2) -- Line: 177 -- upvalues: u18 (val) -- types: a2: string
    local v1 = u18.getTrackedQuestIdSet(a1)
    if not v1[a2] then
        return false
    end
    v1[a2] = nil
    u18.syncPrimaryTrackedQuestId(a1)
    return true
end

function u18.createGroup(a1) -- Line: 189 -- upvalues: Groups (val) -- types: a1: string
    local v1 = Groups[a1] or {}
    return {
        quests = {},
        claimToStart = v1.claimToStart,
        maxClaimableQuests = v1.maxClaimableQuests,
        currentOrder = if not v1.groupOnly then nil else 1,
        groupOnly = v1.groupOnly,
    }
end

function u18.buildTome(a1, a2) -- Line: 201 -- upvalues: Tome (val) -- types: a2: table?
    local v1 = if typeof(a1) ~= "table" then Tome.clone(a1) else if typeof(a1.build) ~= "function" then Tome.clone(a1) else a1.build()
    if a2 then
        local id = a2.id or v1.id
        v1.id = id
        local category = a2.category or v1.category
        v1.category = category
    end
    return v1
end

function u18.createRecord(a1, a2) -- Line: 214 -- upvalues: u18 (val), Tome (val) -- types: a2: table?
    local v1 = a2 or {}
    local v2 = u18.buildTome(a1, {id = v1.id, category = v1.category})
    local metadata = v2.metadata or {}
    local v3 = v1.started == true
    local state = v1.state or (if not v3 then "AVAILABLE" else "IN_PROGRESS")
    local v4 = {}
    local id = v1.id or v2.id
    v4.id = id
    v4.tome = v2
    v4.progress = Tome.createProgress(v2, state)
    v4.started = v3
    v4.expires = v1.expires
    v4.order = v1.order
    v4.source = v1.source
    local price = v1.price or v2.cost and v2.cost.amount
    v4.price = price
    local currency = v1.currency or v2.cost and v2.cost.currency
    v4.currency = currency
    local productId = v1.productId or metadata.productId
    v4.productId = productId
    local expirationPolicy = v1.expirationPolicy or metadata.expirationPolicy or (if not v1.expires then nil else "REMOVE")
    v4.expirationPolicy = expirationPolicy
    v4.metadata = v1.metadata
    return v4
end

function u18.isTimestampExpired(a1) -- Line: 243 -- types: a1: number?
    if a1 then
        return a1 < workspace:GetServerTimeNow()
    end
    return false
end

function u18.isGroupExpired(a1, a2) -- Line: 247 -- upvalues: Groups (val), u18 (val) -- types: a2: string
    local v1 = Groups[a2]
    if v1 and v1.disabled then
        return true
    end
    return u18.isTimestampExpired(a1.expires)
end

function u18.countStarted(a1) -- Line: 256
    local v1 = 0
    for i, j in a1.quests do
        if j.started and j.progress.state ~= "COMPLETED" then
            v1 = v1 + 1
        end
    end
    return v1
end

function u18.canStartQuest(a1) -- Line: 267 -- upvalues: u18 (val)
    if not a1.claimToStart then
        return true
    end
    local v1 = 0
    for i in a1.quests do
        v1 = v1 + 1
    end
    local v2 = u18.countStarted(a1)
    local maxClaimableQuests = a1.maxClaimableQuests or v1 + 1
    return v2 < maxClaimableQuests
end

function u18.hydrateRecord(a1) -- Line: 280 -- upvalues: Tome (val)
    local v1 = {id = a1.id}
    local category = a1.tome.category or a1.source or "quests"
    v1.group = category
    v1.quest = Tome.fromProgress(a1.tome, a1.progress)
    v1.started = a1.started
    v1.expires = a1.expires
    v1.order = a1.order
    v1.source = a1.source
    v1.price = a1.price
    v1.currency = a1.currency
    v1.productId = a1.productId
    v1.expirationPolicy = a1.expirationPolicy
    return v1
end

function u18.toClientState(a1, a2) -- Line: 296 -- upvalues: u18 (val) -- types: a2: table?
    local v1 = {}
    local v2 = u18.getTrackedQuestIdSet(a1)
    local v3 = {}
    local groups = a1.groups
    local v4 = nil
    local v5 = nil
    local v6, v7 = a1, a2
    for i, j in groups, v4, v5 do
        v1[i] = {}
        for k, n in j.quests do
            table.insert(v1[i], (u18.hydrateRecord(n)))
            if v2[n.id] then
                table.insert(v3, n.id)
            end
        end
        table.sort(v1[i], function(a1, a2) -- Line: 314
            return (a1.order or 0) < (a2.order or 0)
        end)
    end
    table.sort(v3)
    v6.trackedQuestId = v3[1]
    if v7 then
        for m, i5 in v7 do
            table.insert({}, (u18.hydrateRecord(i5)))
        end
    end
    return {
        groups = v1,
        availableMissions = nil,
        trackedQuestIds = v3,
        trackedQuestId = v6.trackedQuestId,
    }
end

function u18.getGroupByQuestId(a1, a2) -- Line: 338 -- types: a1: table, a2: string
    for i, j in a1 do
        if j.quests[a2] then
            return j, i
        end
    end
    return nil
end

function u18.getRecordById(a1, a2) -- Line: 351 -- upvalues: u18 (val) -- types: a2: string
    local v1, v2 = u18.getGroupByQuestId(a1.groups, a2)
    if not v1 then
        return nil
    end
    return v1.quests[a2], v1, v2
end

function u18.isRecordComplete(a1) -- Line: 363 -- upvalues: Tome (val)
    local v1 = true
    if a1.progress.state ~= "COMPLETED" then
        v1 = Tome.isCompleted(a1.tome, a1.progress)
    end
    return v1
end

function u18.getRelevantEvents(a1) -- Line: 367 -- upvalues: u18 (val), Tome (val) -- types: a1: table
    local v1 = {}
    local v2 = nil
    local v3 = nil
    for i, j in a1, v2, v3 do
        if j.started and not u18.isRecordComplete(j) then
            for k, n in j.tome.objectives do
                if not Tome.isObjectiveCompleted(j.progress, n) then
                    v1[n.type] = true
                end
            end
        end
    end
    return v1
end

function u18.getRecordsByRewardType(a1, a2) -- Line: 385 -- types: a1: table, a2: string
    local v1, v2
    local v3 = {}
    local v4 = nil
    local v5 = nil
    for i, j in a1, v4, v5 do
        v2 = nil
        v1 = nil
        for k, n in j.quests, v2, v1 do
            for m, i5 in n.tome.rewards do
                if i5.type == a2 then
                    v3[k] = n
                    break
                end
            end
        end
    end
    return v3
end

function u18.retireGeneratedRecords(a1, a2, a3) -- Line: 405 -- upvalues: u18 (val) -- types: a1: string, a3: function
    if a1 ~= "daily" and a1 ~= "weekly" then
        return false
    end
    local v1 = false
    for i, j in a2.quests do
        if j.source and string.match(j.source, "^generated:") and not a3(j) and not u18.isRecordComplete(j) then
            a2.quests[i] = nil
            v1 = true
        end
    end
    if v1 then
        a2.generated = false
    end
    return v1
end

function u18.markRecordCompleted(a1) -- Line: 436 -- upvalues: Tome (val)
    local v1 = table.clone(a1)
    local v2 = Tome.createProgress(a1.tome, "COMPLETED")
    for i, j in a1.tome.objectives do
        v2.objectives[j.id] = j.amount
    end
    v1.progress = v2
    v1.started = true
    return v1
end

return u18