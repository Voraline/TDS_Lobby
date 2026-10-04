-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Matchmaking.MatchmakingFound
-- Decompile time: 5.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Matchmaking = Interfaces.Universal.Components.Matchmaking
local Lobby = Interfaces.Stores.Lobby
local Shared = Interfaces.Stores.Shared
local MatchmakingResultCard = require(Matchmaking.MatchmakingResultCard)
local MatchmakingResults = require(Matchmaking.MatchmakingResults)
local MatchmakingStore = require(Lobby.MatchmakingStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local ScreenStore = require(Shared.ScreenStore)
local MatchmakingStates = require(Lobby.MatchmakingStates)
local useConfetti = require(Interfaces.Hooks.useConfetti)
local createElement = React.createElement
local useEffect = React.useEffect
local useRef = React.useRef
local u45 = {}
local v1 = {Amount = 40, Lifetime = 1, Force = 20, Direction = Vector2.new(0.9, 0)}
local v2 = {Amount = 40, Lifetime = 1, Force = 20, Direction = Vector2.new(-0.9, 0)}
u45[1] = v1
u45[2] = v2

local function getAvatarImage(a1) -- Line: 36 -- types: a1: number
    return (("rbxthumb://type=Avatar&id=%*&w=420&h=420"):format(a1))
end

local function getResults(a1) -- Line: 40
    return a1 and a1.result or {}
end

local function Results(a1) -- Line: 44
    -- upvalues: createElement (val), MatchmakingResultCard (val), MatchmakingResults (val)
    local Session, v1, v2
    local v3 = {}
    local v4 = a1
    for i, v in ipairs(a1.results) do
        Session = v.Session or {}
        v1 = v.UserId or 1
        v2 = ("%*:%*"):format(v1, i)
        v3[v2] = (createElement(MatchmakingResultCard, {
            index = i,
            layoutOrder = i,
            title = ("@%*"):format(v.Name or "Player"),
            levelText = ("Lv. %*"):format(Session.Level or 0),
            lossesText = tostring(Session.Losses or 0),
            triumphsText = tostring(Session.Triumphs or 0),
            playerImage = ("rbxthumb://type=Avatar&id=%*&w=420&h=420"):format(v1),
            towers = Session.Towers,
        }))
    end
    return createElement(MatchmakingResults, {visible = #v4.results > 0, screenSize = v4.screenSize}, v3)
end

return function() -- Line: 69
    -- upvalues: ReactCharm (val), MatchmakingStore (val), ScreenStore (val), useConfetti (val), u45 (val), useRef (val)
    -- upvalues: useEffect (val), MatchmakingStates (val), createElement (val), Results (val)
    local u4 = ReactCharm.useSignalState(MatchmakingStore.getMatchState)
    local v1 = ReactCharm.useSignalState(MatchmakingStore.getSearch)
    local v2 = ReactCharm.useSignalState(ScreenStore.getState)
    local u17, u18 = useConfetti(u45)
    local u21 = useRef(nil)
    local u24 = useRef(false)
    local v3 = {u17, u21}
    useEffect(function() -- Line: 77 -- upvalues: u17 (val), u21 (val)
        if u17.current and u21.current then
            u17.current.Parent = u21.current
        end
    end, v3)
    v3 = {u4}
    useEffect(function() -- Line: 83 -- upvalues: u4 (val), MatchmakingStates (upval), u24 (val), u18 (val)
        if u4 == MatchmakingStates.MATCHED and u24.current then
            u18()
        end
        u24.current = u4 == MatchmakingStates.SEARCHING
    end, v3)
    local result = v1 and v1.result or {}
    local v4 = u4 == MatchmakingStates.MATCHED
    return createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Visible = v4}, {
        Confetti = createElement("Frame", {
            Name = "Confetti",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            ref = u21,
        }),
        Results = createElement(Results, {results = if not v4 then {} else result, screenSize = v2.screenSize}),
    })
end