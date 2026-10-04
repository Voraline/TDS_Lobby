-- Script path: ReplicatedStorage.Client.Controllers.Game.LeaderboardDisplayController
-- Decompile time: 12.37 ms

local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local Sift = require(ReplicatedStorage.Packages.Sift)
local v1 = {}
local u25 = {}
local u26 = {}
local u27 = {}
local u28 = {}
local Leaderboard = NewNetwork.Channel("Leaderboard")
local updateBoardModel = nil

local function onDailyLeaderboardModelAdded(a1) -- Line: 16
    -- upvalues: Players (val), u25 (val), updateBoardModel (ref), u27 (ref)
    local Triumphs = a1:FindFirstChild("Triumphs")
    if not Triumphs then
        return
    end
    local DisplayGui = Triumphs:FindFirstChild("DisplayGui")
    if not DisplayGui then
        return
    end
    DisplayGui.ResetOnSpawn = false
    DisplayGui.Adornee = DisplayGui.Parent
    DisplayGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    local Day = DisplayGui:FindFirstChild("Day")
    if Day then
        Day.Text = ("%* Highscore"):format((DateTime.now():FormatUniversalTime("dddd", "en-us")))
    end
    local Container = DisplayGui:FindFirstChild("Container")
    local Bin = Container and Container:FindFirstChild("Bin")
    local Template = Bin and Bin:FindFirstChild("Template")
    if not Template then
        return
    end
    Template.Visible = false
    u25[a1] = {template = Template, scrollingFrame = Bin, items = {}}
    updateBoardModel(a1, u25, u27)
end

local function onMonthlyLeaderboardModelAdded(a1) -- Line: 56
    -- upvalues: Players (val), u26 (val), updateBoardModel (ref), u28 (ref)
    local Triumphs = a1:FindFirstChild("Triumphs")
    if not Triumphs then
        return
    end
    local DisplayGui = Triumphs:FindFirstChild("DisplayGui")
    if not DisplayGui then
        return
    end
    DisplayGui.ResetOnSpawn = false
    DisplayGui.Adornee = DisplayGui.Parent
    DisplayGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    local Month = DisplayGui:FindFirstChild("Month")
    if Month then
        local v1 = DateTime.now()
        Month.Text = ("%* %*"):format(v1:FormatUniversalTime("MMMM", "en-us"), (v1:FormatUniversalTime("YYYY", "en-us")))
    end
    local Container = DisplayGui:FindFirstChild("Container")
    local Bin = Container and Container:FindFirstChild("Bin")
    local Template = Bin and Bin:FindFirstChild("Template")
    if not Template then
        return
    end
    Template.Visible = false
    u26[a1] = {template = Template, scrollingFrame = Bin, items = {}}
    updateBoardModel(a1, u26, u28)
end

function updateBoardModel(a1, a2, a3) -- Line: 97 -- upvalues: Players (val), Sift (val)
    local v1, value_2
    if not a2[a1] then
        return
    end
    local items = a2[a1].items
    local v2 = nil
    local v3 = nil
    for i, j in a3, v2, v3 do
        value_2 = if typeof(j.value) ~= "table" then {} else j.value
        if items[j.key] then
            v1 = items[j.key]
            v1.LayoutOrder = i
            v1.Title.Rank.Text = ("#%*"):format(i)
            v1.Stats.Level.Value.Text = value_2.level or 0
            v1.Stats.Triumphs.Value.Text = j.sortKey
        else
            local u57 = v4[v5].template:Clone()
            u57.Name = "PlayerId:#" .. j.key
            u57.LayoutOrder = i
            u57.Title.Rank.Text = ("#%*"):format(i)
            u57.Title.Username.Text = ("Player#%*"):format(j.key)
            task.spawn(function() -- Line: 112 -- upvalues: u57 (val), Players (upval), j (val)
                pcall(function() -- Line: 113 -- upvalues: u57 (upval), Players (upval), j (upval)
                    u57.Title.Username.Text = Players:GetNameFromUserIdAsync((tonumber(j.key)))
                end)
            end)
            u57.Icon.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(j.key)
            u57.Stats.Level.Value.Text = value_2.level or 0
            u57.Stats.Triumphs.Value.Text = j.sortKey
            u57.Parent = v4[v5].scrollingFrame
            u57.Visible = true
            items[j.key] = u57
        end
    end
    for k, n in items do
        if not Sift.Array.findWhere(v6, function(a1) -- Line: 135 -- upvalues: k (val)
            local v1
            if a1.key == k then
                v1 = true
            else
                v1 = false
            end
            return v1
        end) then
            n:Destroy()
            items[k] = nil
        end
    end
end

local function updateDailyBoards() -- Line: 146 -- upvalues: u25 (val), updateBoardModel (ref), u27 (ref)
    for i in u25 do
        updateBoardModel(i, u25, u27)
    end
end

local function updateMonthlyBoards() -- Line: 152 -- upvalues: u26 (val), updateBoardModel (ref), u28 (ref)
    for i in u26 do
        updateBoardModel(i, u26, u28)
    end
end

function v1.init() -- Line: 158
    -- upvalues: CollectionService (val), onDailyLeaderboardModelAdded (val), onMonthlyLeaderboardModelAdded (val)
    -- upvalues: u25 (val), u26 (val), Leaderboard (val), u27 (ref), updateBoardModel (ref), u28 (ref), Sift (val)
    (CollectionService:GetInstanceAddedSignal("DailyTriumphLeaderboard")):Connect(onDailyLeaderboardModelAdded)
    for i, j in CollectionService:GetTagged("DailyTriumphLeaderboard") do
        onDailyLeaderboardModelAdded(j)
    end
    ;(CollectionService:GetInstanceAddedSignal("MonthlyTriumphLeaderboard")):Connect(onMonthlyLeaderboardModelAdded)
    for k, n in CollectionService:GetTagged("MonthlyTriumphLeaderboard") do
        onMonthlyLeaderboardModelAdded(n)
    end
    ;(CollectionService:GetInstanceRemovedSignal("DailyTriumphLeaderboard")):Connect(function(a1) -- Line: 172 -- upvalues: u25 (upval) -- types: a1: userdata
        u25[a1] = nil
    end)
    ;(CollectionService:GetInstanceRemovedSignal("MonthlyTriumphLeaderboard")):Connect(function(a1) -- Line: 177 -- upvalues: u26 (upval) -- types: a1: userdata
        u26[a1] = nil
    end)
    Leaderboard:onEvent("LeaderboardDailyUpdated", function(a1) -- Line: 181 -- upvalues: u27 (upval), u25 (upval), updateBoardModel (upval)
        u27 = a1 or {}
        table.sort(u27, function(a1, a2) -- Line: 183
            return a2.sortKey < a1.sortKey
        end)
        for i in u25 do
            updateBoardModel(i, u25, u27)
        end
    end)
    Leaderboard:onEvent("LeaderboardMonthlyUpdated", function(a1) -- Line: 189 -- upvalues: u28 (upval), u26 (upval), updateBoardModel (upval)
        u28 = a1 or {}
        table.sort(u28, function(a1, a2) -- Line: 191
            return a2.sortKey < a1.sortKey
        end)
        for i in u26 do
            updateBoardModel(i, u26, u28)
        end
    end)
    Leaderboard:onEvent("LeaderboardDailyKeyUpdated", function(a1, a2) -- Line: 199
        -- upvalues: Sift (upval), u27 (upval), u25 (upval), updateBoardModel (upval)
        if not a2 then
            return
        end
        local v1 = u27
        local v2 = Sift.Array.findWhere(v1, function(a1_2) -- Line: 204 -- upvalues: a1 (val)
            return a1_2.key == a1
        end)
        if not v2 then
            table.insert(u27, a2)
        else
            u27[v2] = a2
        end
        table.sort(u27, function(a1, a2) -- Line: 214
            return a2.sortKey < a1.sortKey
        end)
        for i in u25 do
            updateBoardModel(i, u25, u27)
        end
    end)
    Leaderboard:onEvent("LeaderboardMonthlyKeyUpdated", function(a1, a2) -- Line: 223
        -- upvalues: Sift (upval), u28 (upval), u26 (upval), updateBoardModel (upval)
        if not a2 then
            return
        end
        local v1 = u28
        local v2 = Sift.Array.findWhere(v1, function(a1_2) -- Line: 228 -- upvalues: a1 (val)
            return a1_2.key == a1
        end)
        if not v2 then
            table.insert(u28, a2)
        else
            u28[v2] = a2
        end
        table.sort(u28, function(a1, a2) -- Line: 238
            return a2.sortKey < a1.sortKey
        end)
        for i in u26 do
            updateBoardModel(i, u26, u28)
        end
    end)
    task.spawn(function() -- Line: 245
        -- upvalues: Leaderboard (upval), u27 (upval), u28 (upval), u25 (upval), updateBoardModel (upval), u26 (upval)
        local v1 = Leaderboard:invokeServer("Request")
        if not v1 then
            return
        end
        u27 = v1.Daily or {}
        u28 = v1.Monthly or {}
        table.sort(u27, function(a1, a2) -- Line: 254
            return a2.sortKey < a1.sortKey
        end)
        table.sort(u28, function(a1, a2) -- Line: 257
            return a2.sortKey < a1.sortKey
        end)
        for i in u25 do
            updateBoardModel(i, u25, u27)
        end
        for j in u26 do
            updateBoardModel(j, u26, u28)
        end
    end)
end

task.spawn(v1.init)
return v1