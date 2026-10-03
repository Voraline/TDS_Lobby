-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Lobby.MatchmakingStore
-- Decompile time: 13.16 ms

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Charm = require(ReplicatedStorage.Packages.Charm)
local MatchmakingStates = require(script.Parent.MatchmakingStates)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local LocalPlayer = Players.LocalPlayer

local function shouldPopulate(a1) -- Line: 58 -- upvalues: RunService (val)
    if RunService:IsRunning() then
        return {}
    end
    return a1
end

local v1 = {
    active = false,
    count = 0,
    mode = "",
    noCancel = false,
    single = false,
    currentState = {},
}
local v2 = {[HttpService:GenerateGUID(false)] = LocalPlayer}
v1.invites = if not RunService:IsRunning() then v2 else {}
v1.kickingPlayers = {}
v1.matchState = MatchmakingStates.IDLE
v1.party = if not RunService:IsRunning() then {lookup = {}, players = {}} else {}
v1.search = {started = 0, result = {}}
local u72, u73 = Charm.signal(v1)
local v3, v4 = Charm.signal(nil)

local function cloneArray(a1) -- Line: 98 -- types: a1: table?
    local v1 = {}
    for i, j in a1 or {} do
        v1[i] = j
    end
    return v1
end

local function cloneMap(a1) -- Line: 108 -- types: a1: table?
    local v1 = {}
    for i, j in a1 or {} do
        v1[i] = j
    end
    return v1
end

local function cloneParty(a1) -- Line: 118 -- types: a1: table?
    local v1
    local v2 = {leader = a1 and a1.leader or nil}
    if not a1 then
        v1 = nil
    else
        v1 = {}
        for i, j in a1.lookup or {} do
            v1[i] = j
        end
        if not v1 then
            v1 = nil
        end
    end
    v2.lookup = v1
    local players = if not a1 then nil else a1.players
    v1 = {}
    for k, n in players or {} do
        v1[k] = n
    end
    v2.players = v1
    return v2
end

local function cloneSearch(a1) -- Line: 126 -- types: a1: table?
    local v1 = {started = a1 and a1.started or 0}
    local result = if not a1 then nil else a1.result
    local v2 = {}
    for i, j in result or {} do
        v2[i] = j
    end
    v1.result = v2
    return v1
end

local function cloneSelection(a1) -- Line: 133 -- types: a1: table
    return {
        challenge = a1.challenge,
        christmas = a1.christmas,
        difficulty = a1.difficulty,
        mode = a1.mode or "",
        night = a1.night,
    }
end

local function cloneState(a1) -- Line: 143 -- upvalues: cloneParty (val) -- types: a1: table
    local v1 = {
        active = a1.active,
        challenge = a1.challenge,
        christmas = a1.christmas,
        count = a1.count,
    }
    local v2 = {}
    for i, j in a1.currentState or {} do
        v2[i] = j
    end
    v1.currentState = v2
    v1.difficulty = a1.difficulty
    v1.id = a1.id
    v2 = {}
    for k, n in a1.invites or {} do
        v2[k] = n
    end
    v1.invites = v2
    v2 = {}
    for m, i5 in a1.kickingPlayers or {} do
        v2[m] = i5
    end
    v1.kickingPlayers = v2
    v1.matchState = a1.matchState
    v1.mode = a1.mode
    v1.night = a1.night
    v1.noCancel = a1.noCancel
    v1.party = cloneParty(a1.party)
    local search = a1.search
    v2 = {started = search and search.started or 0}
    local result = if not search then nil else search.result
    local v3 = {}
    for i6, i7 in result or {} do
        v3[i6] = i7
    end
    v2.result = v3
    v1.search = v2
    v1.single = a1.single
    v1.v2status = a1.v2status
    return v1
end

local function setFields(a1, a2) -- Line: 165
    -- upvalues: cloneState (val), u72 (val), u73 (val)
    local v1 = cloneState(u72())
    for i, j in a1 do
        v1[i] = j
    end
    for k, n in a2 or {} do
        v1[n] = nil
    end
    u73(v1)
end

local function getPlayerFromChild(a1) -- Line: 179
    if typeof(a1) == "Instance" and a1:IsA("Player") then
        return a1
    end
    if type(a1) == "table" then
        return a1.player
    end
    return nil
end

local function parseParty(a1, a2) -- Line: 189
    local player
    local v1 = nil
    local v2 = {}
    local group_leader = a1 and a1.group_leader
    local v3 = nil
    local v4 = nil
    for i, j in a2 or {}, v3, v4 do
        player = if typeof(j) ~= "Instance" then if type(j) ~= "table" then nil else j.player else if not j:IsA("Player") then if type(j) ~= "table" then nil else j.player else j
        if player then
            if player.UserId ~= group_leader then
                table.insert(v2, player)
            else
                v1 = player
                table.insert(v2, 1, player)
            end
        end
    end
    return {leader = v1, players = v2}
end

local function getNumberField(a1, a2) -- Line: 213 -- types: a2: table
    local v1
    local v2 = nil
    local v3 = nil
    local v4 = a1
    for i, j in a2, v2, v3 do
        v1 = v4 and v4[j]
        if v1 ~= nil then
            return tonumber(v1) or 0
        end
    end
    return 0
end

local function parseSearch(a1, a2) -- Line: 224 -- types: a1: table?
    local v1 = {started = a1 and a1.started or 0}
    local result = if not a1 then nil else a1.result
    local v2 = {}
    local v3 = result or {}
    local v4 = nil
    for i, j in v3, v4 do
        v2[i] = j
    end
    v1.result = v2
    if a2 and a2.player_array then
        local session, towers, v5, v6, v7, v8, v9, v10
        v2 = {}
        v3 = nil
        v4 = nil
        for k, n in a2.player_array, v3, v4 do
            session = n.session or {}
            v5 = {Name = n.name, UserId = n.userId}
            v6 = {Level = session.level}
            towers = session.towers or {}
            v6.Towers = towers
            v7 = {"wins", "triumphs"}
            v8 = nil
            v9 = nil
            for m, i5 in v7, v8, v9 do
                v10 = session and session[i5]
                if v10 ~= nil then
                    v6.Triumphs = tonumber(v10) or 0
                    v7 = {"losses", "loses"}
                    v8 = nil
                    v9 = nil
                    for i6, i7 in v7, v8, v9 do
                        v10 = session and session[i7]
                        if v10 ~= nil then
                            v6.Losses = tonumber(v10) or 0
                            v5.Session = v6
                            table.insert(v2, v5)
                            -- [[ incomplete: control flow could not be represented ]]
                        end
                    end
                    v6.Losses = 0
                    v5.Session = v6
                    table.insert(v2, v5)
                    break
                end
            end
            v6.Triumphs = 0
            v7 = {"losses", "loses"}
            v8 = nil
            v9 = nil
            for i8, i9 in v7, v8, v9 do
                v10 = session and session[i9]
                if v10 ~= nil then
                    v6.Losses = tonumber(v10) or 0
                    v5.Session = v6
                    table.insert(v2, v5)
                    break
                end
            end
            v6.Losses = 0
            v5.Session = v6
            table.insert(v2, v5)
        end
        v1.result = v2
    end
    return v1
end

return {
    getState = u72,
    getDirectStatue = v3,
    setDirectStatue = v4,
    getActive = function() -- Line: 257 -- upvalues: u72 (val)
        return u72().active
    end,
    getCount = function() -- Line: 261 -- upvalues: u72 (val)
        return u72().count
    end,
    getCurrentState = function() -- Line: 265 -- upvalues: u72 (val)
        return u72().currentState
    end,
    getInvites = function() -- Line: 269 -- upvalues: u72 (val)
        return u72().invites
    end,
    getKickingPlayers = function() -- Line: 273 -- upvalues: u72 (val)
        return u72().kickingPlayers
    end,
    getMatchState = function() -- Line: 277 -- upvalues: u72 (val)
        return u72().matchState
    end,
    getNoCancel = function() -- Line: 281 -- upvalues: u72 (val)
        return u72().noCancel
    end,
    getParty = function() -- Line: 285 -- upvalues: u72 (val)
        return u72().party
    end,
    getSearch = function() -- Line: 289 -- upvalues: u72 (val)
        return u72().search
    end,
    getSelection = function() -- Line: 293 -- upvalues: u72 (val)
        local v1 = u72()
        return {
            challenge = v1.challenge,
            christmas = v1.christmas,
            difficulty = v1.difficulty,
            mode = v1.mode or "",
            night = v1.night,
        }
    end,
    getSingleParty = function() -- Line: 297 -- upvalues: u72 (val)
        return u72().single == true
    end,
    getV2Status = function() -- Line: 301 -- upvalues: u72 (val)
        return u72().v2status
    end,
    getCanCancel = function() -- Line: 305 -- upvalues: u72 (val), LocalPlayer (val)
        local v1 = u72()
        local v2 = false
        if v1.party.leader == LocalPlayer then
            v2 = not v1.noCancel
        end
        return v2
    end,
    getCanStartMatchmaking = function() -- Line: 310 -- upvalues: u72 (val), MatchmakingStates (val), LocalPlayer (val)
        local v1 = u72()
        local party = v1.party
        local v2 = false
        if v1.matchState < MatchmakingStates.SEARCHING then
            v2 = not party.leader or party.leader == LocalPlayer
        end
        return v2
    end,
    getIsInParty = function() -- Line: 317 -- upvalues: u72 (val)
        return #u72().party.players > 0
    end,
    setActive = function(a1) -- Line: 321 -- upvalues: setFields (val) -- types: a1: boolean
        setFields({active = a1})
    end,
    setCount = function(a1) -- Line: 327 -- upvalues: setFields (val) -- types: a1: number
        setFields({count = a1})
    end,
    setKickingPlayers = function(a1) -- Line: 333 -- upvalues: setFields (val) -- types: a1: table
        local v1 = {}
        local v2 = {}
        for i, j in a1 or {} do
            v2[i] = j
        end
        v1.kickingPlayers = v2
        setFields(v1)
    end,
    updateSelectionState = function(a1) -- Line: 339 -- upvalues: setFields (val)
        local v1 = {matchState = a1.matchState, mode = a1.mode or ""}
        local v2 = {}
        for i, j in {"night", "christmas", "difficulty", "challenge"} do
            if a1[j] ~= nil then
                v1[j] = a1[j]
            else
                table.insert(v2, j)
            end
        end
        setFields(v1, v2)
    end,
    addInvite = function(a1) -- Line: 357 -- upvalues: u72 (val), setFields (val) -- types: a1: table
        local v1 = u72()
        if v1.invites[a1.id] then
            return
        end
        local v2 = {}
        for i, j in v1.invites or {} do
            v2[i] = j
        end
        v2[a1.id] = a1.player
        setFields({invites = v2})
    end,
    removeInvite = function(a1) -- Line: 371 -- upvalues: u72 (val), setFields (val) -- types: a1: string
        local v1 = {}
        for i, j in u72().invites or {} do
            v1[i] = j
        end
        v1[a1] = nil
        setFields({invites = v1})
    end,
    setParty = function(a1) -- Line: 380 -- upvalues: u72 (val), setFields (val), parseParty (val), parseSearch (val)
        local v1 = u72()
        local v2 = {}
        local v3 = {}
        for i, j in a1.state or {} do
            v3[i] = j
        end
        v2.currentState = v3
        v2.single = a1.single
        v2.id = a1.id
        v2.party = parseParty(a1.state, a1.children)
        v2.search = parseSearch(v1.search, a1.state)
        setFields(v2)
    end,
    resetParty = function() -- Line: 392 -- upvalues: setFields (val), MatchmakingStates (val)
        setFields({
            single = false,
            matchState = MatchmakingStates.IDLE,
            currentState = {},
            party = {players = {}},
            search = {started = 0, result = {}},
        }, {"id"})
    end,
    setState = function(a1) -- Line: 408
        -- upvalues: u72 (val), parseSearch (val), MatchmakingStates (val), setFields (val), parseParty (val)
        local v1 = u72()
        if v1.id == nil then
            return
        end
        local state = a1.state
        local children = a1.children or v1.party.players or {}
        local v2 = parseSearch(v1.search, state)
        local matchState = v1.matchState
        if not state.is_active then
            matchState = MatchmakingStates.IDLE
        elseif state.is_teleporting then
            matchState = MatchmakingStates.MATCHED
        elseif not state.is_searching then
            matchState = MatchmakingStates.IDLE
        elseif matchState ~= MatchmakingStates.SEARCHING then
            matchState = MatchmakingStates.SEARCHING
            v2.started = os.time()
        end
        local v3 = {}
        local v4 = {}
        for i, j in state or {} do
            v4[i] = j
        end
        v3.currentState = v4
        v3.party = parseParty(state, children)
        v3.search = v2
        v3.matchState = matchState
        setFields(v3)
    end,
    setMatchState = function(a1) -- Line: 442 -- upvalues: setFields (val) -- types: a1: number
        setFields({matchState = a1})
    end,
    setMembers = function(a1) -- Line: 448 -- upvalues: setFields (val), cloneParty (val) -- types: a1: table
        setFields({party = cloneParty(a1)})
    end,
    addMembers = function(a1) -- Line: 454
        -- upvalues: u72 (val), LocalPlayer (val), ViewController (val), setFields (val)
        local v1 = {}
        for i, j in u72().party.players or {} do
            v1[i] = j
        end
        local v2 = nil
        local v3 = nil
        for k, n in a1, v2, v3 do
            if not table.find(v1, n) then
                if n ~= LocalPlayer then
                    ViewController:notify((string.format("%s has joined the party", n.Name)))
                end
                table.insert(v1, n)
            end
        end
        setFields({party = {leader = u72().party.leader, players = v1}})
    end,
    removeMembers = function(a1) -- Line: 476
        -- upvalues: u72 (val), LocalPlayer (val), ViewController (val), setFields (val)
        local v1
        local v2 = {}
        for i, j in u72().party.players or {} do
            v2[i] = j
        end
        local v3 = nil
        local v4 = nil
        for k, n in a1, v3, v4 do
            v1 = table.find(v2, n)
            if v1 and v1 > 0 then
                if n ~= LocalPlayer then
                    ViewController:notify((string.format("%s has left the party", n.Name)))
                end
                table.remove(v2, v1)
            end
        end
        setFields({party = {leader = u72().party.leader, players = v2}})
    end,
    startSearch = function() -- Line: 498 -- upvalues: u72 (val), MatchmakingStates (val), setFields (val)
        if u72().matchState == MatchmakingStates.SEARCHING then
            return
        end
        local v1 = {matchState = MatchmakingStates.SEARCHING}
        local v2 = {started = os.time()}
        local v3 = {}
        for i, j in u72().search.result or {} do
            v3[i] = j
        end
        v2.result = v3
        v1.search = v2
        setFields(v1)
    end,
    stopSearch = function() -- Line: 512 -- upvalues: setFields (val), MatchmakingStates (val)
        setFields({matchState = MatchmakingStates.IDLE})
    end,
    searchResult = function(a1) -- Line: 518 -- upvalues: setFields (val), MatchmakingStates (val), u72 (val) -- types: a1: table
        local v1 = {matchState = MatchmakingStates.MATCHED}
        local v2 = {started = u72().search.started}
        local v3 = {}
        for i, j in a1 or {} do
            v3[i] = j
        end
        v2.result = v3
        v1.search = v2
        setFields(v1)
    end,
    setV2Match = function(a1) -- Line: 528 -- upvalues: Players (val), setFields (val), u72 (val), MatchmakingStates (val)
        local UserId, data, result, success, towers, v1, v2, v3, v4
        local v5 = {}
        local v6 = nil
        local v7 = nil
        for i, j in a1.tickets, v6, v7 do
            v3 = nil
            v4 = nil
            for k, n in j.players, v3, v4 do
                data = n.data or {}
                UserId = n.userId or -1
                if n.player then
                    UserId = n.player.UserId
                end
                success, result = pcall(Players.GetNameFromUserIdAsync, Players, UserId)
                v1 = {Name = if not success then "?" else result, UserId = UserId}
                v2 = {Level = n.level}
                towers = data.towers or {}
                v2.Towers = towers
                v2.Triumphs = tonumber(data.triumphs) or 0
                v2.Losses = tonumber(data.losses) or 0
                v1.Session = v2
                table.insert(v5, v1)
            end
        end
        setFields({
            v2status = "ready",
            search = {started = u72().search.started, result = v5},
            matchState = MatchmakingStates.MATCHED,
        })
    end,
    setV2Status = function(a1) -- Line: 565 -- upvalues: u72 (val), MatchmakingStates (val), setFields (val) -- types: a1: string?
        local v1 = u72()
        local search = v1.search
        local v2 = {started = search and search.started or 0}
        local result = if not search then nil else search.result
        local v3 = {}
        for i, j in result or {} do
            v3[i] = j
        end
        v2.result = v3
        local matchState = v1.matchState
        if a1 == nil then
            matchState = MatchmakingStates.IDLE
        elseif a1 == "pending" or a1 == "matching" then
            if matchState == MatchmakingStates.IDLE then
                v2.started = os.time()
            end
            matchState = MatchmakingStates.SEARCHING
        end
        local v4 = {}
        local v5 = true
        if a1 ~= "confirming" then
            v5 = a1 == "canceling"
        end
        v4.noCancel = v5
        v4.v2status = a1
        v4.matchState = matchState
        v4.search = v2
        setFields(v4, if a1 ~= nil then nil else {"v2status"})
    end,
}