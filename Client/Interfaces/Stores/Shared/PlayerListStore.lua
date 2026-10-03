-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Shared.PlayerListStore
-- Decompile time: 3.11 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u25 = {
    Username = "",
    DisplayName = "",
    Blocked = false,
    Friended = false,
    Requested = false,
    Verified = false,
    VIP = false,
    UserId = 0,
    Map = "Grass Isle",
    Cash = 0,
    MapsCleared = 0,
    LoginStreak = 0,
    PVPWins = 0,
    PVPLosses = 0,
    EnemiesSent = 0,
    EnemiesKilled = 0,
    Rank = -1,
    Team = Enum.Team.Player,
}
u25.Towers = {"Accelerator", "Accelerator", "Accelerator", "Accelerator"}
u25.Medals = {Easy = 0, Normal = 0, Insane = 0}
u25.Stats = {Cash = 0, Triumphs = 0, Deaths = 0, Level = 0}
local u42, u43 = Charm.signal({
    showProfile = false,
    visible = true,
    players = {},
    contentSize = Vector2.zero,
    absolutePosition = Vector2.zero,
    absoluteSize = Vector2.zero,
})
local v1 = {getState = u42}

local function sortPlayers(a1) -- Line: 96 -- upvalues: table (val) -- types: a1: table
    table.sort(a1, function(a1, a2) -- Line: 97
        if a1.Stats.Level == a2.Stats.Level then
            return a1.DisplayName < a2.DisplayName
        end
        return a2.Stats.Level < a1.Stats.Level
    end)
end

local function setStateKey(a1, a2) -- Line: 106 -- upvalues: u42 (val), table (val), u43 (val) -- types: a1: string
    local v1 = u42()
    if v1[a1] == a2 then
        return
    end
    local v2 = table.clone(v1)
    v2[a1] = a2
    u43(v2)
end

function v1.showProfile(a1) -- Line: 117 -- upvalues: u42 (val), table (val), u43 (val) -- types: a1: boolean
    local v1 = u42()
    if v1.showProfile == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.showProfile = a1
    u43(v2)
end

function v1.selectProfile(a1) -- Line: 121 -- upvalues: u42 (val), table (val), u43 (val) -- types: a1: number?
    local v1 = u42()
    if v1.selected == a1 then
        local showProfile = v1.showProfile
        if showProfile == (a1 ~= nil) then
            return
        end
    end
    local v2 = table.clone(v1)
    v2.selected = a1
    v2.showProfile = a1 ~= nil
    u43(v2)
end

function v1.selectUser(a1) -- Line: 133 -- upvalues: u42 (val), table (val), u43 (val) -- types: a1: number?
    local v1 = u42()
    if v1.selected == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.selected = a1
    u43(v2)
end

function v1.update(a1) -- Line: 137
    -- upvalues: u42 (val), table (val), Players (val), u25 (val), u43 (val)
    local v1 = u42()
    local v2 = false
    local v3 = table.deepClone(v1.players)
    for i, j in v3 do
        if j.UserId == a1.UserId then
            v3[i] = (table.deepClone(a1))
            v2 = true
            break
        end
    end
    if not v2 and Players:GetPlayerByUserId(a1.UserId) then
        v2 = true
        table.insert(v3, table.deepClone(table.merge({}, u25, a1)))
    end
    if not v2 then
        return
    end
    table.sort(v3, function(a1, a2) -- Line: 97
        if a1.Stats.Level == a2.Stats.Level then
            return a1.DisplayName < a2.DisplayName
        end
        return a2.Stats.Level < a1.Stats.Level
    end)
    local v4 = table.clone(v1)
    v4.players = v3
    u43(v4)
end

function v1.remove(a1) -- Line: 166 -- upvalues: u42 (val), table (val), u43 (val) -- types: a1: number
    local v1 = u42()
    local v2 = table.deepClone(v1.players)
    local v3 = false
    for i, j in v2 do
        if j.UserId == a1 then
            v3 = true
            table.remove(v2, i)
            break
        end
    end
    if not v3 then
        return
    end
    local v4 = table.clone(v1)
    v4.players = v2
    u43(v4)
end

function v1.setPlayers(a1) -- Line: 188 -- upvalues: table (val), u42 (val), u43 (val) -- types: a1: table
    local v1 = table.deepClone(a1)
    table.sort(v1, function(a1, a2) -- Line: 97
        if a1.Stats.Level == a2.Stats.Level then
            return a1.DisplayName < a2.DisplayName
        end
        return a2.Stats.Level < a1.Stats.Level
    end)
    local v2 = table.clone(u42())
    v2.players = v1
    u43(v2)
end

function v1.setPlayerlistVisible(a1) -- Line: 197 -- upvalues: u42 (val), table (val), u43 (val) -- types: a1: boolean
    local v1 = u42()
    if v1.visible == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.visible = a1
    u43(v2)
end

function v1.setPlayerListContentSize(a1) -- Line: 201
    -- upvalues: u42 (val), table (val), u43 (val)
    local v1 = u42()
    if v1.contentSize == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.contentSize = a1
    u43(v2)
end

function v1.setPlayerListAbsolutePosition(a1) -- Line: 205
    -- upvalues: u42 (val), table (val), u43 (val)
    local v1 = u42()
    if v1.absolutePosition == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.absolutePosition = a1
    u43(v2)
end

function v1.setPlayerListAbsoluteSize(a1) -- Line: 209
    -- upvalues: u42 (val), table (val), u43 (val)
    local v1 = u42()
    if v1.absoluteSize == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.absoluteSize = a1
    u43(v2)
end

return v1