-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.Rewards
-- Decompile time: 14.57 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
require(ReplicatedStorage.Shared.Modules.GameState)
local NewMaps = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.NewMaps)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local ReviveTicketsController = require(ReplicatedStorage.Client.Controllers.Game.ReviveTicketsController)
local Rewards = require(ReplicatedStorage.Client.Interfaces.Game.Components.Rewards)
local UserTowerStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.UserTowerStore)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
require(ReplicatedStorage.Client.Interfaces.Hooks.usePlayerReplicator)
local useReplicatedState = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatedState)
require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useState = React.useState
local useEffect = React.useEffect
local createElement = React.createElement
local u102 = RunService:IsRunning()

local function GetRewards(a1) -- Line: 28 -- types: a1: table
    local v1
    local v2 = {}
    local v3 = nil
    local v4 = nil
    for i, j in a1, v3, v4 do
        v1 = {Type = i, Value = j}
        if type(j) == "table" then
            v1 = j
            v1.Type = v1.Type or i
        end
        table.insert(v2, v1)
    end
    return v2
end

local function GameOver(a1) -- Line: 48
    -- upvalues: ReactCharm (val), UserTowerStore (val), useReplicatedState (val), useGameStateValue (val)
    -- upvalues: useState (val), useEffect (val), u102 (val), Players (val), createElement (val), Rewards (val)
    -- upvalues: NewMaps (val), GetRewards (val), ReviveTicketsController (val), NewNetwork (val), Network (val)
    -- upvalues: ViewController (val)
    local Replicator = a1.Replicator
    local PlayerReplicator = a1.PlayerReplicator
    if Replicator and PlayerReplicator then
        local v1
        local v2 = ReactCharm.useSignalState(UserTowerStore.getState)
        local v3 = {}
        for i, j in v2.equipped do
            v1 = v2.inventory[j]
            if v1 then
                v3[i] = v1.skin or "Default"
            end
        end
        local u23 = useReplicatedState(Replicator, "GameOver")
        local v4 = useReplicatedState(Replicator, "GameDuration")
        local v5 = useReplicatedState(Replicator, "GameMode")
        local v6 = useReplicatedState(Replicator, "Difficulty")
        local v7 = useReplicatedState(Replicator, "ChallengeMap")
        v1 = useReplicatedState(Replicator, "MapName")
        local v8 = useReplicatedState(PlayerReplicator, "Team")
        local v9 = useReplicatedState(Replicator, "Wave")
        local v10 = useReplicatedState(Replicator, "WinningTeam")
        local RevivesDisabled = useGameStateValue("RevivesDisabled")
        local v11 = useGameStateValue("ReviveAllowed", true)
        local u65 = v10 == v8
        local u72 = false
        if v6 == "ClassicRoblox" then
            u72 = false
            if v5 == "Event" then
                u72 = v7 == true
            end
        end
        local u75 = v5 == "Halloween2024"
        local v12 = false
        if v5 == "Halloween2024" then
            v12 = v6 == "Act3"
        end
        local v13 = useReplicatedState(Replicator, "NextNightReady")
        local v14, u93 = useState({})
        local v15 = {PlayerReplicator}
        useEffect(function() -- Line: 93 -- upvalues: PlayerReplicator (val), u93 (val)
            local v1
            if not PlayerReplicator then
                return
            end
            local u1 = {}
            local u8 = PlayerReplicator.Changed:Connect(function(a1, a2) -- Line: 100 -- upvalues: u1 (val), u93 (upval) -- types: a1: string
                local v1 = a1:match("^(.+)Reward$")
                if not v1 then
                    return
                end
                v1 = v1:gsub("_", " ")
                u1[v1] = a2
                u93(table.clone(u1))
            end)
            for i, j in PlayerReplicator:GetAllStates() do
                v1 = i:match("^(.+)Reward$")
                if v1 then
                    u1[v1:gsub("_", " ")] = j
                    u93(table.clone(u1))
                end
            end
            return function() -- Line: 116 -- upvalues: u1 (val), u8 (val), u93 (upval)
                table.clear(u1)
                u8:Disconnect()
                u93({})
            end
        end, v15)
        v15 = {u23, u65}
        useEffect(function() -- Line: 123 -- upvalues: u102 (upval), u23 (val), u65 (val), u72 (val), Players (upval), u75 (val)
            local Attribute, Sound, Value
            if not u102 then
                return
            end
            local Music = workspace:FindFirstChild("Music")
            if not Music then
                Value = Music and Music.Value or ""
                Attribute = Music and Music:GetAttribute("OldValue") or ""
                if Value ~= "Triumph" and Value ~= "Lose" and Music then
                    Music:SetAttribute("OldValue", Value)
                end
                if Music and u23 and u65 ~= nil then
                    if u72 and u65 then
                        Sound = Instance.new("Sound")
                        Sound.Ended:Connect(function() -- Line: 153 -- upvalues: Sound (val)
                            Sound:Destroy()
                        end)
                        Sound.SoundId = "rbxassetid://17582539144"
                        Sound.Parent = Players.LocalPlayer:FindFirstChild("PlayerGui")
                        Sound:Play()
                    end
                    Music.Value = if u72 then if not u75 then if not u72 then "Lose" else "" else if not u65 then "HalloweenLose" else "HalloweenTriumph" else if u75 then if not u75 then if not u72 then "Lose" else "" else if not u65 then "HalloweenLose" else "HalloweenTriumph" else if not u65 then if not u75 then if not u72 then "Lose" else "" else if not u65 then "HalloweenLose" else "HalloweenTriumph" else "Triumph"
                    return
                end
                if Music then
                    Music.Value = Attribute
                end
                return
            end
            if Music.Value ~= "Intermission" and Music.Value ~= "PVP Intermission" then
                Value = Music and Music.Value or ""
                Attribute = Music and Music:GetAttribute("OldValue") or ""
                if Value ~= "Triumph" and Value ~= "Lose" and Music then
                    Music:SetAttribute("OldValue", Value)
                end
                if Music and u23 and u65 ~= nil then
                    if u72 and u65 then
                        Sound = Instance.new("Sound")
                        Sound.Ended:Connect(function() -- Line: 153 -- upvalues: Sound (val)
                            Sound:Destroy()
                        end)
                        Sound.SoundId = "rbxassetid://17582539144"
                        Sound.Parent = Players.LocalPlayer:FindFirstChild("PlayerGui")
                        Sound:Play()
                    end
                    Music.Value = if u72 then if not u75 then if not u72 then "Lose" else "" else if not u65 then "HalloweenLose" else "HalloweenTriumph" else if u75 then if not u75 then if not u72 then "Lose" else "" else if not u65 then "HalloweenLose" else "HalloweenTriumph" else if not u65 then if not u75 then if not u72 then "Lose" else "" else if not u65 then "HalloweenLose" else "HalloweenTriumph" else "Triumph"
                    return
                end
                if Music then
                    Music.Value = Attribute
                end
                return
            end
        end, v15)
        v15 = {}
        local v16 = u23 and v10 ~= nil
        v15.Visible = v16
        v15.Wave = v9
        v15.Map = v1 and NewMaps(v1).DisplayName or v1
        v15.GameMode = v5
        v15.Duration = v4
        v15.ChallengeMap = v7
        v15.Win = u65
        v15.Rewards = GetRewards(v14)
        v15.WinningTeam = v10
        v15.CurrentTeam = v8
        v15.Towers = v2.equipped
        v15.Skins = v3
        v15.ReviveAllowed = not RevivesDisabled and v11 ~= false

        function v15.PromptRevive() -- Line: 190 -- upvalues: ReviveTicketsController (upval)
            ReviveTicketsController.showPrompt()
        end

        function v15.ReturnToLobby() -- Line: 194 -- upvalues: Players (upval), NewNetwork (upval)
            local LocalPlayer = Players.LocalPlayer
            LocalPlayer:SetAttribute("Teleporting", true)
            while not LocalPlayer:GetAttribute("ReadyToTeleport") do
                LocalPlayer:GetAttributeChangedSignal("ReadyToTeleport"):Wait()
            end
            task.wait(2)
            NewNetwork.Channel("Teleport"):fireServer("backToLobby")
        end

        v15.ContinueDisabled = if not u72 then if not v13 then nil else if not u75 then nil else if v12 then nil else not u65 or Players.LocalPlayer:GetAttribute("IsPartyHost") == false else if v1 ~= "Classic Castle" then not u65 or Players.LocalPlayer:GetAttribute("IsPartyHost") == false else if not v13 then nil else if not u75 then nil else if v12 then nil else not u65 or Players.LocalPlayer:GetAttribute("IsPartyHost") == false
        v15.Continue = if not u72 then if not v13 then nil else if not u75 then nil else if v12 then nil else function() -- Line: 220 -- upvalues: NewNetwork (upval), ViewController (upval)
            local v1, v2 = NewNetwork.Channel("Halloween2024"):invokeServer("NextNight")
            if not v1 then
                ViewController:notify(v2, 5, (Color3.new(1, 0, 0)))
            end
        end else if v1 == "Classic Castle" then if not v13 then nil else if not u75 then nil else if v12 then nil else function() -- Line: 220 -- upvalues: NewNetwork (upval), ViewController (upval)
            local v1, v2 = NewNetwork.Channel("Halloween2024"):invokeServer("NextNight")
            if not v1 then
                ViewController:notify(v2, 5, (Color3.new(1, 0, 0)))
            end
        end else function() -- Line: 213 -- upvalues: Network (upval), ViewController (upval)
            local v1, v2 = Network.Channel("EventMissions"):InvokeServer("StartNextMission")
            if not v1 then
                ViewController:notify(v2, 5, (Color3.new(1, 0, 0)))
            end
        end
        return createElement(Rewards, v15)
    end
end

return function(a1) end