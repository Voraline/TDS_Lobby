-- Script path: ReplicatedStorage.Shared.Data.Quests.MissionAdapter
-- Decompile time: 0.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.QuestTypes)
local Quests = require(ReplicatedStorage.Shared.Data.Quests)
require(ReplicatedStorage.Shared.Tome)
local v1 = {}

local function getQuest(a1) -- Line: 19
    return a1._quest or a1
end

local function getMetadata(a1) -- Line: 23
    return (a1._quest or a1).metadata or {}
end

function v1.build(a1, a2) -- Line: 27 -- upvalues: Quests (val) -- types: a2: table?
    return Quests.buildTome(a1, {category = "missions", id = a2 and a2.id})
end

function v1.toRecord(a1, a2) -- Line: 34 -- upvalues: Quests (val) -- types: a2: table?
    local v1 = a2 or {}
    return Quests.createRecord(a1, {
        category = "missions",
        id = v1.id,
        expires = v1.expires,
        expirationPolicy = v1.expirationPolicy,
        started = v1.started,
        source = v1.source,
    })
end

function v1.isDisabled(a1) -- Line: 50
    local metadata = (a1._quest or a1).metadata or {}
    return metadata.disabled == true
end

function v1.isPermanent(a1) -- Line: 54
    local metadata = (a1._quest or a1).metadata or {}
    return metadata.permanent == true
end

function v1.getName(a1) -- Line: 58
    return (a1._quest or a1).name
end

function v1.getRewards(a1) -- Line: 62
    return (a1._quest or a1).rewards
end

return v1