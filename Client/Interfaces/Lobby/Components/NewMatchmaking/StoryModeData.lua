-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.StoryModeData
-- Decompile time: 54.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local NewMaps = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.NewMaps)
local StoryMissionAvailability = require(ReplicatedStorage.Shared.Modules.StoryMissionAvailability)
require(script.Parent.MatchmakingModel)
local u27 = nil
local u28 = {}

local function formatThresholdTime(a1) -- Line: 90 -- types: a1: number
    local v1 = math.max(math.floor(a1), 0)
    return string.format("%02d:%02d", math.floor(v1 / 60), v1 % 60)
end

local function formatStarRequirement(a1, a2) -- Line: 98 -- types: a1: number, a2: table?
    local v1
    if a1 <= 1 then
        return "Complete the mission."
    end
    if not a2 then
        return "Requirement unavailable."
    end
    local Time = a2.Time
    local Health = a2.Health or a2.HealthPercentage
    if Time and Health then
        v1 = math.max(math.floor(Time), 0)
        return (("Finish within %* with at least %*%% base health remaining."):format(
            string.format("%02d:%02d", math.floor(v1 / 60), v1 % 60),
            (math.round(Health * 100))
        ))
    end
    if Time then
        v1 = math.max(math.floor(Time), 0)
        return (("Finish within %*."):format((string.format("%02d:%02d", math.floor(v1 / 60), v1 % 60))))
    end
    if Health then
        return (("Finish with at least %*%% base health remaining."):format((math.round(Health * 100))))
    end
    return "Complete the mission."
end

local function buildStarRequirements(a1) -- Line: 121 -- upvalues: formatStarRequirement (val) -- types: a1: table
    local v1 = {"Complete the mission."}
    for i, j in a1 do
        v1[i] = (formatStarRequirement(i, j))
    end
    return v1
end

local function getMissionStars(a1, a2, a3) -- Line: 135 -- types: a1: table?, a2: number, a3: number
    local Chapters = a1 and a1.Chapters
    local v1 = Chapters and Chapters[a2]
    local Missions = v1 and v1.Missions
    local v2 = Missions and Missions[a3]
    local Stars = v2 and v2.Stars
    if type(Stars) == "number" then
        return (math.max(math.floor(Stars), 0))
    end
    return 0
end

local function isMissionCompleted(a1, a2, a3) -- Line: 149 -- types: a1: table?, a2: number, a3: number
    local Chapters = a1 and a1.Chapters
    local v1 = Chapters and Chapters[a2]
    local Missions = v1 and v1.Missions
    local v2 = false
    if Missions ~= nil then
        v2 = Missions[a3] ~= nil
    end
    return v2
end

local function isMissionStarted(a1, a2, a3) -- Line: 161 -- types: a1: table?, a2: number, a3: number
    local Chapters = a1 and a1.Chapters
    local v1 = Chapters and Chapters[a2]
    local Missions = v1 and v1.Missions
    local v2 = false
    if Missions ~= nil then
        v2 = Missions[a3] ~= nil
    end
    if v2 then
        return true
    end
    local Chapters_2 = a1 and a1.Chapters
    local v3 = Chapters_2 and Chapters_2[a2]
    local StartedMissions = v3 and v3.StartedMissions
    local v4 = false
    if StartedMissions ~= nil then
        v4 = StartedMissions[a3] == true
    end
    return v4
end

local function getCutsceneAfterMission(a1, a2) -- Line: 176 -- types: a1: table, a2: table
    local AfterMission = a1.AfterMission
    if type(AfterMission) == "number" and not (AfterMission < 0) and AfterMission % 1 == 0 then
        if AfterMission > 0 and a2[AfterMission] == nil then
            return nil
        end
        return AfterMission
    end
    return nil
end

local function cloneRewards(a1) -- Line: 192 -- types: a1: table?
    local v1 = table.create(if not a1 then 0 else #a1)
    for i, j in a1 or {} do
        v1[i] = (table.clone(j))
    end
    return v1
end

local function getMapImage(a1, a2) -- Line: 202 -- upvalues: NewMaps (val) -- types: a1: string?
    local v1 = a1 and NewMaps(a1)
    if v1 and v1.ImageID and 0 < v1.ImageID then
        return v1.ImageID
    end
    if v1 and v1.MapId and 0 < v1.MapId then
        return (("rbxthumb://type=Asset&id=%*&w=420&h=420"):format(v1.MapId))
    end
    return a2
end

local function getMapDisplayName(a1) -- Line: 215 -- upvalues: NewMaps (val) -- types: a1: string?
    local v1 = a1 and NewMaps(a1)
    local DisplayName = v1 and v1.DisplayName
    if DisplayName and DisplayName ~= "" then
        return DisplayName
    end
    return a1
end

local function getSortedChapterNumbers(a1) -- Line: 222 -- types: a1: table
    local v1 = {}
    for i in a1 do
        table.insert(v1, i)
    end
    table.sort(v1)
    return v1
end

local function isChapterUnlockedForParty(a1, a2) -- Line: 236 -- types: a1: table?, a2: number
    if not a1 then
        return true
    end
    local v1 = a1.chapters[a2]
    local unlockedForParty = false
    if v1 ~= nil then
        unlockedForParty = v1.unlockedForParty
    end
    return unlockedForParty
end

local function isMissionUnlockedForParty(a1, a2, a3) -- Line: 248 -- types: a1: table?, a2: number, a3: number
    if not a1 then
        return true
    end
    local v1 = a1.chapters[a2]
    if v1 and v1.unlockedForParty then
        local missions = v1.missions
        local v2 = false
        if missions ~= nil then
            v2 = missions[a3] == true
        end
        return v2
    end
    return false
end

function u28.buildSections(a1, a2, a3, a4, a5) -- Line: 266
    -- upvalues: StoryMissionAvailability (val), NewMaps (val), cloneRewards (val), buildStarRequirements (val)
    local AfterMission, BeforeMission, Chapters, Chapters_2, Chapters_3, Chapters_4, Chapters_5, Chapters_6, Chapters_7, Chapters_8, Cutscenes, Description, DisplayName, Id, Id_2, Image, Image_2, Map, Map_2, MaxPlayers, Missions, Missions_3, Missions_4, Missions_5, Missions_6, Missions_7, Missions_8, Missions_9, StarThresholds, Stars, StartedMissions, Title, Title_2, Title_3, Title_4, Title_5, Title_6, UnixTimestamp, missions, unlockedForParty, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36
    local v37 = {}
    for i in a1 do
        table.insert(v37, i)
    end
    table.sort(v37)
    local v38 = table.create(#v37)
    local ServerTimeNow = a4 or workspace:GetServerTimeNow()
    local v39 = nil
    local v40 = nil
    local v41 = a1
    for j, k in v37, v39, v40 do
        v2 = v41[k]
        v3 = v41[k - 1]
        v4 = if not v3 then 0 else #v3.Missions
        v5 = true
        if v9 ~= nil then
            v5 = k <= v9
        end
        v6 = true
        if not (k <= 1) then
            v6 = false
            if v4 > 0 then
                v7 = k - 1
                Chapters = v1 and v1.Chapters
                v10 = Chapters and Chapters[v7]
                Missions = v10 and v10.Missions
                v6 = false
                if Missions ~= nil then
                    v6 = Missions[v4] ~= nil
                end
            end
        end
        if v28 then
            v8 = v28.chapters[k]
            unlockedForParty = false
            if v8 ~= nil then
                unlockedForParty = v8.unlockedForParty
            end
        else
            unlockedForParty = true
        end
        v8 = v5 and v6 and unlockedForParty
        Title = v2.Title or ("Chapter %*"):format(k)
        Title_2 = if not v3 then nil else v3.Title or ("Chapter %*"):format(k - 1)
        v11 = if not v8 then if v5 then if v6 then "Locked for other party members." else if not Title_2 then "Complete the previous chapter to unlock." else ("Complete %* to unlock."):format(Title_2) else "This chapter is not available here." else nil
        v12 = 0
        v13 = table.create(#v2.Missions)
        v14 = nil
        v15 = nil
        for n, m in v2.Missions, v14, v15 do
            Chapters_5 = v1 and v1.Chapters
            v20 = Chapters_5 and Chapters_5[k]
            Missions_6 = v20 and v20.Missions
            v18 = false
            if Missions_6 ~= nil then
                v18 = Missions_6[n] ~= nil
            end
            if v18 then
                v12 = v12 + 1
            end
            v19 = v2.Missions[n - 1]
            v20 = StoryMissionAvailability.getMissionLockReason(v2, n, ServerTimeNow)
            v21 = v20 == nil
            v22 = v6
            if v22 then
                v22 = v21
                if v22 then
                    v22 = true
                    if not (n <= 1) then
                        v23 = n - 1
                        Chapters_6 = v1 and v1.Chapters
                        v25 = Chapters_6 and Chapters_6[k]
                        Missions_7 = v25 and v25.Missions
                        v22 = false
                        if Missions_7 ~= nil then
                            v22 = Missions_7[v23] ~= nil
                        end
                    end
                end
            end
            if v28 then
                v24 = v28.chapters[k]
                if not v24 then
                    v23 = false
                elseif v24.unlockedForParty then
                    missions = v24.missions
                    v23 = false
                    if missions ~= nil then
                        v23 = missions[n] == true
                    end
                else
                    v23 = false
                end
            else
                v23 = true
            end
            v24 = v5 and v22 and unlockedForParty and v23
            Title_5 = m.Title or ("Mission %*"):format(n)
            Title_6 = if not v19 then nil else v19.Title or ("Mission %*"):format(n - 1)
            if v24 then
                v27 = nil
            elseif not v21 then
                v27 = v20
            elseif not v5 or not v6 then
                v27 = v11
            elseif not (n > 1) then
                v27 = "Locked for other party members."
            else
                v30 = n - 1
                Chapters_7 = v1 and v1.Chapters
                v32 = Chapters_7 and Chapters_7[k]
                Missions_8 = v32 and v32.Missions
                v29 = false
                if Missions_8 ~= nil then
                    v29 = Missions_8[v30] ~= nil
                end
                v27 = if v29 then "Locked for other party members." else if not Title_6 then "Complete the previous mission to unlock." else ("Complete %* to unlock."):format(Title_6)
            end
            UnixTimestamp = if v21 then nil else if typeof(m.StartsAt) ~= "DateTime" then nil else m.StartsAt.UnixTimestamp
            Map = m.Map
            v32 = Map and NewMaps(Map)
            DisplayName = v32 and v32.DisplayName
            v30 = if not DisplayName then Map else if DisplayName == "" then Map else DisplayName
            StarThresholds = m.StarThresholds
            v32 = {kind = "Mission", chapterNumber = k}
            Id_2 = m.Id or ("chapter-%*-mission-%*"):format(k, n)
            v32.id = Id_2
            v32.locked = not v24
            v32.lockReason = v27
            v32.map = m.Map
            v32.mapDisplayName = v30
            Map_2 = m.Map
            Image_2 = m.Image or v2.Image or 102445581890397
            v35 = Map_2 and NewMaps(Map_2)
            v32.mapImage = if not v35 or not v35.ImageID then if not v35 or not v35.MapId or not (0 < v35.MapId) then Image_2 else ("rbxthumb://type=Asset&id=%*&w=420&h=420"):format(v35.MapId) else if 0 < v35.ImageID then v35.ImageID else if not v35 or not v35.MapId or not (0 < v35.MapId) then Image_2 else ("rbxthumb://type=Asset&id=%*&w=420&h=420"):format(v35.MapId)
            MaxPlayers = m.MaxPlayers or v2.MaxPlayers
            v32.maxPlayers = MaxPlayers
            v32.missionNumber = n
            v32.rewards = cloneRewards(m.RewardPreview)
            v32.starRequirements = if not StarThresholds then nil else buildStarRequirements(StarThresholds)
            v32.suggestedTowers = m.SuggestedTowers
            if not StarThresholds then
                v33 = nil
            elseif not v18 then
                v33 = 0
            else
                Chapters_8 = v1 and v1.Chapters
                v35 = Chapters_8 and Chapters_8[k]
                Missions_9 = v35 and v35.Missions
                v36 = Missions_9 and Missions_9[n]
                Stars = v36 and v36.Stars
                v33 = math.max(if type(Stars) ~= "number" then 0 else math.max(math.floor(Stars), 0), 1)
            end
            v32.stars = v33
            Description = m.Description or v30 or v2.Description or ("Mission %*"):format(n)
            v32.subtitle = Description
            v32.title = Title_5
            v32.unlocksAt = UnixTimestamp
            v32.xpMultiplier = m.XPMultiplier or 1
            v13[n] = v32
        end
        Cutscenes = v2.Cutscenes or {}
        v14 = table.create(#Cutscenes)
        v15 = table.create(#v13 + #Cutscenes)
        for i5, i6 in v13 do
            table.insert(v15, {entry = i6, order = i5 * 100})
        end
        v17 = nil
        v18 = nil
        for i7, i8 in Cutscenes, v17, v18 do
            if not i8.Hidden then
                Missions_3 = v2.Missions
                AfterMission = i8.AfterMission
                v21 = if type(AfterMission) ~= "number" then nil else if AfterMission < 0 then nil else if AfterMission % 1 == 0 then if not (AfterMission > 0) then AfterMission else if Missions_3[AfterMission] ~= nil then AfterMission else nil else nil
                BeforeMission = i8.BeforeMission
                v23 = false
                if type(BeforeMission) == "number" then
                    v23 = false
                    if BeforeMission > 0 then
                        v23 = false
                        if BeforeMission % 1 == 0 then
                            v23 = v2.Missions[BeforeMission] ~= nil
                        end
                    end
                end
                if not (i8.UnlockOnMissionStart == true) then
                    v25 = false
                    if v21 ~= nil then
                        v25 = true
                        if v21 ~= 0 then
                            Chapters_4 = v1 and v1.Chapters
                            v27 = Chapters_4 and Chapters_4[k]
                            Missions_5 = v27 and v27.Missions
                            v25 = false
                            if Missions_5 ~= nil then
                                v25 = Missions_5[v21] ~= nil
                            end
                        end
                    end
                else
                    v25 = v23
                    if v25 then
                        Chapters_2 = v1 and v1.Chapters
                        v29 = Chapters_2 and Chapters_2[k]
                        Missions_4 = v29 and v29.Missions
                        v26 = false
                        if Missions_4 ~= nil then
                            v26 = Missions_4[BeforeMission] ~= nil
                        end
                        if not v26 then
                            Chapters_3 = v1 and v1.Chapters
                            v27 = Chapters_3 and Chapters_3[k]
                            StartedMissions = v27 and v27.StartedMissions
                            v25 = false
                            if StartedMissions ~= nil then
                                v25 = StartedMissions[BeforeMission] == true
                            end
                        else
                            v25 = true
                        end
                    end
                end
                v26 = v8 and v25
                v27 = if not v24 then v21 else BeforeMission
                v29 = if not v27 then nil else if not (v27 > 0) then nil else v2.Missions[v27]
                Title_3 = if not v29 then nil else v29.Title or ("Mission %*"):format(v27)
                v31 = if not v26 then if v8 then if not v24 then if not v24 then if v21 ~= nil then if not Title_3 then "Complete the previous mission to unlock." else ("Complete %* to unlock."):format(Title_3) else "This cutscene is unavailable." else "This cutscene is unavailable." else if not Title_3 then if not v24 then if v21 ~= nil then if not Title_3 then "Complete the previous mission to unlock." else ("Complete %* to unlock."):format(Title_3) else "This cutscene is unavailable." else "This cutscene is unavailable." else ("Start %* to unlock."):format(Title_3) else v11 else nil
                v32 = {
                    kind = "Cutscene",
                    afterMission = v21 or 0,
                    chapterNumber = k,
                    cutsceneNumber = i7,
                    id = ("chapter-%*-cutscene-%*"):format(k, i7),
                    locked = not v26,
                    lockReason = v31,
                }
                Image = i8.Image or v2.Image or 102445581890397
                v32.mapImage = Image
                v32.subtitle = i8.Description or "Cutscene"
                Title_4 = i8.Title or ("Cutscene %*"):format(i7)
                v32.title = Title_4
                v32.tutorialIntro = i8.TutorialIntro == true
                table.insert(v14, v32)
                v34 = {entry = v32}
                v35 = if not v23 then (v21 or 0) * 100 + i7 else BeforeMission * 100 - 1 + i7 / 100
                v34.order = v35
                table.insert(v15, v34)
            end
        end
        table.sort(v15, function(a1, a2) -- Line: 470
            return a1.order < a2.order
        end)
        v16 = table.create(#v15)
        for i9, i10 in v15 do
            v16[i9] = i10.entry
        end
        v17 = {chapterNumber = k, completedMissions = v12, cutscenes = v14, entries = v16}
        Id = v2.Id or ("chapter-%*"):format(k)
        v17.id = Id
        v17.image = v2.Image or 102445581890397
        v17.locked = not v8
        v17.lockReason = v11
        v17.missions = v13
        v17.title = Title
        v17.totalMissions = #v2.Missions
        v38[j] = v17
    end
    return v38
end

function u28.getNextUnlockAt(a1) -- Line: 497 -- types: a1: table
    local v1, v2
    local unlocksAt = nil
    local v3 = nil
    local v4 = nil
    for i, j in a1, v3, v4 do
        v1 = nil
        v2 = nil
        for k, n in j.missions, v1, v2 do
            if n.unlocksAt then
                if unlocksAt == nil or n.unlocksAt < unlocksAt then
                    unlocksAt = n.unlocksAt
                end
            end
        end
    end
    return unlocksAt
end

function u28.getDefinitions() -- Line: 511 -- upvalues: u27 (ref), Content (val)
    local v1
    if u27 then
        return u27
    end
    local v2 = {}
    for i, j in (Content("Gamemodes"):WaitForChild("StoryMode")):WaitForChild("Chapters"):GetChildren() do
        if j:IsA("ModuleScript") then
            v1 = tonumber((string.match(j.Name, "%d+")))
            if v1 then
                v2[v1] = (require(j))
            else
                warn((("[NewMatchmaking] Ignoring Story Mode module \"%*\" without a chapter number"):format(j.Name)))
            end
        end
    end
    u27 = v2
    return v2
end

function u28.getSections(a1, a2, a3, a4) -- Line: 540
    -- upvalues: u28 (val)
    return u28.buildSections(u28.getDefinitions(), a1, a2, a3, a4)
end

return u28