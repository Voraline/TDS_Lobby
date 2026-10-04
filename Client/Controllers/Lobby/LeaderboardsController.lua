-- Script path: ReplicatedStorage.Client.Controllers.Lobby.LeaderboardsController
-- Decompile time: 9.16 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local Sift = require(ReplicatedStorage.Packages.Sift)
local v1 = {}
local u20 = {
    Triumphs = {modelName = "TriumphMonthlyLeaderboard", partName = "Triumphs"},
    Experience = {modelName = "ExpMonthlyLeaderboard", partName = "Experience"},
}
local u23 = {}
local u24 = {}
local LobbyLeaderboard = NewNetwork.Channel("LobbyLeaderboard")
for i in u20 do
    u23[i] = {}
    u24[i] = {}
end

local function onLeaderboardModelAdded(a1, a2) -- Line: 34
    -- upvalues: u20 (val), Players (val), u23 (val)
    local v1 = a2:FindFirstChild(u20[a1].partName)
    if not v1 then
        return
    end
    local DisplayGui = v1:FindFirstChild("DisplayGui")
    if not DisplayGui then
        return
    end
    DisplayGui.ResetOnSpawn = false
    DisplayGui.Adornee = DisplayGui.Parent
    DisplayGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    local Month = DisplayGui:FindFirstChild("Month")
    if Month then
        local v2 = DateTime.now()
        Month.Text = ("%* %*"):format(v2:FormatUniversalTime("MMMM", "en-us"), (v2:FormatUniversalTime("YYYY", "en-us")))
    end
    local Container = DisplayGui:FindFirstChild("Container")
    local Bin = Container and Container:FindFirstChild("Bin")
    local Template = Bin and Bin:FindFirstChild("Template")
    if Template and Bin then
        Template.Visible = false
        local v3 = u23[a1]
        v3[a2] = {template = Template, scrollingFrame = Bin, items = {}}
        return
    end
end

local function updateBoardModel(a1, a2) -- Line: 73
    -- upvalues: u23 (val), u24 (val), Players (val), Sift (val)
    local v1
    local v2 = u23[a1][a2]
    if not v2 then
        return
    end
    local v3 = u24[a1]
    local items = v2.items
    for i, j in v3 do
        if items[j.key] then
            v1 = items[j.key]
            v1.LayoutOrder = i
            v1.Title.Rank.Text = ("#%*"):format(i)
            v1.Stats.Level.Value.Text = j.value.level
            v1.Stats[a1].Value.Text = j.sortKey
        else
            local u48 = v2.template:Clone()
            u48.Name = "PlayerId:#" .. j.key
            u48.LayoutOrder = i
            u48.Title.Rank.Text = ("#%*"):format(i)
            u48.Title.Username.Text = ("Player#%*"):format(j.key)
            task.spawn(function() -- Line: 90 -- upvalues: u48 (val), Players (upval), j (val)
                pcall(function() -- Line: 91 -- upvalues: u48 (upval), Players (upval), j (upval)
                    u48.Title.Username.Text = Players:GetNameFromUserIdAsync((tonumber(j.key)))
                end)
            end)
            u48.Icon.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(j.key)
            u48.Stats.Level.Value.Text = j.value.level
            u48.Stats[a1].Value.Text = j.sortKey
            u48.Parent = v2.scrollingFrame
            u48.Visible = true
            items[j.key] = u48
        end
    end
    for k, n in items do
        if not Sift.Array.findWhere(v3, function(a1) -- Line: 113 -- upvalues: k (val)
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

local function updateAllBoards(a1) -- Line: 124 -- upvalues: u23 (val), updateBoardModel (val) -- types: a1: string
    for i in u23[a1] do
        updateBoardModel(a1, i)
    end
end

local function applyLeaderboardUpdate(a1, a2) -- Line: 130
    -- upvalues: u24 (val), u23 (val), updateBoardModel (val)
    u24[a1] = a2 or {}
    for i in u23[a1] do
        updateBoardModel(a1, i)
    end
end

local function applyKeyUpdate(a1, a2, a3) -- Line: 135
    -- upvalues: u24 (val), Sift (val), u23 (val), updateBoardModel (val)
    local v1 = u24[a1]
    if not a3 then
        return
    end
    local v2 = Sift.Array.findWhere(v1, function(a1) -- Line: 141 -- upvalues: a2 (val)
        return a1.key == a2
    end)
    if v2 then
        v1[v2] = a3
    else
        table.insert(v1, a3)
    end
    table.sort(v1, function(a1, a2) -- Line: 151
        return a2.sortKey < a1.sortKey
    end)
    for i in u23[a1] do
        updateBoardModel(a1, i)
    end
end

local function tryRegisterModel(a1, a2) -- Line: 158
    -- upvalues: onLeaderboardModelAdded (val), updateBoardModel (val)
    if not a2:IsA("Model") then
        return
    end
    onLeaderboardModelAdded(a1, a2)
    updateBoardModel(a1, a2)
end

function v1.init() -- Line: 167
    -- upvalues: u20 (val), onLeaderboardModelAdded (val), updateBoardModel (val), u23 (val), LobbyLeaderboard (val)
    -- upvalues: u24 (val), applyKeyUpdate (val)
    local v1
    local Leaderboards = (workspace:WaitForChild("Lobby")):FindFirstChild("Leaderboards")
    if not Leaderboards then
        warn("Leaderboards folder not found in workspace.Lobby")
        return
    end
    local v2 = nil
    local v3 = nil
    for i, j in u20, v2, v3 do
        v1 = Leaderboards:FindFirstChild(j.modelName)
        if v1 and v1:IsA("Model") then
            onLeaderboardModelAdded(i, v1)
            updateBoardModel(i, v1)
        end
        Leaderboards.ChildAdded:Connect(function(a1) -- Line: 180 -- upvalues: j (val), i (val), onLeaderboardModelAdded (upval), updateBoardModel (upval)
            if a1.Name == j.modelName then
                local v1 = i
                if not a1:IsA("Model") then
                    return
                end
                onLeaderboardModelAdded(v1, a1)
                updateBoardModel(v1, a1)
            end
        end)
        Leaderboards.ChildRemoved:Connect(function(a1) -- Line: 186 -- upvalues: j (val), u23 (upval), i (val)
            if a1.Name == j.modelName and a1:IsA("Model") then
                local v1 = u23[i]
                v1[a1] = nil
            end
        end)
    end
    LobbyLeaderboard:onEvent("TriumphsMonthlyUpdated", function(a1) -- Line: 193 -- upvalues: u24 (upval), u23 (upval), updateBoardModel (upval)
        u24.Triumphs = a1 or {}
        for i in u23.Triumphs do
            updateBoardModel("Triumphs", i)
        end
    end)
    LobbyLeaderboard:onEvent("ExperienceMonthlyUpdated", function(a1) -- Line: 197 -- upvalues: u24 (upval), u23 (upval), updateBoardModel (upval)
        u24.Experience = a1 or {}
        for i in u23.Experience do
            updateBoardModel("Experience", i)
        end
    end)
    LobbyLeaderboard:onEvent("TriumphsMonthlyKeyUpdated", function(a1, a2) -- Line: 201 -- upvalues: applyKeyUpdate (upval)
        applyKeyUpdate("Triumphs", a1, a2)
    end)
    LobbyLeaderboard:onEvent("ExperienceMonthlyKeyUpdated", function(a1, a2) -- Line: 205 -- upvalues: applyKeyUpdate (upval)
        applyKeyUpdate("Experience", a1, a2)
    end)
    task.spawn(function() -- Line: 209
        -- upvalues: LobbyLeaderboard (upval), u20 (upval), u24 (upval), u23 (upval), updateBoardModel (upval)
        local v1
        local v2 = LobbyLeaderboard:invokeServer("Request")
        if not v2 then
            return
        end
        local v3 = nil
        local v4 = nil
        for i in u20, v3, v4 do
            v1 = v2[i] or {}
            u24[i] = v1 or {}
            for j in u23[i] do
                updateBoardModel(i, j)
            end
        end
    end)
end

task.spawn(v1.init)
return v1