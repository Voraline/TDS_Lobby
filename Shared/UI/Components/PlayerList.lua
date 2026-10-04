-- Script path: ReplicatedStorage.Shared.UI.Components.PlayerList
-- Decompile time: 5.86 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer
local Charm = require(ReplicatedStorage.Packages.Charm)
local u22, u23 = Charm.signal({})
local u26, u27 = Charm.signal({})
local u30, u31 = Charm.signal({})

local function addUnique(a1, a2, a3) -- Line: 13 -- types: a3: userdata
    local v1 = a1()
    if table.find(v1, a3) then
        return
    end
    local v2 = table.clone(v1)
    table.insert(v2, a3)
    a2(v2)
end

local function removePlayer(a1, a2, a3) -- Line: 24 -- types: a3: userdata
    local v1 = a1()
    local v2 = table.find(v1, a3)
    if not v2 then
        return
    end
    local v3 = table.clone(v1)
    table.remove(v3, v2)
    a2(v3)
end

local function getCore(a1) -- Line: 36 -- upvalues: StarterGui (val) -- types: a1: string
    local success, result = pcall(function() -- Line: 37 -- upvalues: StarterGui (upval), a1 (val)
        return StarterGui:GetCore(a1)
    end)
    if success then
        return result
    end
    return nil
end

local function connectCoreEvent(a1, a2) -- Line: 44 -- upvalues: StarterGui (val) -- types: a1: string, a2: function
    local success, result = pcall(function() -- Line: 37 -- upvalues: StarterGui (upval), a1 (val)
        return StarterGui:GetCore(a1)
    end)
    local u7 = if not success then nil else result
    pcall(function() -- Line: 46 -- upvalues: u7 (val), a2 (val)
        u7.Event:Connect(a2)
    end)
end

local function getBlockedUserIds() -- Line: 51 -- upvalues: LocalPlayer (val), StarterGui (val)
    local v1
    if LocalPlayer.UserId <= 0 then
        return nil
    end
    local u5 = "GetBlockedUserIds"
    local success, result = pcall(function() -- Line: 37 -- upvalues: StarterGui (upval), u5 (val)
        return StarterGui:GetCore(u5)
    end)
    if typeof(if not success then nil else result) ~= "table" then
        return nil
    end
    return v1
end

local function syncBlockedPlayers() -- Line: 64
    -- upvalues: LocalPlayer (val), StarterGui (val), Players (val), u31 (val)
    local v1, v2
    if not (LocalPlayer.UserId <= 0) then
        local u5 = "GetBlockedUserIds"
        local success, result = pcall(function() -- Line: 37 -- upvalues: StarterGui (upval), u5 (val)
            return StarterGui:GetCore(u5)
        end)
        v2 = if not success then nil else result
        v1 = if typeof(v2) == "table" then v2 else nil
    else
        v1 = nil
    end
    if not v1 then
        return
    end
    v2 = {}
    for i, j in Players:GetPlayers() do
        if j ~= LocalPlayer and table.find(v1, j.UserId) then
            table.insert(v2, j)
        end
    end
    u31(v2)
end

local function u38(a1) -- Line: 80 -- upvalues: u30 (val), u31 (val)
    local v1 = u30()
    if table.find(v1, a1) then
        return
    end
    local v2 = table.clone(v1)
    table.insert(v2, a1)
    u31(v2)
end

local u40 = "PlayerBlockedEvent"
local success, result = pcall(function() -- Line: 37 -- upvalues: StarterGui (val), u40 (val)
    return StarterGui:GetCore(u40)
end)
local u45 = if not success then nil else result
pcall(function() -- Line: 46 -- upvalues: u45 (val), u38 (val)
    u45.Event:Connect(u38)
end)

local function u51(a1) -- Line: 84 -- upvalues: removePlayer (val), u30 (val), u31 (val)
    removePlayer(u30, u31, a1)
end

local u56 = "PlayerUnblockedEvent"
local success_2, result_2 = pcall(function() -- Line: 37 -- upvalues: StarterGui (val), u56 (val)
    return StarterGui:GetCore(u56)
end)
local u62 = if not success_2 then nil else result_2
pcall(function() -- Line: 46 -- upvalues: u62 (val), u51 (val)
    u62.Event:Connect(u51)
end)
pcall(function() -- Line: 89 -- upvalues: StarterGui (val), u22 (val), u23 (val), removePlayer (val)
    (StarterGui:GetCore("PlayerFriendedEvent")).Event:Connect(function(a1) -- Line: 90 -- upvalues: u22 (upval), u23 (upval)
        local v1 = u22()
        if table.find(v1, a1) then
            return
        end
        local v2 = table.clone(v1)
        table.insert(v2, a1)
        u23(v2)
    end)
    ;(StarterGui:GetCore("PlayerUnfriendedEvent")).Event:Connect(function(a1) -- Line: 94 -- upvalues: removePlayer (upval), u22 (upval), u23 (upval)
        removePlayer(u22, u23, a1)
    end)
end)

local function addPlayer(a1) -- Line: 100
    -- upvalues: u26 (val), u27 (val), LocalPlayer (val), u22 (val), u23 (val), syncBlockedPlayers (val)
    local v1 = u26()
    if not table.find(v1, a1) then
        local v2 = table.clone(v1)
        table.insert(v2, a1)
        u27(v2)
    end
    pcall(function() -- Line: 103 -- upvalues: a1 (val), LocalPlayer (upval), u22 (upval), u23 (upval)
        if a1 ~= LocalPlayer and a1:IsFriendsWith(LocalPlayer.UserId) then
            local v1 = a1
            local v2 = u22()
            if table.find(v2, v1) then
                return
            end
            local v3 = table.clone(v2)
            table.insert(v3, v1)
            u23(v3)
        end
    end)
    syncBlockedPlayers()
end

for i, j in Players:GetPlayers() do
    task.spawn(addPlayer, j)
end
Players.PlayerAdded:Connect(addPlayer)
Players.PlayerRemoving:Connect(function(a1) -- Line: 117
    -- upvalues: removePlayer (val), u26 (val), u27 (val), u22 (val), u23 (val), u30 (val), u31 (val)
    removePlayer(u26, u27, a1)
    removePlayer(u22, u23, a1)
    removePlayer(u30, u31, a1)
end)
return {getPlayers = u26, getFriends = u22, getBlocked = u30}