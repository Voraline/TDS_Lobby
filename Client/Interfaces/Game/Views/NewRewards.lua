-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.NewRewards
-- Decompile time: 46.35 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local Experience = require(ReplicatedStorage.Shared.Modules.Experience)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local NewMaps = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.NewMaps)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local NewRewards = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewRewards)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local ReviveTicketsController = require(ReplicatedStorage.Client.Controllers.Game.ReviveTicketsController)
local UserTowerStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.UserTowerStore)
local useCheckAdAvailability = require(ReplicatedStorage.Client.Interfaces.Hooks.useCheckAdAvailability)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local useIsTutorialMatch = require(ReplicatedStorage.Client.Interfaces.Hooks.useIsTutorialMatch)
local useNewNetworkCall = require(ReplicatedStorage.Client.Interfaces.Hooks.useNewNetworkCall)
local usePlayerReplicator = require(ReplicatedStorage.Client.Interfaces.Hooks.usePlayerReplicator)
local useProductInfo = require(ReplicatedStorage.Client.Interfaces.Hooks.useProductInfo)
local useReplicatedState = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatedState)
local useVIP = require(ReplicatedStorage.Client.Interfaces.Hooks.useVIP)
local useVote = require(ReplicatedStorage.Client.Interfaces.Hooks.useVote)
local useState = React.useState
local useMemo = React.useMemo
local useEffect = React.useEffect
local createElement = React.createElement
local useRef = React.useRef
local LocalPlayer = Players.LocalPlayer
local u140 = RunService:IsRunning()
local u141 = {"Timescale", "Spin"}
local u144 = {"Coins", "Gems", "Experience", "Elo"}
local u149 = {
    PVP_lowRanks = "Basic Arena",
    PVP_midRanks = "Molten Arena",
    PVP_highRanks = "Fallen Arena",
    SummerEasy = "Noob",
    SummerMedium = "Pro",
    SummerHard = "Master",
    SummerExperimental = "Extreme",
}

local function normalizeExperience(a1, a2) -- Line: 60 -- upvalues: Experience (val) -- types: a1: number, a2: number
    local v1 = a1
    local v2 = a2
    local v3 = Experience(v1)
    while v3 <= v2 do
        v1 = v1 + 1
        v2 = math.floor((math.clamp(v2 - v3, 0, (1 / 0))))
        v3 = Experience(v1)
    end
    return v1, v2
end

local function useProfileValueChange(a1) -- Line: 74
    -- upvalues: LocalPlayer (val), useState (val), useRef (val), useEffect (val)
    local Value
    local v1 = LocalPlayer:FindFirstChild(a1)
    local v2, u12 = useState(if not v1 then -1 else v1.Value)
    local u15 = useRef(Value)
    local u18 = useRef(Value)
    useEffect(function() -- Line: 82 -- upvalues: LocalPlayer (upval), a1 (val), u15 (val), u18 (val), u12 (val)
        local v1 = LocalPlayer:FindFirstChild(a1)
        if not v1 then
            return nil
        end
        u15.current = v1.Value
        u18.current = v1.Value
        u12(v1.Value)
        local u17 = v1.Changed:Connect(function(a1) -- Line: 91 -- upvalues: u15 (upval), u18 (upval), u12 (upval)
            u15.current = u18.current
            u18.current = a1
            u12(a1)
        end)
        return function() -- Line: 97 -- upvalues: u17 (val)
            u17:Disconnect()
        end
    end, {})
    return v2, u15.current
end

local function parseRewardAmount(a1) -- Line: 105
    if typeof(a1) == "number" then
        return a1
    end
    if typeof(a1) ~= "string" then
        return nil
    end
    local v1 = a1:gsub("[^%d]", "")
    if v1 == "" then
        return nil
    end
    return (tonumber(v1))
end

local function getRewardAmount(a1, a2) -- Line: 122 -- types: a1: table, a2: string
    local v1 = a1[a2]
    if type(v1) ~= "table" then
        if typeof(v1) == "number" then
            return v1
        end
        if typeof(v1) == "string" then
            local v2 = v1:gsub("[^%d]", "")
            if v2 == "" then
                return nil
            end
            return (tonumber(v2))
        end
        return nil
    end
    local Value = v1.Value
    if typeof(Value) == "number" then
        return Value
    end
    if typeof(Value) ~= "string" then
        return nil
    end
    local v3 = Value:gsub("[^%d]", "")
    if v3 == "" then
        return nil
    end
    return (tonumber(v3))
end

local function getRewards(a1) -- Line: 131 -- upvalues: useMemo (val), u141 (val), u144 (val) -- types: a1: table
    return useMemo(function() -- Line: 132 -- upvalues: a1 (val), u141 (upval), u144 (upval)
        local Type, v1
        local v2 = {}
        local v3 = nil
        local v4 = nil
        for i, j in a1, v3, v4 do
            if type(j) == "table" then
                v1 = {}
                Type = j.Type and j.Type:lower()
                v1.type = Type
                v1.skin = j.Skin
                v1.tower = j.Tower
                v1.icon = j.Icon
                if j.Label then
                    v1.name = j.Label
                end
                if j.Icon and not v1.type then
                    v1.type = "icon"
                    v1.icon = j.Icon
                end
                if typeof(j.Value) == "number" then
                    v1.amount = j.Value
                    if v1.type == "towerexp" then
                        v1.type = "tower"
                    end
                    table.insert(v2, v1)
                elseif typeof(j.Value) == "string" then
                    v1.name = j.Value
                    if v1.type == "towerexp" then
                        v1.type = "tower"
                    end
                    table.insert(v2, v1)
                end
            elseif table.find(u141, i) then
                table.insert(v2, {type = "stat", stat = ("%*Tickets"):format(i), amount = j})
            elseif table.find(u144, i) then
                table.insert(v2, {type = "stat", stat = i, amount = tostring(j):gsub(" XP", "")})
            end
        end
        return v2
    end, {a1})
end

local function getDuration(a1) -- Line: 189 -- types: a1: number
    local v1 = math.floor(a1 / 86400)
    local v2 = math.floor(a1 / 3600)
    local v3 = math.floor(a1 / 60)
    local v4 = math.floor(a1 % 60)
    local v5 = ""
    if v1 > 0 then
        v5 = v5 .. v1 .. "d "
        v2 = v2 - v1 * 24
    end
    if v2 > 0 then
        v5 = v5 .. v2 .. "h "
        v3 = v3 - v2 * 60
    end
    if v3 > 0 then
        v5 = v5 .. v3 .. "m "
    end
    return v5 .. v4 .. "s"
end

local function GameOver(a1) -- Line: 215
    -- upvalues: ReactCharm (val), UserTowerStore (val), useReplicatedState (val), useProfileValueChange (val)
    -- upvalues: normalizeExperience (val), useProductInfo (val), useGameStateValue (val), useIsTutorialMatch (val)
    -- upvalues: useMemo (val), NewMaps (val), Content (val), useVIP (val), useVote (val), useCheckAdAvailability (val)
    -- upvalues: useNewNetworkCall (val), useState (val), useEffect (val), u140 (val), Players (val), getDuration (val)
    -- upvalues: u149 (val), createElement (val), NewRewards (val), NewNetwork (val), ViewController (val)
    -- upvalues: ReviveTicketsController (val), u141 (val), u144 (val)
    local Replicator = a1.Replicator
    local PlayerReplicator = a1.PlayerReplicator
    if Replicator and PlayerReplicator then
        local u190, v1, v2, v3, v4, v5, v6
        local v7 = ReactCharm.useSignalState(UserTowerStore.getState)
        local v8 = useReplicatedState(PlayerReplicator, "EquippedTowers")
        local v9 = {}
        local v10 = v8 and #v8 > 0
        for i, j in if not v10 then v7.equipped else v8 do
            v2 = v7.inventory[j]
            if v2 then
                v9[j] = v2.Skin or "Default"
            elseif v10 then
                v9[j] = "Default"
            end
        end
        local Level, Level_2 = useProfileValueChange("Level")
        local Experience, Experience_2 = useProfileValueChange("Experience")
        v1, v2 = normalizeExperience(Level, Experience)
        local v11 = normalizeExperience(Level_2, Experience_2)
        local v12, v13 = useProductInfo(Enum.InfoType.GamePass, 10518590)
        local PriceInRobux = if not v12 then 300 else if not v13 then 300 else v13.PriceInRobux
        local u64 = useReplicatedState(Replicator, "GameOver")
        local v14 = useReplicatedState(Replicator, "GameDuration")
        local v15 = useReplicatedState(Replicator, "GameMode")
        local v16 = useReplicatedState(Replicator, "Difficulty")
        local v17 = useReplicatedState(Replicator, "DifficultyDisplayName")
        local v18 = useReplicatedState(Replicator, "ChallengeMap")
        local u88 = useReplicatedState(Replicator, "StoryChapter")
        local u92 = useReplicatedState(Replicator, "StoryMission")
        local v19 = useReplicatedState(Replicator, "StoryNextMission")
        local u100 = useReplicatedState(Replicator, "MapName")
        local v20 = useReplicatedState(PlayerReplicator, "Team")
        local v21 = useReplicatedState(Replicator, "Wave")
        local v22 = useReplicatedState(Replicator, "WinningTeam")
        local RevivesDisabled = useGameStateValue("RevivesDisabled")
        local v23 = useGameStateValue("ReviveAllowed", true)
        local v24 = useReplicatedState(Replicator, "MatchStars")
        local v25 = useIsTutorialMatch()
        local u130 = v15 == "Halloween2025"
        local u133 = v15 == "Adidas2026"
        local u136 = v15 == "Christmas2025"
        if not u130 then
            v3 = u133
            if v3 then
                v3 = true
                if v16 ~= "Map3AdidasHard" then
                    v3 = v16 == "Map3AdidasEasy"
                end
            end
        else
            v3 = true
            if v16 ~= "Act3" then
                v3 = true
                if v16 ~= "Act3Easy" then
                    v3 = u133
                    if v3 then
                        v3 = true
                        if v16 ~= "Map3AdidasHard" then
                            v3 = v16 == "Map3AdidasEasy"
                        end
                    end
                end
            end
        end
        local v26 = useReplicatedState(Replicator, "NextNightReady")
        local v27 = {u100}
        local v28 = useMemo(function() -- Line: 284 -- upvalues: u100 (val), NewMaps (upval)
            return u100 and NewMaps(u100).DisplayName or u100
        end, v27)
        local v29 = {u88, u92}
        local v30 = useMemo(function() -- Line: 288 -- upvalues: u88 (val), Content (upval), u92 (val)
            if not u88 then
                return nil
            end
            local v1 = ((Content("Gamemodes"):WaitForChild("StoryMode")):WaitForChild("Chapters")):FindFirstChild((("Chapter%*"):format(u88)))
            if v1 and v1:IsA("ModuleScript") then
                local v2 = require(v1)
                local Missions = u92 and v2.Missions and v2.Missions[u92]
                return {chapter = v2.Title, mission = Missions and Missions.Title}
            end
            return nil
        end, v29)
        v27, u190 = useVIP()
        local u193, u194, u195 = useVote("Restart?")
        local v31 = v15 == "PVP"
        local v32 = u64 and v22 ~= nil
        local u228 = if not v31 then v22 == v20 else true
        local v33 = useCheckAdAvailability(Enum.AdFormat.RewardedVideo, v32)
        local RobloxAds = useNewNetworkCall("RobloxAds")
        local v34, u241 = useState(true)
        local u244, u245 = useState(false)
        local u264 = false
        if v16 == "ClassicRoblox" then
            u264 = false
            if v15 == "Event" then
                u264 = v18 == true
            end
        end
        local v35, u268 = useState({})
        local Experience_3 = v35.Experience
        if type(Experience_3) == "table" then
            local Value = Experience_3.Value
            if typeof(Value) == "number" then
                v4 = Value
            elseif typeof(Value) ~= "string" then
                v4 = nil
            else
                v6 = Value:gsub("[^%d]", "")
                v4 = if v6 ~= "" then tonumber(v6) else nil
            end
        elseif typeof(Experience_3) == "number" then
            v4 = Experience_3
        elseif typeof(Experience_3) ~= "string" then
            v4 = nil
        else
            v5 = Experience_3:gsub("[^%d]", "")
            v4 = if v5 ~= "" then tonumber(v5) else nil
        end
        v6 = {PlayerReplicator}
        useEffect(function() -- Line: 329 -- upvalues: PlayerReplicator (val), u268 (val)
            local v1
            if not PlayerReplicator then
                return
            end
            local u1 = {}
            local u8 = PlayerReplicator.Changed:Connect(function(a1, a2) -- Line: 336 -- upvalues: u1 (val), u268 (upval) -- types: a1: string
                local v1 = a1:match("^(.+)Reward$")
                if not v1 then
                    return
                end
                v1 = v1:gsub("_", " ")
                u1[v1] = a2
                u268(table.clone(u1))
            end)
            for i, j in PlayerReplicator:GetAllStates() do
                v1 = i:match("^(.+)Reward$")
                if v1 then
                    u1[v1:gsub("_", " ")] = j
                    u268(table.clone(u1))
                end
            end
            return function() -- Line: 352 -- upvalues: u1 (val), u8 (val), u268 (upval)
                table.clear(u1)
                u8:Disconnect()
                u268({})
            end
        end, v6)
        v6 = {u64, u228}
        useEffect(function() -- Line: 359
            -- upvalues: u140 (upval), u64 (val), u228 (val), u264 (val), Players (upval), u130 (val), u136 (val)
            if not u140 then
                return
            end
            local Music = workspace:FindFirstChild("Music")
            if Music and string.find(string.lower(Music.Value), "intermission") then
                return
            end
            local Value = Music and Music.Value or ""
            local Attribute = Music and Music:GetAttribute("OldValue") or ""
            if Value ~= "Triumph" and Value ~= "Lose" and Music then
                Music:SetAttribute("OldValue", Value)
            end
            if Music and u64 and u228 ~= nil then
                if u264 and u228 then
                    local Sound = Instance.new("Sound")
                    Sound.Ended:Connect(function() -- Line: 389 -- upvalues: Sound (val)
                        Sound:Destroy()
                    end)
                    Sound.SoundId = "rbxassetid://17582539144"
                    Sound.Parent = Players.LocalPlayer:FindFirstChild("PlayerGui")
                    Sound:Play()
                end
                Music.Value = if u264 then if not u130 then if not u136 then if not u264 then "Lose" else "" else if not u228 then "2025_Winter_Lose" else "Triumph" else if not u228 then "HalloweenLose" else "HalloweenTriumph" else if u130 then if not u130 then if not u136 then if not u264 then "Lose" else "" else if not u228 then "2025_Winter_Lose" else "Triumph" else if not u228 then "HalloweenLose" else "HalloweenTriumph" else if u136 then if not u130 then if not u136 then if not u264 then "Lose" else "" else if not u228 then "2025_Winter_Lose" else "Triumph" else if not u228 then "HalloweenLose" else "HalloweenTriumph" else if not u228 then if not u130 then if not u136 then if not u264 then "Lose" else "" else if not u228 then "2025_Winter_Lose" else "Triumph" else if not u228 then "HalloweenLose" else "HalloweenTriumph" else "Triumph"
                return
            end
            if Music then
                Music.Value = Attribute
            end
        end, v6)
        local v36 = {}
        v5 = {title = "Time Completed:", value = getDuration(v14 or 0) or "0 s"}
        local v37 = {title = "Wave:", value = v21}
        v36[1] = v5
        v36[2] = {title = "Map:", value = v28}
        v36[3] = v37
        v36[4] = {title = "Game Mode:", value = if not u88 then v15 else "Story"}
        if not u88 then
            table.insert(v36, {title = "Difficulty:", value = v17 or v16 and u149[v16] or v16})
        else
            v37 = {title = "Chapter:"}
            local chapter = v30 and v30.chapter or u88
            v37.value = chapter
            table.insert(v36, v37)
            v37 = {title = "Mission:"}
            local mission = v30 and v30.mission or u92
            v37.value = mission
            table.insert(v36, v37)
        end
        v37 = {adText = "Watch an ad for 50 coins!"}
        local v38 = u64 and v22 ~= nil
        v37.visible = v38
        v37.towers = if not v32 then {} else v9
        v37.won = if u228 then true else false
        v37.vipPrice = PriceInRobux
        v37.hasVIP = v27
        v37.previousLevel = v11
        v37.newLevel = v1
        v37.currentXP = v2
        v37.xpEarned = v4 or math.max(0, Experience - Experience_2)
        v37.isPVP = v15 == "PVP"
        v37.currentTeam = v20
        v37.winningTeam = v22
        v37.stars = v24
        v37.adVisible = u228 and v33 and v34

        function v37.adClicked() -- Line: 469 -- upvalues: u241 (val), RobloxAds (val)
            u241(false)
            RobloxAds("RequestShowAd")
        end

        v38 = not RevivesDisabled
        if v38 then
            v38 = false
            if v23 ~= false then
                v38 = not v25
            end
        end
        v37.tryAgain = v38
        v37.tryAgainText = ("Restart Wave %*"):format((math.max(0, v21 - 1)))
        v38 = not u228
        if not v38 then
            v38 = not u88
            if v38 then
                v38 = true
                if v15 ~= "PVP" then
                    v38 = true
                    if v15 ~= "Survival" then
                        v38 = v15 == "Hardcore"
                    end
                end
            end
        end
        v37.playAgain = v38

        function v37.returnToLobbyClicked() -- Line: 482 -- upvalues: Players (upval), NewNetwork (upval)
            local LocalPlayer = Players.LocalPlayer
            LocalPlayer:SetAttribute("Teleporting", true)
            while not LocalPlayer:GetAttribute("ReadyToTeleport") do
                LocalPlayer:GetAttributeChangedSignal("ReadyToTeleport"):Wait()
            end
            task.wait(2)
            NewNetwork.Channel("Teleport"):fireServer("backToLobby")
        end

        v38 = u228 and (if not u88 then if u133 then not v3 and v26 else if not u130 then false else not v3 and v26 else v19 ~= nil)
        v37.canContinue = v38

        function v37.continueClicked() -- Line: 500
            -- upvalues: u88 (val), NewNetwork (upval), ViewController (upval), u133 (val), u130 (val)
            local v1, v2
            if u88 then
                v1, v2 = NewNetwork.Channel("GameManager"):invokeServer("NextMission")
                if v1 then
                    return
                end
                ViewController:notify(v2, 5, (Color3.new(1, 0, 0)))
                return
            end
            if u133 then
                v1, v2 = NewNetwork.Channel("Adidas2026"):invokeServer("NextNight")
                if v1 then
                    return
                end
                ViewController:notify(v2, 5, (Color3.new(1, 0, 0)))
                return
            end
            if u130 then
                v1, v2 = NewNetwork.Channel("Halloween2025"):invokeServer("NextNight")
                if not v1 then
                    ViewController:notify(v2, 5, (Color3.new(1, 0, 0)))
                end
            end
        end

        v37.playAgainText = if not u228 then ("Restart Match (%*/%*)"):format(u193.votes, u193.maxVotes) else if u244 then "Matchmaking..." else "Play Again"

        function v37.playAgainClicked() -- Line: 522
            -- upvalues: u228 (val), u244 (val), u245 (val), NewNetwork (upval), u193 (val), u194 (val), u195 (val)
            if u228 and not u244 then
                u245(true)
                NewNetwork.Channel("GameManager"):fireServer("Rematch")
                return
            end
            if not u193.enabled then
                return
            end
            if not u193.voted then
                u194()
                return
            end
            u195()
        end

        function v37.tryAgainClicked() -- Line: 539 -- upvalues: ReviveTicketsController (upval)
            ReviveTicketsController.showPrompt()
        end

        function v37.vipClicked() -- Line: 542 -- upvalues: u190 (val)
            u190()
        end

        local u1297 = v35
        if not u1297 then
            u1297 = {}
        end
        local v39 = {u1297}
        v37.rewards = useMemo(function() -- Line: 132 -- upvalues: u1297 (val), u141 (upval), u144 (upval)
            local Type, v1
            local v2 = {}
            local v3 = nil
            local v4 = nil
            for i, j in u1297, v3, v4 do
                if type(j) == "table" then
                    v1 = {}
                    Type = j.Type and j.Type:lower()
                    v1.type = Type
                    v1.skin = j.Skin
                    v1.tower = j.Tower
                    v1.icon = j.Icon
                    if j.Label then
                        v1.name = j.Label
                    end
                    if j.Icon and not v1.type then
                        v1.type = "icon"
                        v1.icon = j.Icon
                    end
                    if typeof(j.Value) == "number" then
                        v1.amount = j.Value
                        if v1.type == "towerexp" then
                            v1.type = "tower"
                        end
                        table.insert(v2, v1)
                    elseif typeof(j.Value) == "string" then
                        v1.name = j.Value
                        if v1.type == "towerexp" then
                            v1.type = "tower"
                        end
                        table.insert(v2, v1)
                    end
                elseif table.find(u141, i) then
                    table.insert(v2, {type = "stat", stat = ("%*Tickets"):format(i), amount = j})
                elseif table.find(u144, i) then
                    table.insert(v2, {type = "stat", stat = i, amount = tostring(j):gsub(" XP", "")})
                end
            end
            return v2
        end, v39)
        v37.gameStats = v36
        return createElement(NewRewards, v37)
    end
end

return function(a1) -- Line: 551 -- upvalues: usePlayerReplicator (val), createElement (val), GameOver (val), GameState (val)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {
        gameOver = createElement(GameOver, {Replicator = GameState.State, PlayerReplicator = usePlayerReplicator()}),
    })
end