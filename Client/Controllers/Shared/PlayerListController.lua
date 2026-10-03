-- Script path: ReplicatedStorage.Client.Controllers.Shared.PlayerListController
-- Decompile time: 10.58 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local GameType = require(ReplicatedStorage.Shared.Modules.GameType)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
local Charm = require(ReplicatedStorage.Packages.Charm)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local PlayerList = require(ReplicatedStorage.Shared.UI.Components.PlayerList)
local PlayerListStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.PlayerListStore)
local u49 = {}

local function waitForPlayerValue(a1, a2) -- Line: 18 -- types: a1: userdata, a2: string
    local v1 = a1:WaitForChild(a2, 60)
    if v1 and a1.Parent ~= nil then
        return v1
    end
    return nil
end

local function observeSignal(a1, a2) -- Line: 27 -- upvalues: Charm (val) -- types: a2: function
    a2(a1())
    return Charm.subscribe(a1, a2)
end

local function getGameMode() -- Line: 33 -- upvalues: GameState (val)
    return GameState.GameMode or GameState.State and GameState.State.GameMode
end

local function getTowerStateName() -- Line: 37 -- upvalues: GameState (val)
    local GameMode = GameState.GameMode or GameState.State and GameState.State.GameMode
    if GameMode == "PVP" then
        return "EquippedPVPTowers"
    end
    return "EquippedTowers"
end

local function getReplicatorValue(a1, a2) -- Line: 41 -- types: a2: string
    local v1 = a1.Replicator:Get(a2)
    if v1 ~= nil then
        return v1
    end
    return a1[a2]
end

local function getEquippedTowers(a1) -- Line: 50 -- upvalues: GameState (val)
    local v1
    local v2 = a1.Replicator:Get(if (GameState.GameMode or GameState.State and GameState.State.GameMode) ~= "PVP" then "EquippedTowers" else "EquippedPVPTowers")
    return (if v2 == nil then a1[v1] else v2) or {}
end

local function addPlayer(a1) -- Line: 54
    -- upvalues: PlayerReplicator (val), Maid (val), u49 (val), GameState (val), PlayerListStore (val), GameType (val)
    -- upvalues: LocalPlayer (val), observeSignal (val), PlayerList (val)
    local v1, u430 = PlayerReplicator.WaitForPlayer(a1):timeout(60):await()
    if v1 and u430 and a1.Parent ~= nil then
        local GameMode_2, updateReplicatedField, v2, v3, v4, v5, v6
        local u440 = Maid.new()
        u49[a1] = u440

        local function cancelAddPlayer() -- Line: 62 -- upvalues: u440 (val), u49 (upval), a1 (val)
            u440:Sweep()
            u49[a1] = nil
        end

        local Rank = a1:WaitForChild("Rank", 60)
        local u446 = if not Rank then nil else if a1.Parent ~= nil then Rank else nil
        if not u446 then
            u440:Sweep()
            u49[a1] = nil
            return
        end
        local u415 = {
            Blocked = false,
            Friended = false,
            Requested = false,
            VIP = false,
            Username = a1.Name,
            DisplayName = a1.DisplayName,
            UserId = a1.UserId,
            Verified = a1.HasVerifiedBadge,
            Team = u430.Team,
        }
        local v7 = u430.Replicator:Get(if (GameState.GameMode or GameState.State and GameState.State.GameMode) ~= "PVP" then "EquippedTowers" else "EquippedPVPTowers")
        u415.Towers = (if v7 == nil then u430[v6] else v7) or {}
        u415.Rank = u446.Value
        u415.Map = u430.Map
        u415.PVPWins = u430.PVPWins
        u415.PVPLosses = u430.PVPLosses
        u415.EnemiesSent = u430.EnemiesSent
        u415.EnemiesKilled = u430.EnemiesKilled
        u415.MapsCleared = u430.MapsCleared
        u415.LoginStreak = u430.LoginStreak
        local Medals = u430.Medals or {Easy = 0, Normal = 0, Insane = 0}
        u415.Medals = Medals
        u415.Stats = {Triumphs = 0, Deaths = 0, Level = 0, Cash = u430.Cash}
        local u451 = false

        local function dispatchUpdate() -- Line: 110 -- upvalues: u451 (ref), PlayerListStore (upval), u415 (val)
            if not u451 then
                return
            end
            PlayerListStore.update(u415)
        end

        v7 = {
            "EquippedTowers",
            "EquippedPVPTowers",
            "MapsCleared",
            "Map",
            "LoginStreak",
            "Medals",
            "PVPWins",
            "PVPLosses",
            "EnemiesSent",
            "EnemiesKilled",
        }
        local v8 = nil
        local v9 = nil
        for i, j in v7, v8, v9 do
            function updateReplicatedField(a1, a2) -- Line: 133
                -- upvalues: j (val), GameState (upval), u415 (val), u451 (ref), PlayerListStore (upval)
                if j ~= "EquippedTowers" and j ~= "EquippedPVPTowers" then
                    u415[j] = a1
                    if a2 then
                        if not u451 then
                            return
                        end
                        PlayerListStore.update(u415)
                    end
                    return
                end
                local GameMode = GameState.GameMode or GameState.State and GameState.State.GameMode
                if j ~= (if GameMode ~= "PVP" then "EquippedTowers" else "EquippedPVPTowers") then
                    return
                end
                u415.Towers = a1
                if a2 then
                    if not u451 then
                        return
                    end
                    PlayerListStore.update(u415)
                end
            end

            u440:Mark(((u430.Replicator:GetStateChangedSignal(j)):Connect(function(a1) -- Line: 149 -- upvalues: j (val), GameState (upval), u415 (val), u451 (ref), PlayerListStore (upval)
                if j ~= "EquippedTowers" and j ~= "EquippedPVPTowers" then
                    u415[j] = a1
                    if not u451 then
                        return
                    end
                    PlayerListStore.update(u415)
                    return
                end
                local GameMode = GameState.GameMode or GameState.State and GameState.State.GameMode
                if j ~= (if GameMode ~= "PVP" then "EquippedTowers" else "EquippedPVPTowers") then
                    return
                end
                u415.Towers = a1
                if not u451 then
                    return
                end
                PlayerListStore.update(u415)
            end)))
            v3 = u430.Replicator:Get(j)
            v2 = if v3 == nil then u430[j] else v3
            if v2 ~= nil then
                v3 = j
                if j == "EquippedTowers" then
                    GameMode_2 = GameState.GameMode or GameState.State and GameState.State.GameMode
                    v4 = if GameMode_2 ~= "PVP" then "EquippedTowers" else "EquippedPVPTowers"
                    if j == v4 then
                        u415.Towers = v2
                    end
                elseif j ~= "EquippedPVPTowers" then
                    u415[v3] = v2
                else
                    GameMode_2 = GameState.GameMode or GameState.State and GameState.State.GameMode
                    v4 = if GameMode_2 ~= "PVP" then "EquippedTowers" else "EquippedPVPTowers"
                    if j == v4 then
                        u415.Towers = v2
                    end
                end
            end
        end
        u440:Mark(((GameState.Replicator:GetStateChangedSignal("GameMode")):Connect(function() -- Line: 159 -- upvalues: u415 (val), u430 (val), GameState (upval), u451 (ref), PlayerListStore (upval)
            local v1
            local v2 = u430
            local v3 = v2.Replicator:Get(if (GameState.GameMode or GameState.State and GameState.State.GameMode) ~= "PVP" then "EquippedTowers" else "EquippedPVPTowers")
            u415.Towers = (if v3 == nil then v2[v1] else v3) or {}
            if not u451 then
                return
            end
            PlayerListStore.update(u415)
        end)))
        if GameType:Get() == "Game" then
            u440:Mark(((u430.Replicator:GetStateChangedSignal("Cash")):Connect(function(a1) -- Line: 166 -- upvalues: u415 (val), u451 (ref), PlayerListStore (upval)
                u415.Stats.Cash = a1
                if not u451 then
                    return
                end
                PlayerListStore.update(u415)
            end)))
        end
        if a1 ~= LocalPlayer then
            u440:Mark((observeSignal(PlayerList.getBlocked, function(a1_2) -- Line: 175 -- upvalues: u415 (val), a1 (val), u451 (ref), PlayerListStore (upval)
                u415.Blocked = table.find(a1_2, a1) ~= nil
                if u415.Blocked then
                    u415.Friended = false
                    u415.Requested = false
                end
                if not u451 then
                    return
                end
                PlayerListStore.update(u415)
            end)))
            u440:Mark((observeSignal(PlayerList.getFriends, function(a1_2) -- Line: 185 -- upvalues: u415 (val), a1 (val), u451 (ref), PlayerListStore (upval)
                u415.Friended = table.find(a1_2, a1) ~= nil
                if u415.Friended then
                    u415.Requested = false
                    u415.Blocked = false
                end
                if not u451 then
                    return
                end
                PlayerListStore.update(u415)
            end)))
        end
        local Flair = a1:WaitForChild("Flair", 60)
        local u177 = if not Flair then nil else if a1.Parent ~= nil then Flair else nil
        if not u177 then
            u440:Sweep()
            u49[a1] = nil
            return
        end
        local Value = u177.Value
        local u362 = u177:GetAttribute("Enabled") == true

        local function dispatchFlairUpdate() -- Line: 208
            -- upvalues: u415 (val), u362 (ref), Value (ref), u451 (ref), PlayerListStore (upval)
            u415.Status = if not u362 then nil else Value
            if not u451 then
                return
            end
            PlayerListStore.update(u415)
        end

        u440:Mark(((u177:GetPropertyChangedSignal("Value")):Connect(function() -- Line: 213
            -- upvalues: Value (ref), u177 (val), u415 (val), u362 (ref), u451 (ref), PlayerListStore (upval)
            u415.Status = if not u362 then nil else u177.Value
            if not u451 then
                return
            end
            PlayerListStore.update(u415)
        end)))
        u440:Mark(((u177:GetAttributeChangedSignal("Enabled")):Connect(function() -- Line: 218
            -- upvalues: u362 (ref), u177 (val), u415 (val), Value (ref), u451 (ref), PlayerListStore (upval)
            u362 = u177:GetAttribute("Enabled") == true
            u415.Status = if not u362 then nil else Value
            if not u451 then
                return
            end
            PlayerListStore.update(u415)
        end)))
        u440:Mark(((u446:GetPropertyChangedSignal("Value")):Connect(function() -- Line: 223 -- upvalues: u415 (val), u446 (val), u451 (ref), PlayerListStore (upval)
            u415.Rank = u446.Value
            if not u451 then
                return
            end
            PlayerListStore.update(u415)
        end)))
        local Tag = a1:WaitForChild("Tag", 60)
        local u256 = if not Tag then nil else if a1.Parent ~= nil then Tag else nil
        if not u256 then
            u440:Sweep()
            u49[a1] = nil
            return
        end
        u415.Tag = u256.Value
        u440:Mark(((u256:GetPropertyChangedSignal("Value")):Connect(function() -- Line: 237 -- upvalues: u415 (val), u256 (val), u451 (ref), PlayerListStore (upval)
            u415.Tag = u256.Value
            if not u451 then
                return
            end
            PlayerListStore.update(u415)
        end)))
        local v10 = {
            {Name = "Triumphs", Value = "Triumphs"},
            {Name = "Deaths", Value = "Loses"},
            {Name = "Level", Value = "Level"},
        }
        v2 = nil
        v3 = nil
        for k, n in v10, v2, v3 do
            v5 = a1:WaitForChild(n.Value, 60)
            if not v5 then
                local u322 = nil
            elseif a1.Parent ~= nil then
                u322 = v5
            else
                local u322 = nil
            end
            if not u322 then
                u440:Sweep()
                u49[a1] = nil
                return
            end
            u415.Stats[n.Name] = u322.Value
            u440:Mark(((u322:GetPropertyChangedSignal("Value")):Connect(function() -- Line: 258 -- upvalues: u415 (val), n (val), u322 (val), u451 (ref), PlayerListStore (upval)
                u415.Stats[n.Name] = u322.Value
                if not u451 then
                    return
                end
                PlayerListStore.update(u415)
            end)))
        end
        task.spawn(function() -- Line: 264 -- upvalues: u415 (val), LocalPlayer (upval), a1 (val), u451 (ref), PlayerListStore (upval)
            pcall(function() -- Line: 265 -- upvalues: u415 (upval), LocalPlayer (upval), a1 (upval)
                u415.Friended = LocalPlayer:IsFriendsWith(a1.UserId)
            end)
            if not u451 then
                return
            end
            PlayerListStore.update(u415)
        end)
        u451 = true
        u415.Status = if not u362 then nil else Value
        if u451 then
            PlayerListStore.update(u415)
        end
        return
    end
end

local function removePlayer(a1) -- Line: 275 -- upvalues: u49 (val), PlayerListStore (val) -- types: a1: userdata
    local v1 = u49[a1]
    if v1 then
        v1:Sweep()
        u49[a1] = nil
    end
    PlayerListStore.remove(a1.UserId)
end

task.spawn(function() -- Line: 285 -- upvalues: Players (val), removePlayer (val), addPlayer (val)
    Players.PlayerRemoving:Connect(removePlayer)
    Players.PlayerAdded:Connect(addPlayer)
    for i, v in ipairs(Players:GetPlayers()) do
        task.spawn(addPlayer, v)
    end
end)
return true