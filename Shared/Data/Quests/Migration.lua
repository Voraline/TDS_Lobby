-- Script path: ReplicatedStorage.Shared.Data.Quests.Migration
-- Decompile time: 42.86 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Quests = require(ReplicatedStorage.Shared.Data.Quests)
local Tome = require(ReplicatedStorage.Shared.Tome)
local v1 = {}
local u15 = {
    WeeklyCleanCampaign = true,
    WeeklyEconomyAudit = true,
    WeeklyLoadoutGauntlet = true,
    WeeklySupportOps = true,
}
local u16 = {
    {
        ids = {"mission:Wednesday30"},
        titles = {"Wednesday the 30th"},
        objectives = {
            {
                index = 3,
                id = "fallen_level_4_slashers",
                type = "quest_tower_match_fully_upgraded",
                amount = 1,
                description = "Complete a Fallen match with 8 Level 4 Slasher Towers",
                filter = {
                    difficulty = "Fallen",
                    level = 4,
                    result = "Triumph",
                    tower = "Slasher",
                    towerCount = ">=8",
                },
            },
        },
    },
    {
        ids = {"mission:ColdTyrant"},
        titles = {"A Cold Tyrant"},
        objectives = {
            {
                index = 3,
                id = "level_4_commanders",
                type = "quest_tower_match_fully_upgraded",
                amount = 3,
                description = "Triumph 3 matches with 4 Level 4 Commanders",
                filter = {level = 4, result = "Triumph", tower = "Commander", towerCount = ">=4"},
            },
        },
    },
    {
        ids = {"mission:AbyssalBruiser"},
        titles = {"Abyssal Bruiser"},
        objectives = {
            {
                index = 2,
                id = "frost_brawler_triumphs",
                type = "quest_tower_match_used",
                amount = 3,
                description = "Triumph 3 Frost matches with 10 Brawlers placed down",
                filter = {difficulty = "Frost", result = "Triumph", tower = "Brawler", towerCount = ">=10"},
            },
            {
                index = 4,
                id = "hardcore_brawler",
                type = "quest_tower_match_used",
                amount = 1,
                description = "Triumph Hardcore with Brawler placed down",
                filter = {difficulty = "Easy", mode = "Hardcore", result = "Triumph", tower = "Brawler"},
            },
        },
    },
    {
        ids = {"mission:ChanceOfDrizzle"},
        titles = {"Chance of Drizzle"},
        objectives = {
            {
                index = 3,
                id = "hardcore_unknown_garden_ranger",
                type = "quest_tower_match_used",
                amount = 1,
                description = "Triumph Hardcore on Unknown Garden with Ranger placed down",
                filter = {
                    difficulty = "Easy",
                    map = "Unknown Garden",
                    mode = "Hardcore",
                    result = "Triumph",
                    tower = "Ranger",
                },
            },
        },
    },
    {
        ids = {"mission:TechTactician"},
        titles = {"Tech Tactician"},
        objectives = {
            {
                index = 3,
                id = "hardcore_commander",
                type = "quest_tower_match_used",
                amount = 1,
                description = "Triumph Hardcore with Commander placed down",
                filter = {difficulty = "Easy", mode = "Hardcore", result = "Triumph", tower = "Commander"},
            },
        },
    },
    {
        ids = {"mission:DarkHarvest"},
        titles = {"Dark Harvest"},
        objectives = {
            {
                index = 4,
                id = "hardcore_harvester",
                type = "quest_tower_match_used",
                amount = 1,
                description = "Triumph Hardcore with Harvester placed down",
                filter = {difficulty = "Easy", mode = "Hardcore", result = "Triumph", tower = "Harvester"},
            },
        },
    },
    {
        ids = {"mission:PlsDefenseSimulator"},
        titles = {"Pls Defense Simulator"},
        objectives = {
            {
                index = 3,
                id = "hardcore_farm",
                type = "quest_tower_match_used",
                amount = 1,
                description = "Triumph Hardcore with Farm placed down.",
                filter = {difficulty = "Easy", mode = "Hardcore", result = "Triumph", tower = "Farm"},
            },
        },
    },
    {
        ids = {"mission:ForTheCommander"},
        titles = {"For the Commander!"},
        objectives = {
            {
                index = 5,
                id = "hardcore_militant",
                type = "quest_tower_match_used",
                amount = 1,
                description = "Triumph Hardcore with Militant placed down",
                filter = {difficulty = "Easy", mode = "Hardcore", result = "Triumph", tower = "Militant"},
            },
        },
    },
    {
        ids = {"mission:DarkRadiance"},
        titles = {"Dark Radiance"},
        objectives = {
            {
                index = 4,
                id = "hardcore_accelerator",
                type = "quest_tower_match_used",
                amount = 1,
                description = "Triumph Hardcore with Accelerator placed down",
                filter = {difficulty = "Easy", mode = "Hardcore", result = "Triumph", tower = "Accelerator"},
            },
        },
    },
    {
        ids = {"mission:HazardousHaste"},
        titles = {"Hazardous Haste"},
        objectives = {
            {
                index = 3,
                id = "hardcore_accelerator",
                type = "quest_tower_match_used",
                amount = 1,
                description = "Triumph Hardcore with Accelerator placed down",
                filter = {difficulty = "Easy", mode = "Hardcore", result = "Triumph", tower = "Accelerator"},
            },
        },
    },
    {
        ids = {"mission:Corrupted Touch"},
        titles = {"Corrupted Touch"},
        objectives = {
            {
                index = 5,
                id = "hardcore_hacker",
                type = "quest_tower_match_used",
                amount = 1,
                description = "Triumph Hardcore with Hacker placed down",
                filter = {difficulty = "Easy", mode = "Hardcore", result = "Triumph", tower = "Hacker"},
            },
        },
    },
    {
        ids = {"mission:ShadowforgeTinkerer"},
        titles = {"Shadowforge Tinkerer"},
        objectives = {
            {
                index = 4,
                id = "hardcore_engineer",
                type = "quest_tower_match_used",
                amount = 1,
                description = "Triumph Hardcore with Engineer placed down",
                filter = {difficulty = "Easy", mode = "Hardcore", result = "Triumph", tower = "Engineer"},
            },
        },
    },
}

local function cloneFilter(a1) -- Line: 293 -- types: a1: table?
    if not a1 then
        return nil
    end
    return table.clone(a1)
end

local function recordMatchesPatch(a1, a2) -- Line: 301 -- types: a2: table
    local tome = a1.tome
    local id = a1.id
    local id_2 = tome and tome.id
    local name = tome and tome.name
    for i, j in a2.ids do
        if id ~= j and id_2 ~= j then
            continue
        end
        return true
    end
    for k, n in a2.titles do
        if name == n then
            return true
        end
    end
    return false
end

local function isCompletedMissionRecord(a1, a2) -- Line: 322 -- upvalues: Quests (val)
    local completed = a1.completed or {}
    local tome = a2.tome
    local v1 = true
    if completed[a2.id] ~= true then
        if not tome then
            v1 = Quests.isRecordComplete(a2)
        else
            v1 = true
            if completed[tome.id] ~= true then
                v1 = Quests.isRecordComplete(a2)
            end
        end
    end
    return v1
end

local function patchObjective(a1, a2) -- Line: 333 -- types: a2: table
    local tome = a1.tome
    if tome and tome.objectives then
        local v1 = tome.objectives[a2.index]
        if not v1 then
            return false
        end
        local id = v1.id
        local v2 = 0
        if a1.progress and a1.progress.objectives then
            v2 = a1.progress.objectives[id] or v1.current or 0
        end
        local v3 = table.clone(v1)
        v3.id = a2.id
        v3.type = a2.type
        v3.amount = a2.amount
        v3.current = 0
        v3.description = a2.description
        local filter = a2.filter
        v3.filter = if filter then table.clone(filter) else nil
        v3.filterMatchType = "ALL"
        v3.progressType = a2.progressType or "INCREMENT"
        v3.requirement = v1.requirement or "REQUIRED"
        v3.resetOnFail = a2.resetOnFail
        tome.objectives[a2.index] = v3
        if a1.progress and a1.progress.objectives then
            a1.progress.objectives[id] = nil
            a1.progress.objectives[a2.id] = (math.min(v2, a2.amount))
        end
        return true
    end
    return false
end

local function migrateHardcoreMissionRework(a1) -- Line: 373
    -- upvalues: Quests (val), u16 (val), recordMatchesPatch (val), patchObjective (val), Tome (val)
    local missions = a1.groups.missions
    if missions and missions.quests then
        local completed, tome, v1
        local v2 = false
        local v3 = nil
        local v4 = nil
        for i, j in missions.quests, v3, v4 do
            completed = a1.completed or {}
            tome = j.tome
            v1 = true
            if completed[j.id] ~= true then
                if not tome then
                    v1 = Quests.isRecordComplete(j)
                else
                    v1 = true
                    if completed[tome.id] ~= true then
                        v1 = Quests.isRecordComplete(j)
                    end
                end
            end
            if not v1 then
                for k, n in u16 do
                    if recordMatchesPatch(j, n) then
                        for m, i5 in n.objectives do
                            if patchObjective(j, i5) then
                                v2 = true
                            end
                        end
                        if not j.started or not Tome.isCompleted(j.tome, j.progress) then
                            break
                        end
                        j.progress.state = "COMPLETED"
                        break
                    end
                end
            end
        end
        return v2
    end
    return false
end

local function getGeneratedSource(a1) -- Line: 407
    local source = a1.source
    if typeof(source) ~= "string" then
        return nil
    end
    return string.match(source, "^generated:(.+)$")
end

local function isWeeklyResetOnFailReworkRecord(a1) -- Line: 416 -- upvalues: u15 (val)
    local source, v1, v2
    local tome = a1.tome
    local metadata = tome and tome.metadata
    if typeof(metadata) ~= "table" then
        source = a1.source
        v1 = if typeof(source) == "string" then string.match(source, "^generated:(.+)$") else nil
        v2 = false
        if v1 ~= nil then
            v2 = u15[v1] == true
        end
        return v2
    end
    if not u15[metadata.generatorId] and not u15[metadata.family] and not u15[metadata.challenge] then
        source = a1.source
        v1 = if typeof(source) == "string" then string.match(source, "^generated:(.+)$") else nil
        v2 = false
        if v1 ~= nil then
            v2 = u15[v1] == true
        end
        return v2
    end
    return true
end

local function migrateWeeklyResetOnFailRework(a1) -- Line: 434 -- upvalues: u15 (val)
    local weekly = a1.groups.weekly
    if weekly and weekly.quests then
        local metadata, source, tome, tome_2, v1, v2
        local v3 = false
        local v4 = nil
        local v5 = nil
        for i, j in weekly.quests, v4, v5 do
            tome = j.tome
            metadata = tome and tome.metadata
            if typeof(metadata) ~= "table" then
                source = j.source
                v1 = if typeof(source) == "string" then string.match(source, "^generated:(.+)$") else nil
                v2 = false
                if v1 ~= nil then
                    v2 = u15[v1] == true
                end
            elseif u15[metadata.generatorId] or u15[metadata.family] then
                v2 = true
            elseif not u15[metadata.challenge] then
                source = j.source
                v1 = if typeof(source) == "string" then string.match(source, "^generated:(.+)$") else nil
                v2 = false
                if v1 ~= nil then
                    v2 = u15[v1] == true
                end
            else
                v2 = true
            end
            if v2 then
                tome_2 = j.tome
                if tome_2 and tome_2.objectives then
                    for k, n in tome_2.objectives do
                        if n.resetOnFail ~= nil then
                            n.resetOnFail = nil
                            v3 = true
                        end
                    end
                end
            end
        end
        return v3
    end
    return false
end

local function buildCanonicalMissionIndexes() -- Line: 462 -- upvalues: ReplicatedStorage (val), Quests (val)
    local expirationPolicy, metadata, result_2, success, success_2, v1
    local ServerStorage = game:GetService("ServerStorage")
    local Content = ReplicatedStorage:FindFirstChild("Content") or ServerStorage:FindFirstChild("Content")
    local Missions = Content and Content:FindFirstChild("Missions")
    if not Missions then
        return {}, {}, false
    end
    local v2 = {}
    local v3 = {}
    for i, j in Missions:GetChildren() do
        if j:IsA("ModuleScript") then
            success, result = pcall(require, j)
            if success and typeof(result) == "table" then
                local u59 = ("mission:%*"):format(j.Name)
                success_2, result_2 = pcall(function() -- Line: 487 -- upvalues: Quests (upval), result (val), u59 (val)
                    return Quests.buildTome(result, {category = "missions", id = u59})
                end)
                if success_2 and typeof(result_2) == "table" then
                    metadata = result_2.metadata or {}
                    expirationPolicy = metadata.expirationPolicy
                    if expirationPolicy ~= "REMOVE" and expirationPolicy ~= "RETAIN" then
                        return {}, {}, false
                    end
                    v1 = {id = u59, tome = result_2, expirationPolicy = expirationPolicy}
                    v2[u59] = v1
                    v3[v1.tome.name] = v1
                    if j.Name == "UndeadSolider" then
                        v3["Undead Solider"] = v1
                    end
                    continue
                end
                return {}, {}, false
            end
            return {}, {}, false
        end
    end
    return v2, v3, true
end

local function hasClaimedReward(a1) -- Line: 519
    local progress = a1.progress
    if progress and progress.rewards then
        for i, j in progress.rewards do
            if j then
                return true
            end
        end
        return false
    end
    return false
end

local function getCanonicalMission(a1, a2, a3) -- Line: 534 -- types: a2: table, a3: table
    local tome = a1.tome
    return a2[a1.id] or tome and a2[tome.id] or tome and a3[tome.name]
end

local function rekeyMissionRecord(a1, a2) -- Line: 543 -- upvalues: Tome (val) -- types: a2: table
    local current, v1, v2
    local tome = a1.tome
    local progress = a1.progress
    local v3 = Tome.clone(a2.tome)
    local v4 = {}
    local v5 = {}
    local objectives = v3.objectives
    local v6 = nil
    local v7 = nil
    local v8, v9 = a1, a2
    for i, j in objectives, v6, v7 do
        v1 = tome.objectives[i]
        current = if not v1 then 0 else progress.objectives[v1.id] or v1.current or 0
        v4[j.id] = (math.clamp(current, 0, j.amount))
    end
    v6 = nil
    v7 = nil
    for k, n in v3.rewards, v6, v7 do
        v1 = tome.rewards[k]
        v2 = false
        if v1 then
            v2 = progress.rewards[Tome.getRewardKey(v1, k)] == true
        end
        v5[Tome.getRewardKey(n, k)] = v2
    end
    local v10 = table.clone(v8)
    v10.id = v9.id
    v10.tome = v3
    v10.expirationPolicy = v9.expirationPolicy
    v10.progress = {state = progress.state, objectives = v4, rewards = v5}
    if v10.started and Tome.isCompleted(v3, v10.progress) then
        v10.progress.state = "COMPLETED"
    end
    return v10
end

local function mergeMissionRecords(a1, a2, a3) -- Line: 587
    -- upvalues: rekeyMissionRecord (val), Tome (val)
    local objectives_2, v1
    local v2 = rekeyMissionRecord(a1, a3)
    local v3 = rekeyMissionRecord(a2, a3)
    for i, j in v3.progress.objectives do
        objectives_2 = v2.progress.objectives
        v1 = v2.progress.objectives[i] or 0
        objectives_2[i] = (math.max(v1, j))
    end
    for k, n in v3.progress.rewards do
        v2.progress.rewards[k] = v2.progress.rewards[k] or n
    end
    if v3.started and not v2.started then
        v2.started = true
        v2.progress.state = v3.progress.state
    end
    if v2.expires == nil then
        v2.expires = nil
    elseif v3.expires ~= nil then
        v2.expires = math.max(v2.expires, v3.expires)
    else
        v2.expires = nil
    end
    if v2.started and Tome.isCompleted(v2.tome, v2.progress) then
        v2.progress.state = "COMPLETED"
    end
    return v2
end

local function migrateMissionIntegrityRework(a1) -- Line: 622
    -- upvalues: buildCanonicalMissionIndexes (val), Quests (val), rekeyMissionRecord (val), mergeMissionRecords (val)
    local v1, v2, v3 = buildCanonicalMissionIndexes()
    if not v3 then
        return false, false
    end
    local missions = a1.groups.missions
    if missions and missions.quests then
        local completed, completed_2, expires, key, progress, progress_2, record, tome, tome_2, tome_3, v4, v5, v6, v7
        local v8 = {}
        for i14, i15 in missions.quests do
            table.insert(v8, {key = i14, record = i15})
        end
        local v9 = false
        local v10 = false
        local v11 = nil
        local v12 = nil
        local v13 = a1
        for i16, i17 in v8, v11, v12 do
            key = i17.key
            record = i17.record
            if missions.quests[key] == record then
                tome = record.tome
                v4 = v1[record.id] or tome and v1[tome.id] or tome and v2[tome.name]
                if v4 then
                    completed = v13.completed or {}
                    tome_2 = record.tome
                    v5 = true
                    if completed[record.id] ~= true then
                        if not tome_2 then
                            v5 = Quests.isRecordComplete(record)
                        else
                            v5 = true
                            if completed[tome_2.id] ~= true then
                                v5 = Quests.isRecordComplete(record)
                            end
                        end
                    end
                    if not v5 then
                        progress = record.progress
                        if progress then
                            if progress.rewards then
                                for i18, i19 in progress.rewards do
                                    if i19 then
                                        v5 = true
                                        if not v5 then
                                            if not record.expires then
                                                v5 = rekeyMissionRecord(record, v4)
                                                v6 = missions.quests[v4.id]
                                                if v6 and v6 ~= record then
                                                    completed_2 = v13.completed or {}
                                                    tome_3 = v6.tome
                                                    v7 = true
                                                    if completed_2[v6.id] ~= true then
                                                        if not tome_3 then
                                                            v7 = Quests.isRecordComplete(v6)
                                                        else
                                                            v7 = true
                                                            if completed_2[tome_3.id] ~= true then
                                                                v7 = Quests.isRecordComplete(v6)
                                                            end
                                                        end
                                                    end
                                                    if not v7 then
                                                        progress_2 = v6.progress
                                                        if progress_2 then
                                                            if progress_2.rewards then
                                                                for i20, i21 in progress_2.rewards do
                                                                    if i21 then
                                                                        expires = v6.expires and Quests.isTimestampExpired(v6.expires)
                                                                        if true then
                                                                            v5 = v6
                                                                        elseif v4.expirationPolicy ~= "REMOVE"
                                                                            or not expires then
                                                                            v5 = mergeMissionRecords(v6, v5, v4)
                                                                        end
                                                                        missions.quests[key] = nil
                                                                        missions.quests[v4.id] = v5
                                                                        if v13.trackedQuestIds then
                                                                            if v13.trackedQuestIds[record.id]
                                                                                or v13.trackedQuestIds[key] then
                                                                                v13.trackedQuestIds[record.id] = nil
                                                                                v13.trackedQuestIds[key] = nil
                                                                                v13.trackedQuestIds[v4.id] = true
                                                                                v10 = true
                                                                            end
                                                                        end
                                                                        if v13.trackedQuestId == record.id
                                                                            or v13.trackedQuestId == key then
                                                                            v13.trackedQuestId = v4.id
                                                                            v10 = true
                                                                        end
                                                                        v9 = true
                                                                        -- [[ incomplete: control flow could not be represented ]]
                                                                    end
                                                                end
                                                            end
                                                        end
                                                        v7 = false
                                                    end
                                                    expires = v6.expires and Quests.isTimestampExpired(v6.expires)
                                                    if v7 then
                                                        v5 = v6
                                                    elseif v4.expirationPolicy ~= "REMOVE" or not expires then
                                                        v5 = mergeMissionRecords(v6, v5, v4)
                                                    end
                                                end
                                                missions.quests[key] = nil
                                                missions.quests[v4.id] = v5
                                                if v13.trackedQuestIds then
                                                    if v13.trackedQuestIds[record.id] or v13.trackedQuestIds[key] then
                                                        v13.trackedQuestIds[record.id] = nil
                                                        v13.trackedQuestIds[key] = nil
                                                        v13.trackedQuestIds[v4.id] = true
                                                        v10 = true
                                                    end
                                                end
                                                if v13.trackedQuestId == record.id or v13.trackedQuestId == key then
                                                    v13.trackedQuestId = v4.id
                                                    v10 = true
                                                end
                                                v9 = true
                                            elseif not Quests.isTimestampExpired(record.expires) then
                                                v5 = rekeyMissionRecord(record, v4)
                                                v6 = missions.quests[v4.id]
                                                if v6 and v6 ~= record then
                                                    completed_2 = v13.completed or {}
                                                    tome_3 = v6.tome
                                                    v7 = true
                                                    if completed_2[v6.id] ~= true then
                                                        if not tome_3 then
                                                            v7 = Quests.isRecordComplete(v6)
                                                        else
                                                            v7 = true
                                                            if completed_2[tome_3.id] ~= true then
                                                                v7 = Quests.isRecordComplete(v6)
                                                            end
                                                        end
                                                    end
                                                    if not v7 then
                                                        progress_2 = v6.progress
                                                        if progress_2 then
                                                            if progress_2.rewards then
                                                                for i22, i23 in progress_2.rewards do
                                                                    if i23 then
                                                                        expires = v6.expires and Quests.isTimestampExpired(v6.expires)
                                                                        if true then
                                                                            v5 = v6
                                                                        elseif v4.expirationPolicy ~= "REMOVE"
                                                                            or not expires then
                                                                            v5 = mergeMissionRecords(v6, v5, v4)
                                                                        end
                                                                        missions.quests[key] = nil
                                                                        missions.quests[v4.id] = v5
                                                                        if v13.trackedQuestIds then
                                                                            if v13.trackedQuestIds[record.id]
                                                                                or v13.trackedQuestIds[key] then
                                                                                v13.trackedQuestIds[record.id] = nil
                                                                                v13.trackedQuestIds[key] = nil
                                                                                v13.trackedQuestIds[v4.id] = true
                                                                                v10 = true
                                                                            end
                                                                        end
                                                                        if v13.trackedQuestId == record.id
                                                                            or v13.trackedQuestId == key then
                                                                            v13.trackedQuestId = v4.id
                                                                            v10 = true
                                                                        end
                                                                        v9 = true
                                                                        -- [[ incomplete: control flow could not be represented ]]
                                                                    end
                                                                end
                                                            end
                                                        end
                                                        v7 = false
                                                    end
                                                    expires = v6.expires and Quests.isTimestampExpired(v6.expires)
                                                    if v7 then
                                                        v5 = v6
                                                    elseif v4.expirationPolicy ~= "REMOVE" or not expires then
                                                        v5 = mergeMissionRecords(v6, v5, v4)
                                                    end
                                                end
                                                missions.quests[key] = nil
                                                missions.quests[v4.id] = v5
                                                if v13.trackedQuestIds then
                                                    if v13.trackedQuestIds[record.id] or v13.trackedQuestIds[key] then
                                                        v13.trackedQuestIds[record.id] = nil
                                                        v13.trackedQuestIds[key] = nil
                                                        v13.trackedQuestIds[v4.id] = true
                                                        v10 = true
                                                    end
                                                end
                                                if v13.trackedQuestId == record.id or v13.trackedQuestId == key then
                                                    v13.trackedQuestId = v4.id
                                                    v10 = true
                                                end
                                                v9 = true
                                            elseif v4.expirationPolicy ~= "REMOVE" then
                                                v5 = rekeyMissionRecord(record, v4)
                                                v6 = missions.quests[v4.id]
                                                if v6 and v6 ~= record then
                                                    completed_2 = v13.completed or {}
                                                    tome_3 = v6.tome
                                                    v7 = true
                                                    if completed_2[v6.id] ~= true then
                                                        if not tome_3 then
                                                            v7 = Quests.isRecordComplete(v6)
                                                        else
                                                            v7 = true
                                                            if completed_2[tome_3.id] ~= true then
                                                                v7 = Quests.isRecordComplete(v6)
                                                            end
                                                        end
                                                    end
                                                    if not v7 then
                                                        progress_2 = v6.progress
                                                        if progress_2 then
                                                            if progress_2.rewards then
                                                                for i24, i25 in progress_2.rewards do
                                                                    if i25 then
                                                                        expires = v6.expires and Quests.isTimestampExpired(v6.expires)
                                                                        if true then
                                                                            v5 = v6
                                                                        elseif v4.expirationPolicy ~= "REMOVE"
                                                                            or not expires then
                                                                            v5 = mergeMissionRecords(v6, v5, v4)
                                                                        end
                                                                        missions.quests[key] = nil
                                                                        missions.quests[v4.id] = v5
                                                                        if v13.trackedQuestIds then
                                                                            if v13.trackedQuestIds[record.id]
                                                                                or v13.trackedQuestIds[key] then
                                                                                v13.trackedQuestIds[record.id] = nil
                                                                                v13.trackedQuestIds[key] = nil
                                                                                v13.trackedQuestIds[v4.id] = true
                                                                                v10 = true
                                                                            end
                                                                        end
                                                                        if v13.trackedQuestId == record.id
                                                                            or v13.trackedQuestId == key then
                                                                            v13.trackedQuestId = v4.id
                                                                            v10 = true
                                                                        end
                                                                        v9 = true
                                                                        -- [[ incomplete: control flow could not be represented ]]
                                                                    end
                                                                end
                                                            end
                                                        end
                                                        v7 = false
                                                    end
                                                    expires = v6.expires and Quests.isTimestampExpired(v6.expires)
                                                    if v7 then
                                                        v5 = v6
                                                    elseif v4.expirationPolicy ~= "REMOVE" or not expires then
                                                        v5 = mergeMissionRecords(v6, v5, v4)
                                                    end
                                                end
                                                missions.quests[key] = nil
                                                missions.quests[v4.id] = v5
                                                if v13.trackedQuestIds then
                                                    if v13.trackedQuestIds[record.id] or v13.trackedQuestIds[key] then
                                                        v13.trackedQuestIds[record.id] = nil
                                                        v13.trackedQuestIds[key] = nil
                                                        v13.trackedQuestIds[v4.id] = true
                                                        v10 = true
                                                    end
                                                end
                                                if v13.trackedQuestId == record.id or v13.trackedQuestId == key then
                                                    v13.trackedQuestId = v4.id
                                                    v10 = true
                                                end
                                                v9 = true
                                            else
                                                missions.quests[key] = nil
                                                if v13.trackedQuestIds then
                                                    v13.trackedQuestIds[record.id] = nil
                                                    v13.trackedQuestIds[key] = nil
                                                end
                                                if v13.trackedQuestId == record.id or v13.trackedQuestId == key then
                                                    v13.trackedQuestId = nil
                                                end
                                                v9 = true
                                                v10 = true
                                            end
                                        end
                                        break
                                    end
                                end
                            end
                        end
                        v5 = false
                        if not v5 then
                            if not record.expires then
                                v5 = rekeyMissionRecord(record, v4)
                                v6 = missions.quests[v4.id]
                                if v6 and v6 ~= record then
                                    completed_2 = v13.completed or {}
                                    tome_3 = v6.tome
                                    v7 = true
                                    if completed_2[v6.id] ~= true then
                                        if not tome_3 then
                                            v7 = Quests.isRecordComplete(v6)
                                        else
                                            v7 = true
                                            if completed_2[tome_3.id] ~= true then
                                                v7 = Quests.isRecordComplete(v6)
                                            end
                                        end
                                    end
                                    if not v7 then
                                        progress_2 = v6.progress
                                        if progress_2 then
                                            if progress_2.rewards then
                                                for i26, i27 in progress_2.rewards do
                                                    if i27 then
                                                        expires = v6.expires and Quests.isTimestampExpired(v6.expires)
                                                        if true then
                                                            v5 = v6
                                                        elseif v4.expirationPolicy ~= "REMOVE" or not expires then
                                                            v5 = mergeMissionRecords(v6, v5, v4)
                                                        end
                                                        missions.quests[key] = nil
                                                        missions.quests[v4.id] = v5
                                                        if v13.trackedQuestIds then
                                                            if v13.trackedQuestIds[record.id]
                                                                or v13.trackedQuestIds[key] then
                                                                v13.trackedQuestIds[record.id] = nil
                                                                v13.trackedQuestIds[key] = nil
                                                                v13.trackedQuestIds[v4.id] = true
                                                                v10 = true
                                                            end
                                                        end
                                                        if v13.trackedQuestId == record.id
                                                            or v13.trackedQuestId == key then
                                                            v13.trackedQuestId = v4.id
                                                            v10 = true
                                                        end
                                                        v9 = true
                                                        break
                                                    end
                                                end
                                            end
                                        end
                                        v7 = false
                                    end
                                    expires = v6.expires and Quests.isTimestampExpired(v6.expires)
                                    if v7 then
                                        v5 = v6
                                    elseif v4.expirationPolicy ~= "REMOVE" or not expires then
                                        v5 = mergeMissionRecords(v6, v5, v4)
                                    end
                                end
                                missions.quests[key] = nil
                                missions.quests[v4.id] = v5
                                if v13.trackedQuestIds then
                                    if v13.trackedQuestIds[record.id] or v13.trackedQuestIds[key] then
                                        v13.trackedQuestIds[record.id] = nil
                                        v13.trackedQuestIds[key] = nil
                                        v13.trackedQuestIds[v4.id] = true
                                        v10 = true
                                    end
                                end
                                if v13.trackedQuestId == record.id or v13.trackedQuestId == key then
                                    v13.trackedQuestId = v4.id
                                    v10 = true
                                end
                                v9 = true
                            elseif not Quests.isTimestampExpired(record.expires) then
                                v5 = rekeyMissionRecord(record, v4)
                                v6 = missions.quests[v4.id]
                                if v6 and v6 ~= record then
                                    completed_2 = v13.completed or {}
                                    tome_3 = v6.tome
                                    v7 = true
                                    if completed_2[v6.id] ~= true then
                                        if not tome_3 then
                                            v7 = Quests.isRecordComplete(v6)
                                        else
                                            v7 = true
                                            if completed_2[tome_3.id] ~= true then
                                                v7 = Quests.isRecordComplete(v6)
                                            end
                                        end
                                    end
                                    if not v7 then
                                        progress_2 = v6.progress
                                        if progress_2 then
                                            if progress_2.rewards then
                                                for i28, i29 in progress_2.rewards do
                                                    if i29 then
                                                        expires = v6.expires and Quests.isTimestampExpired(v6.expires)
                                                        if true then
                                                            v5 = v6
                                                        elseif v4.expirationPolicy ~= "REMOVE" or not expires then
                                                            v5 = mergeMissionRecords(v6, v5, v4)
                                                        end
                                                        missions.quests[key] = nil
                                                        missions.quests[v4.id] = v5
                                                        if v13.trackedQuestIds then
                                                            if v13.trackedQuestIds[record.id]
                                                                or v13.trackedQuestIds[key] then
                                                                v13.trackedQuestIds[record.id] = nil
                                                                v13.trackedQuestIds[key] = nil
                                                                v13.trackedQuestIds[v4.id] = true
                                                                v10 = true
                                                            end
                                                        end
                                                        if v13.trackedQuestId == record.id
                                                            or v13.trackedQuestId == key then
                                                            v13.trackedQuestId = v4.id
                                                            v10 = true
                                                        end
                                                        v9 = true
                                                        break
                                                    end
                                                end
                                            end
                                        end
                                        v7 = false
                                    end
                                    expires = v6.expires and Quests.isTimestampExpired(v6.expires)
                                    if v7 then
                                        v5 = v6
                                    elseif v4.expirationPolicy ~= "REMOVE" or not expires then
                                        v5 = mergeMissionRecords(v6, v5, v4)
                                    end
                                end
                                missions.quests[key] = nil
                                missions.quests[v4.id] = v5
                                if v13.trackedQuestIds then
                                    if v13.trackedQuestIds[record.id] or v13.trackedQuestIds[key] then
                                        v13.trackedQuestIds[record.id] = nil
                                        v13.trackedQuestIds[key] = nil
                                        v13.trackedQuestIds[v4.id] = true
                                        v10 = true
                                    end
                                end
                                if v13.trackedQuestId == record.id or v13.trackedQuestId == key then
                                    v13.trackedQuestId = v4.id
                                    v10 = true
                                end
                                v9 = true
                            elseif v4.expirationPolicy ~= "REMOVE" then
                                v5 = rekeyMissionRecord(record, v4)
                                v6 = missions.quests[v4.id]
                                if v6 and v6 ~= record then
                                    completed_2 = v13.completed or {}
                                    tome_3 = v6.tome
                                    v7 = true
                                    if completed_2[v6.id] ~= true then
                                        if not tome_3 then
                                            v7 = Quests.isRecordComplete(v6)
                                        else
                                            v7 = true
                                            if completed_2[tome_3.id] ~= true then
                                                v7 = Quests.isRecordComplete(v6)
                                            end
                                        end
                                    end
                                    if not v7 then
                                        progress_2 = v6.progress
                                        if progress_2 then
                                            if progress_2.rewards then
                                                for i30, i31 in progress_2.rewards do
                                                    if i31 then
                                                        expires = v6.expires and Quests.isTimestampExpired(v6.expires)
                                                        if true then
                                                            v5 = v6
                                                        elseif v4.expirationPolicy ~= "REMOVE" or not expires then
                                                            v5 = mergeMissionRecords(v6, v5, v4)
                                                        end
                                                        missions.quests[key] = nil
                                                        missions.quests[v4.id] = v5
                                                        if v13.trackedQuestIds then
                                                            if v13.trackedQuestIds[record.id]
                                                                or v13.trackedQuestIds[key] then
                                                                v13.trackedQuestIds[record.id] = nil
                                                                v13.trackedQuestIds[key] = nil
                                                                v13.trackedQuestIds[v4.id] = true
                                                                v10 = true
                                                            end
                                                        end
                                                        if v13.trackedQuestId == record.id
                                                            or v13.trackedQuestId == key then
                                                            v13.trackedQuestId = v4.id
                                                            v10 = true
                                                        end
                                                        v9 = true
                                                        break
                                                    end
                                                end
                                            end
                                        end
                                        v7 = false
                                    end
                                    expires = v6.expires and Quests.isTimestampExpired(v6.expires)
                                    if v7 then
                                        v5 = v6
                                    elseif v4.expirationPolicy ~= "REMOVE" or not expires then
                                        v5 = mergeMissionRecords(v6, v5, v4)
                                    end
                                end
                                missions.quests[key] = nil
                                missions.quests[v4.id] = v5
                                if v13.trackedQuestIds then
                                    if v13.trackedQuestIds[record.id] or v13.trackedQuestIds[key] then
                                        v13.trackedQuestIds[record.id] = nil
                                        v13.trackedQuestIds[key] = nil
                                        v13.trackedQuestIds[v4.id] = true
                                        v10 = true
                                    end
                                end
                                if v13.trackedQuestId == record.id or v13.trackedQuestId == key then
                                    v13.trackedQuestId = v4.id
                                    v10 = true
                                end
                                v9 = true
                            else
                                missions.quests[key] = nil
                                if v13.trackedQuestIds then
                                    v13.trackedQuestIds[record.id] = nil
                                    v13.trackedQuestIds[key] = nil
                                end
                                if v13.trackedQuestId == record.id or v13.trackedQuestId == key then
                                    v13.trackedQuestId = nil
                                end
                                v9 = true
                                v10 = true
                            end
                        end
                    end
                end
            end
        end
        if v10 then
            Quests.syncPrimaryTrackedQuestId(v13)
        end
        return v9, true
    end
    return false, true
end

local function reconcileGroup(a1, a2) -- Line: 720 -- upvalues: Quests (val) -- types: a1: string
    local v1 = false
    local v2 = Quests.Groups[a1]
    if typeof(a2.quests) ~= "table" then
        a2.quests = {}
        v1 = true
    end
    if not v2 then
        return v1
    end
    if a2.claimToStart ~= v2.claimToStart then
        a2.claimToStart = v2.claimToStart
        v1 = true
    end
    if a2.maxClaimableQuests ~= v2.maxClaimableQuests then
        a2.maxClaimableQuests = v2.maxClaimableQuests
        v1 = true
    end
    if a2.groupOnly ~= v2.groupOnly then
        a2.groupOnly = v2.groupOnly
        v1 = true
    end
    if a2.currentOrder == nil and v2.groupOnly then
        a2.currentOrder = 1
        v1 = true
    end
    return v1
end

function v1.reconcile(a1) -- Line: 756
    -- upvalues: Quests (val), reconcileGroup (val), migrateHardcoreMissionRework (val)
    -- upvalues: migrateWeeklyResetOnFailRework (val), migrateMissionIntegrityRework (val)
    local v1 = false
    if typeof(a1.Quests) ~= "table" then
        a1.Quests = Quests.createData()
        v1 = true
    end
    local Quests_3 = a1.Quests
    if typeof(Quests_3.groups) ~= "table" then
        Quests_3.groups = {}
        v1 = true
    end
    if typeof(Quests_3.completed) ~= "table" then
        Quests_3.completed = {}
        v1 = true
    end
    if typeof(Quests_3.migrations) ~= "table" then
        Quests_3.migrations = {}
        v1 = true
    end
    local migrations_2 = Quests_3.migrations
    if typeof(Quests_3.trackedQuestIds) ~= "table" then
        Quests_3.trackedQuestIds = {}
        v1 = true
    end
    if Quests_3.trackedQuestId and not Quests_3.trackedQuestIds[Quests_3.trackedQuestId] then
        Quests_3.trackedQuestIds[Quests_3.trackedQuestId] = true
        v1 = true
    end
    local v2 = nil
    for i, j in Quests_3.groups, v2 do
        if typeof(j) ~= "table" then
            Quests_3.groups[i] = (Quests.createGroup(i))
            v1 = true
        elseif reconcileGroup(i, j) then
            v1 = true
        end
    end
    if migrations_2.HardcoreMissionRework ~= 2 then
        if not migrateHardcoreMissionRework(Quests_3) then end
        migrations_2.HardcoreMissionRework = 2
        v1 = true
    end
    if migrations_2.WeeklyResetOnFailRework ~= 1 then
        if not migrateWeeklyResetOnFailRework(Quests_3) then end
        migrations_2.WeeklyResetOnFailRework = 1
        v1 = true
    end
    if migrations_2.MissionIntegrityRework ~= 1 then
        local v3
        v3, v2 = migrateMissionIntegrityRework(Quests_3)
        if v3 then
            v1 = true
        end
        if v2 then
            migrations_2.MissionIntegrityRework = 1
            v1 = true
        end
    end
    if a1.Contracts ~= nil then
        a1.Contracts = nil
        v1 = true
    end
    return v1
end

return v1