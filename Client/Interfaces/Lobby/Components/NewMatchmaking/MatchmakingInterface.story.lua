-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.MatchmakingInterface.story
-- Decompile time: 6.89 ms

local v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local UILabs = require(ReplicatedStorage.Packages.UILabs)
local MatchmakingInterface = require(script.Parent.MatchmakingInterface)
local MatchmakingPairing = require(ReplicatedStorage.Client.Interfaces.Universal.Components.MatchmakingPairing)
local MatchmakingStoryFixtures = require(script.Parent.MatchmakingStoryFixtures)
local MatchmakingTrialData = require(script.Parent.MatchmakingTrialData)
local StoryModeData = require(script.Parent.StoryModeData)
local createElement = React.createElement
local useEffect = React.useEffect
local useMemo = React.useMemo
local useRef = React.useRef
local useState = React.useState
local v2 = MatchmakingTrialData.getTrialNames()
local v3 = MatchmakingTrialData.getTrialMapNames()
local u58 = {
    {Name = "Test Player 69492859", UserId = 69492859},
    {Name = "Test Player 16983447", UserId = 16983447},
    {Name = "Test Player 11643", UserId = 11643},
    {Name = "Test Player 49601674", UserId = 49601674},
}
local u65 = (function() -- Line: 41 -- upvalues: StoryModeData (val)
    local v1
    local v2 = {}
    for i, j in StoryModeData.getDefinitions() do
        v1 = {}
        for k in j.Missions do
            v1[k] = {Stars = 3}
        end
        v2[i] = {Missions = v1}
    end
    return {Chapters = v2}
end)()
local u68 = StoryModeData.getSections(u65)
local u71 = MatchmakingStoryFixtures.withMockStoryRewards(u68)
local v4 = {}
local u73 = {}
for i, j in u68 do
    v1 = ("%*: %*"):format(j.chapterNumber, j.title)
    table.insert(v4, v1)
    u73[v1] = j.chapterNumber
end
local v5 = {
    CurrentPartySize = UILabs.Slider(2, 1, 4, 1),
    HasAdminGamepass = UILabs.Boolean(true),
    HasVoidcoreAccess = UILabs.Boolean(true),
    InitialTab = UILabs.Choose({"Story", "Survival", "PVP", "Arcade", "Sandbox"}),
    IsPartyLeader = UILabs.Boolean(true),
    MatchmakingState = UILabs.Choose({"Idle", "Searching", "Matched"}),
    MostPopularCategory = UILabs.Choose({"Story", "Survival", "PVP", "Arcade", "Sandbox"}),
    PlayerCount = UILabs.Slider(1250, 0, 100000, 50),
    PlayerLevel = UILabs.Slider(250, 0, 500, 10),
    Player2ChapterUnlocked = UILabs.Choose(v4),
    Player2MissionsUnlocked = UILabs.Slider(1, 1, 10, 1),
    PvpEnabled = UILabs.Boolean(true),
    SandboxEnabled = UILabs.Boolean(true),
    TrialModifier = UILabs.Choose(v2),
    TrialMap = UILabs.Choose(v3),
}

local function useStoryFullscreen(a1) -- Line: 133 -- upvalues: useEffect (val) -- types: a1: table
    local v1 = {a1}
    useEffect(function() -- Line: 136 -- upvalues: a1 (val)
        local current = a1.current
        local u6 = if not current then nil else current:FindFirstAncestorWhichIsA("ScreenGui")
        local IgnoreGuiInset = if not u6 then nil else u6.IgnoreGuiInset
        local ScreenInsets = if not u6 then nil else u6.ScreenInsets
        local ClipToDeviceSafeArea = if not u6 then nil else u6.ClipToDeviceSafeArea
        if u6 then
            u6.IgnoreGuiInset = true
            u6.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
            u6.ClipToDeviceSafeArea = true
        end
        return function() -- Line: 153 -- upvalues: u6 (val), IgnoreGuiInset (val), ScreenInsets (val), ClipToDeviceSafeArea (val)
            if u6 and u6.Parent then
                u6.IgnoreGuiInset = IgnoreGuiInset
                u6.ScreenInsets = ScreenInsets
                u6.ClipToDeviceSafeArea = ClipToDeviceSafeArea
            end
        end
    end, v1)
end

local function getCurrentTime() -- Line: 163 -- upvalues: RunService (val)
    if RunService:IsRunning() then
        return (workspace:GetServerTimeNow())
    end
    return (tick())
end

local function createPartyStoryAvailability(a1, a2, a3) -- Line: 167
    -- upvalues: u73 (val), u68 (val)
    local chapterNumber_2, missionNumber, v1, v2, v3, v4, v5, v6, v7
    local chapterNumber = u73[a2] or u68[1].chapterNumber
    local v8 = {}
    local v9 = table.create(#a1)
    for i, j in a1 do
        v9[i] = j.UserId
    end
    local v10 = nil
    local v11 = nil
    for k, n in u68, v10, v11 do
        chapterNumber_2 = n.chapterNumber
        v2 = {unlockedForParty = chapterNumber_2 <= chapterNumber}
        if v1 then
            v3 = table.create(#n.missions)
            v4 = nil
            v5 = nil
            for m, i5 in n.missions, v4, v5 do
                missionNumber = i5.missionNumber
                v7 = true
                if not (chapterNumber_2 < chapterNumber) then
                    v7 = i5.missionNumber <= v6
                end
                v3[missionNumber] = v7
            end
            v2.missions = v3
        end
        v8[chapterNumber_2] = v2
    end
    return {chapters = v8, memberUserIds = v9}
end

return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = v5,
    story = function(a1) -- Line: 206
        -- upvalues: useRef (val), useState (val), useMemo (val), MatchmakingTrialData (val), RunService (val)
        -- upvalues: u58 (val), u71 (val), createPartyStoryAvailability (val), MatchmakingStoryFixtures (val)
        -- upvalues: StoryModeData (val), u65 (val), useEffect (val), createElement (val), MatchmakingInterface (val)
        -- upvalues: MatchmakingPairing (val)
        local v1 = ("%*:%*"):format(a1.controls.InitialTab, a1.controls.MatchmakingState)
        local u11 = useRef(nil)
        local v2, u16 = useState(a1.controls.MatchmakingState)
        local v3, u21 = useState(a1.controls.CurrentPartySize)
        local v4 = useMemo
        local v5 = {a1.controls.TrialMap, a1.controls.TrialModifier}
        v4 = v4(function() -- Line: 212 -- upvalues: MatchmakingTrialData (upval), RunService (upval), a1 (val)
            return {
                expiresAt = MatchmakingTrialData.getRotationEndsAt(if not RunService:IsRunning() then tick() else workspace:GetServerTimeNow()),
                mapName = a1.controls.TrialMap,
                trialName = a1.controls.TrialModifier,
            }
        end, v5)
        local v6 = useMemo
        local v7 = {a1.controls.CurrentPartySize}
        local u35 = v6(function() -- Line: 222 -- upvalues: a1 (val), u58 (upval)
            local v1 = {}
            local CurrentPartySize = a1.controls.CurrentPartySize
            for i = 1, CurrentPartySize do
                v1[i] = u58[i]
            end
            return v1
        end, v7)
        v5 = useMemo
        local v8 = {
            u35,
            a1.controls.Player2ChapterUnlocked,
            a1.controls.Player2MissionsUnlocked,
        }
        v5 = v5(function() -- Line: 229
            -- upvalues: u35 (val), u71 (upval), createPartyStoryAvailability (upval), a1 (val)
            -- upvalues: MatchmakingStoryFixtures (upval), StoryModeData (upval), u65 (upval)
            if #u35 < 2 then
                return u71
            end
            return MatchmakingStoryFixtures.withMockStoryRewards(StoryModeData.getSections(
                u65,
                nil,
                nil,
                (createPartyStoryAvailability(u35, a1.controls.Player2ChapterUnlocked, a1.controls.Player2MissionsUnlocked))
            ))
        end, v8)
        v7 = useEffect
        local v9 = {a1.controls.CurrentPartySize, a1.controls.MatchmakingState}
        v7(function() -- Line: 248 -- upvalues: u16 (val), a1 (val), u21 (val)
            u16(a1.controls.MatchmakingState)
            u21(a1.controls.CurrentPartySize)
        end, v9)
        v9 = {u11}
        useEffect(function() -- Line: 136 -- upvalues: u11 (val)
            local current = u11.current
            local u6 = if not current then nil else current:FindFirstAncestorWhichIsA("ScreenGui")
            local IgnoreGuiInset = if not u6 then nil else u6.IgnoreGuiInset
            local ScreenInsets = if not u6 then nil else u6.ScreenInsets
            local ClipToDeviceSafeArea = if not u6 then nil else u6.ClipToDeviceSafeArea
            if u6 then
                u6.IgnoreGuiInset = true
                u6.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
                u6.ClipToDeviceSafeArea = true
            end
            return function() -- Line: 153 -- upvalues: u6 (val), IgnoreGuiInset (val), ScreenInsets (val), ClipToDeviceSafeArea (val)
                if u6 and u6.Parent then
                    u6.IgnoreGuiInset = IgnoreGuiInset
                    u6.ScreenInsets = ScreenInsets
                    u6.ClipToDeviceSafeArea = ClipToDeviceSafeArea
                end
            end
        end, v9)
        v7 = v2 == "Searching"
        v8 = v2 == "Matched"
        v9 = v2 == "Idle"
        local v10 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            ref = u11,
        }
        local v11 = {}
        local v12 = ("Interface_%*"):format(v1)
        v11[v12] = (createElement(MatchmakingInterface, {
            canStartMatchmaking = v9 and a1.controls.IsPartyLeader,
            currentPartySize = a1.controls.CurrentPartySize,
            hasSandboxAdmin = a1.controls.HasAdminGamepass,
            hasVoidcoreAccess = a1.controls.HasVoidcoreAccess,
            initialTab = a1.controls.InitialTab,
            isPartyLeader = a1.controls.IsPartyLeader,
            mostPopularCategory = a1.controls.MostPopularCategory,
            partyLeader = u35[1],
            partyMembers = u35,
            playerLevel = a1.controls.PlayerLevel,
            playerCounts = {
                Arcade = a1.controls.PlayerCount,
                PVP = a1.controls.PlayerCount,
                Sandbox = a1.controls.PlayerCount,
                Story = a1.controls.PlayerCount,
                Survival = a1.controls.PlayerCount,
            },
            size = UDim2.fromScale(1, 1),
            storySections = v5,
            trialRotation = v4,
            visible = v9,
            pvpEnabled = a1.controls.PvpEnabled,
            sandboxEnabled = a1.controls.SandboxEnabled,
            onMatchmakingRequested = function(a1) -- Line: 289 -- upvalues: u21 (val), u16 (val)
                u21(a1.playerCount)
                u16("Searching")
                return true
            end,
        }))
        local v13 = {
            elapsedSeconds = 50,
            animateStatusDots = v7,
            canCancel = v7,
            onCancel = function() -- Line: 299 -- upvalues: u16 (val)
                u16("Idle")
            end,
        }
        local v14 = if not v8 then ("%*/%* Players"):format(a1.controls.CurrentPartySize, v3) else ("%*/%* Players"):format(v3, v3)
        v13.playerCountText = v14
        v13.showElapsedTime = v7
        v13.statusText = if not v8 then "Searching for players" else "Game found!"
        v13.visible = v7 or v8
        v11.Pairing = createElement(MatchmakingPairing, v13)
        return createElement("Frame", v10, v11)
    end,
}