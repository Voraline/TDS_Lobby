-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.Vote
-- Decompile time: 10.04 ms

game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local useMediaQuery = require(ReplicatedStorage.Client.Interfaces.Hooks.useMediaQuery)
local usePlayerEntities = require(ReplicatedStorage.Client.Interfaces.Hooks.usePlayerEntities)
local useReplicatedState = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatedState)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useServerTick = require(ReplicatedStorage.Client.Interfaces.Hooks.useServerTick)
local useTagReplicators = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagReplicators)
local useViewEnabled = require(ReplicatedStorage.Client.Interfaces.Hooks.useViewEnabled)
local CutsceneSkipVote = require(ReplicatedStorage.Client.Interfaces.Universal.Components.CutsceneSkipVote)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local VoteGame = require(ReplicatedStorage.Client.Interfaces.Universal.Components.VoteGame)
local VoteWave = require(ReplicatedStorage.Client.Interfaces.Universal.Components.VoteWave)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local React = require(ReplicatedStorage.Shared.UI.React)
local useCallback = React.useCallback
local useMemo = React.useMemo
local createElement = React.createElement
local Voting = Network.Channel("Voting")

local function useHasVoted(a1, a2) -- Line: 28
    -- upvalues: useReplicatedState (val), useMemo (val), Players (val)
    local u6 = useReplicatedState(a1, "YesVoted", {})
    local u11 = useReplicatedState(a1, "NoVoted", {})
    return useMemo(function() -- Line: 32 -- upvalues: u6 (val), Players (upval), a2 (val), u11 (val)
        for i, j in u6 do
            if j == Players.LocalPlayer.UserId then
                return true
            end
        end
        if a2 then
            for k, n in u11 do
                if n == Players.LocalPlayer.UserId then
                    return true
                end
            end
        end
        return false
    end, {u6, u11, a2})
end

local function WaveVote(a1) -- Line: 51
    -- upvalues: useReplicatedState (val), useHasVoted (val), table (val), usePlayerEntities (val), useServerTick (val)
    -- upvalues: useScale (val), useMediaQuery (val), useCallback (val), Voting (val), createElement (val)
    -- upvalues: CutsceneSkipVote (val), VoteGame (val), ReplicatedStorage (val), VoteWave (val)
    local Replicator = a1.Replicator
    local GameReplicator = a1.GameReplicator
    local v1 = useReplicatedState(Replicator, "Title")
    local v2 = useReplicatedState(Replicator, "MaxVotes")
    local v3 = useReplicatedState(Replicator, "VoteCount")
    local v4 = useReplicatedState(Replicator, "VetoCount")
    local v5 = useReplicatedState(Replicator, "Enabled")
    local u30 = useHasVoted(Replicator, not (v1 == "Ready?"))
    local v6 = useReplicatedState(Replicator, "YesVoted", {})
    local v7 = table.reduce(usePlayerEntities(), function(a1, a2, a3) -- Line: 65 -- upvalues: table (upval)
        if typeof(a3) == "table" then
            table.insert(a1, a3.UserId)
        end
        return a1
    end, {})
    local v8 = nil
    local u47 = useReplicatedState(Replicator, "VoteEnd")
    local v9 = useServerTick()
    local v10 = useScale()
    local v11 = not useMediaQuery("large")
    local v12 = useCallback(function() -- Line: 78 -- upvalues: Voting (upval)
        Voting:InvokeServer("Skip")
    end, {})
    if Replicator and GameReplicator then
        local v13
        if u47 then
            v8 = v9:map(function(a1) -- Line: 87 -- upvalues: u47 (val)
                return (math.max(0, (math.floor(u47 - a1))))
            end)
        end
        if v1 == "Restart?" then
            return
        end
        if v1 == "Skip Cutscene?" then
            return createElement(CutsceneSkipVote, {
                hasVoted = u30,
                onVote = v12,
                requiredVotes = v2,
                visible = v5,
                votes = v3,
            })
        end
        if v13 then
            return createElement(VoteGame, {
                size = if not v11 then nil else UDim2.fromScale(0.25, 0.25),
                players = v7,
                votedPlayers = v6,
                title = v1,
                text = if not u30 then "READY" else "UNREADY",
                hasVoted = u30,
                maxVotes = v2,
                visible = v5,
                clicked = function() -- Line: 116 -- upvalues: ReplicatedStorage (upval), u30 (val)
                    local v1 = if u30 then "Veto" else "Skip"
                    ;(require(ReplicatedStorage.Shared.Modules.Network).Channel("Voting")):InvokeServer(v1)
                end,
            }, {})
        end
        return createElement(VoteWave, {
            Title = v1,
            YesVotes = v3,
            NoVotes = v4,
            TotalVotes = v2,
            Timer = v8,
            Shown = v5 and not u30,
            Voted = function(a1) -- Line: 130 -- upvalues: ReplicatedStorage (upval) -- types: a1: boolean
                local v1 = if not a1 then "Veto" else "Skip"
                ;(require(ReplicatedStorage.Shared.Modules.Network).Channel("Voting")):InvokeServer(v1)
            end,
        }, {uiScale = createElement("UIScale", {Scale = math.max(0.6, v10)})})
    end
end

return function(a1) -- Line: 143
    -- upvalues: useViewEnabled (val), useTagReplicators (val), useReplicatedState (val), createElement (val)
    -- upvalues: WaveVote (val), GameState (val)
    local v1
    local v2 = false
    for i, j in {"", "Hotbar", "Upgrades"} do
        v1 = useViewEnabled(j)
        v2 = v2 or v1
    end
    local v3 = useTagReplicators("VoteManager")[1]
    local v4 = useReplicatedState(v3, "Title", "")
    local v5 = useReplicatedState(useTagReplicators("CurseReplicator")[1], "VotingActive")
    v1 = nil
    if v3 then
        v1 = createElement(WaveVote, {Replicator = v3, GameReplicator = GameState.State})
    end
    return not v5 and createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        Visible = v2 or v4 == "Skip Cutscene?",
    }, {votes = v1})
end