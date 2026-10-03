-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Utility.EnemyGameModeLookup
-- Decompile time: 11.82 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local EnemyGameModeDisplay = require(script.Parent.EnemyGameModeDisplay)
local Gamemodes = Content("Gamemodes")
local u28 = {Special = true}
local u29 = {
    Easy = true,
    Casual = true,
    Intermediate = true,
    Molten = true,
    Fallen = true,
    Frost = true,
    Hardcore = true,
    Voidcore = true,
    PVP = true,
}
local u30 = {}
local u31 = {}
local u32 = {}
local u33 = {}
local u34 = {}
local u35 = {}
local u36 = {}
local u37 = {}
local u38 = {}
local u39 = {}
local u40 = {}
local u41 = {}
local u42 = {}
local u43 = {}
local u44 = nil
local u45 = nil
local u46 = false
local u47 = 0

local function copyArray(a1) -- Line: 46 -- types: a1: table?
    local v1 = {}
    for i, j in a1 or {} do
        table.insert(v1, j)
    end
    return v1
end

local function insertUnique(a1, a2) -- Line: 56 -- types: a1: table, a2: string
    if not table.find(a1, a2) then
        table.insert(a1, a2)
    end
end

local function resetIndexes() -- Line: 62
    -- upvalues: u30 (ref), u31 (ref), u32 (ref), u33 (ref), u34 (ref), u35 (ref), u36 (ref), u37 (ref), u38 (ref)
    -- upvalues: u39 (ref), u40 (ref), u41 (ref), u42 (ref)
    u30 = {}
    u31 = {}
    u32 = {}
    u33 = {}
    u34 = {}
    u35 = {}
    u36 = {}
    u37 = {}
    u38 = {}
    u39 = {}
    u40 = {}
    u41 = {}
    u42 = {}
end

local function isGamemodeType(a1, a2) -- Line: 78
    local v1 = false
    if a1 ~= nil then
        v1 = (tostring(a1)) == tostring(a2)
    end
    return v1
end

local function setModeType(a1, a2) -- Line: 82 -- upvalues: Enum (val), u33 (ref) -- types: a1: string
    local v1 = false
    if a2 ~= nil then
        v1 = (tostring(a2)) == tostring(Enum.GamemodeType.Evergreen)
    end
    if v1 then
        u33[a1] = Enum.GamemodeType.Evergreen
        return
    end
    if u33[a1] == nil then
        u33[a1] = a2
    end
end

local function getEntryData(a1, a2) -- Line: 90 -- types: a1: string
    if typeof(a2) ~= "table" then
        return nil, nil
    end
    if a2.Enemies == nil then
        return a1, a2
    end
    local DisplayName = a2.DisplayName or a2.Name or a1
    return DisplayName, a2.Enemies
end

local function canShowLockedEnemies(a1, a2) -- Line: 103 -- upvalues: Enum (val), u28 (val) -- types: a1: string
    if typeof(a2) ~= "table" then
        return false
    end
    local GamemodeType = a2.GamemodeType
    local v1 = false
    if GamemodeType ~= nil then
        v1 = (tostring(GamemodeType)) == tostring(Enum.GamemodeType.Evergreen)
    end
    if not v1 then
        v1 = u28[a1] == true
    end
    return v1
end

local function isCoreEvergreenMode(a1, a2) -- Line: 112 -- upvalues: Enum (val), u29 (val) -- types: a1: string
    if typeof(a2) ~= "table" then
        return false
    end
    local GamemodeType = a2.GamemodeType
    local v1 = false
    if GamemodeType ~= nil then
        v1 = (tostring(GamemodeType)) == tostring(Enum.GamemodeType.Evergreen)
    end
    if v1 then
        v1 = u29[a1] == true
    end
    return v1
end

local function insertAlwaysVisibleLockedEnemy(a1) -- Line: 121 -- upvalues: u41 (ref), u40 (ref) -- types: a1: string
    if u41[a1] then
        return
    end
    u41[a1] = true
    table.insert(u40, a1)
end

local function formatAppearsInText(a1) -- Line: 130
    -- upvalues: u46 (ref), u31 (ref), u32 (ref), u30 (ref), u38 (ref), u39 (ref), u37 (ref), EnemyGameModeDisplay (val)
    if not u46 then
        return ""
    end
    local v1 = u31[a1] or {}
    local v2 = u32[a1] or {}
    local v3 = u30
    local v4 = nil
    if u38[a1] and #u38[a1] > 0 then
        v1 = u38[a1]
        v2 = u39[a1] or {}
        v3 = u37
        v4 = "all evergreen modes"
    end
    local v5 = #v3
    if v5 == 0 then
        return ""
    end
    local v6 = {}
    for i, j in v3 do
        if not v2[j] then
            table.insert(v6, j)
        end
    end
    return EnemyGameModeDisplay.formatAppearsInText(v1, v6, v5, v4)
end

local function rebuildIndexes(a1) -- Line: 163
    -- upvalues: resetIndexes (val), u30 (ref), Enum (val), u33 (ref), u29 (val), u34 (ref), u37 (ref), u31 (ref)
    -- upvalues: u32 (ref), u35 (ref), u36 (ref), u38 (ref), u39 (ref), u28 (val), u41 (ref), u40 (ref)
    -- upvalues: EnemyGameModeDisplay (val)
    local DisplayName, Enemies, GamemodeType, GamemodeType_3, GamemodeType_5, GamemodeType_7, v1, v2, v3, v4, v5, v6, v7, v8, v9
    resetIndexes()
    local v10 = nil
    local v11 = nil
    for i, j in a1, v10, v11 do
        if typeof(j) == "table" then
            v8 = nil
            v9 = nil
            for k, n in j, v8, v9 do
                if typeof(n) ~= "table" then
                    DisplayName = nil
                    Enemies = nil
                elseif n.Enemies == nil then
                    DisplayName = k
                    Enemies = n
                else
                    DisplayName = n.DisplayName or n.Name or k
                    Enemies = n.Enemies
                end
                if DisplayName and typeof(Enemies) == "table" then
                    v1 = u30
                    if not table.find(v1, DisplayName) then
                        table.insert(v1, DisplayName)
                    end
                    GamemodeType = n.GamemodeType
                    v2 = false
                    if GamemodeType ~= nil then
                        v2 = (tostring(GamemodeType)) == tostring(Enum.GamemodeType.Evergreen)
                    end
                    if v2 then
                        u33[DisplayName] = Enum.GamemodeType.Evergreen
                    elseif u33[DisplayName] == nil then
                        u33[DisplayName] = GamemodeType
                    end
                    GamemodeType_3 = n.GamemodeType
                    v1 = false
                    if GamemodeType_3 ~= nil then
                        v1 = (tostring(GamemodeType_3)) == tostring(Enum.GamemodeType.Evergreen)
                    end
                    if typeof(n) == "table" then
                        GamemodeType_5 = n.GamemodeType
                        v2 = false
                        if GamemodeType_5 ~= nil then
                            v2 = (tostring(GamemodeType_5)) == tostring(Enum.GamemodeType.Evergreen)
                        end
                        if v2 then
                            v2 = u29[DisplayName] == true
                        end
                    else
                        v2 = false
                    end
                    if v1 then
                        v3 = u34
                        if not table.find(v3, DisplayName) then
                            table.insert(v3, DisplayName)
                        end
                    end
                    if v2 then
                        v3 = u37
                        if not table.find(v3, DisplayName) then
                            table.insert(v3, DisplayName)
                        end
                    end
                    v4 = nil
                    v5 = nil
                    for m, i5 in Enemies, v4, v5 do
                        v6 = u31
                        v7 = u31[i5] or {}
                        v6[i5] = v7
                        v6 = u32
                        v7 = u32[i5] or {}
                        v6[i5] = v7
                        v6 = u31[i5]
                        if not table.find(v6, DisplayName) then
                            table.insert(v6, DisplayName)
                        end
                        v6 = u32[i5]
                        v6[DisplayName] = true
                        if v1 then
                            v6 = u35
                            v7 = u35[i5] or {}
                            v6[i5] = v7
                            v6 = u36
                            v7 = u36[i5] or {}
                            v6[i5] = v7
                            v6 = u35[i5]
                            if not table.find(v6, DisplayName) then
                                table.insert(v6, DisplayName)
                            end
                            v6 = u36[i5]
                            v6[DisplayName] = true
                        end
                        if v2 then
                            v6 = u38
                            v7 = u38[i5] or {}
                            v6[i5] = v7
                            v6 = u39
                            v7 = u39[i5] or {}
                            v6[i5] = v7
                            v6 = u38[i5]
                            if not table.find(v6, DisplayName) then
                                table.insert(v6, DisplayName)
                            end
                            v6 = u39[i5]
                            v6[DisplayName] = true
                        end
                        if typeof(n) == "table" then
                            GamemodeType_7 = n.GamemodeType
                            v6 = false
                            if GamemodeType_7 ~= nil then
                                v6 = (tostring(GamemodeType_7)) == tostring(Enum.GamemodeType.Evergreen)
                            end
                            if not v6 then
                                v6 = u28[i] == true
                            end
                        else
                            v6 = false
                        end
                        if v6 and not u41[i5] then
                            u41[i5] = true
                            table.insert(u40, i5)
                        end
                    end
                end
            end
        end
    end
    table.sort(u30, EnemyGameModeDisplay.sortModeNames)
    table.sort(u34, EnemyGameModeDisplay.sortModeNames)
    table.sort(u37, EnemyGameModeDisplay.sortModeNames)
    table.sort(u40)
    for i6, i7 in u31 do
        table.sort(i7, EnemyGameModeDisplay.sortModeNames)
    end
    for i8, i9 in u35 do
        table.sort(i9, EnemyGameModeDisplay.sortModeNames)
    end
    for i10, i11 in u38 do
        table.sort(i11, EnemyGameModeDisplay.sortModeNames)
    end
end

local function notify() -- Line: 239 -- upvalues: u47 (ref), u43 (val)
    u47 = u47 + 1
    for i in u43 do
        task.defer(i, u47)
    end
end

local function loadMapping(a1) -- Line: 247
    -- upvalues: u46 (ref), u45 (ref), HttpService (val), rebuildIndexes (val), u47 (ref), u43 (val)
    if a1 and a1:IsA("StringValue") then
        local Value = a1.Value
        if u46 and Value == u45 then
            return true
        end
        local success, result = pcall(HttpService.JSONDecode, HttpService, Value)
        if success and typeof(result) == "table" then
            u45 = Value
            rebuildIndexes(result)
            u46 = true
            u47 = u47 + 1
            for i in u43 do
                task.defer(i, u47)
            end
            return true
        end
        warn((("Failed to decode %* for lobby enemy gamemode lookup"):format(a1.Name)))
        return false
    end
    return false
end

local function useMappingValue(a1) -- Line: 271 -- upvalues: u44 (ref), loadMapping (val) -- types: a1: userdata
    if u44 then
        u44:Disconnect()
        u44 = nil
    end
    u44 = (a1:GetPropertyChangedSignal("Value")):Connect(function() -- Line: 277 -- upvalues: loadMapping (upval), a1 (val)
        loadMapping(a1)
    end)
    loadMapping(a1)
end

local LobbyEnemyGameModes = Gamemodes:FindFirstChild("LobbyEnemyGameModes")
if LobbyEnemyGameModes then
    useMappingValue(LobbyEnemyGameModes)
end
Gamemodes.ChildAdded:Connect(function(a1) -- Line: 289 -- upvalues: useMappingValue (val)
    if a1.Name == "LobbyEnemyGameModes" then
        useMappingValue(a1)
    end
end)
return {
    isReady = function() -- Line: 297 -- upvalues: u46 (ref)
        return u46
    end,
    getVersion = function() -- Line: 301 -- upvalues: u47 (ref)
        return u47
    end,
    subscribe = function(a1) -- Line: 305 -- upvalues: u43 (val) -- types: a1: function
        u43[a1] = true
        return function() -- Line: 308 -- upvalues: u43 (upval), a1 (val)
            u43[a1] = nil
        end
    end,
    getModeNames = function() -- Line: 313 -- upvalues: copyArray (val), u30 (ref)
        return (copyArray(u30))
    end,
    getEvergreenModeNames = function() -- Line: 317 -- upvalues: copyArray (val), u34 (ref)
        return (copyArray(u34))
    end,
    getModes = function(a1) -- Line: 321 -- upvalues: copyArray (val), u31 (ref) -- types: a1: string
        return (copyArray(u31[a1]))
    end,
    isEvergreenMode = function(a1) -- Line: 325 -- upvalues: u33 (ref), Enum (val) -- types: a1: string
        local v1 = u33[a1]
        local v2 = false
        if v1 ~= nil then
            v2 = (tostring(v1)) == tostring(Enum.GamemodeType.Evergreen)
        end
        return v2
    end,
    isEventMode = function(a1) -- Line: 329 -- upvalues: u33 (ref), Enum (val) -- types: a1: string
        local v1 = u33[a1]
        local v2 = false
        if v1 ~= nil then
            v2 = (tostring(v1)) == tostring(Enum.GamemodeType.Event)
        end
        return v2
    end,
    getAlwaysVisibleLockedEnemyNames = function() -- Line: 333 -- upvalues: copyArray (val), u40 (ref)
        return (copyArray(u40))
    end,
    getEnemyModesByEnemy = function() -- Line: 337 -- upvalues: u31 (ref), copyArray (val)
        local v1 = {}
        for i, j in u31 do
            v1[i] = (copyArray(j))
        end
        return v1
    end,
    getAppearsInText = function(a1) -- Line: 347 -- upvalues: u42 (ref), formatAppearsInText (val)
        if a1 == nil then
            return ""
        end
        local name = a1.name
        local v1 = u42[name]
        if v1 then
            return v1
        end
        v1 = formatAppearsInText(name)
        u42[name] = v1
        return v1
    end,
}