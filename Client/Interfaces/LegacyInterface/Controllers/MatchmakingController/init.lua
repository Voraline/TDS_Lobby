-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.MatchmakingController
-- Decompile time: 10.61 ms

local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared
local LocalPlayer = Players.LocalPlayer
local Charm = require(ReplicatedStorage.Packages.Charm)
local MatchmakingStore = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.MatchmakingStore)
local Network = require(script.Network)
Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
LazyLoader = require(Shared.UI.LazyLoader)
ViewController = require(script.Parent.Parent.Controllers.ViewController)
States = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.MatchmakingStates)
local Emitter = require(ReplicatedStorage.Shared.Modules.Emitter)
local FFlagController = require(ReplicatedStorage.Client.Controllers.Shared.FFlagController)
local u68 = {}
u68.__index = u68
local u69 = ""
local u73 = FFlagController.get("matchmaking.active", false)
local u74 = {Interface = true, LoadingScreen = true, ReactUniversalMatchmaking = true}

local function updateActive() -- Line: 33 -- upvalues: u73 (val), MatchmakingStore (val)
    MatchmakingStore.setActive((u73()))
end

function u68:init(a2) -- Line: 39
    -- upvalues: Emitter (val), u68 (val), Charm (val), MatchmakingStore (val), Players (val), u74 (val), u69 (ref)
    -- upvalues: CollectionService (val), FFlagController (val), updateActive (val), u73 (val), Network (val)
    local u2 = false
    local u3 = {}
    self.statues = u3
    local u6 = Emitter.new()
    u6:On("manualMatch", function(a1) -- Line: 46 -- upvalues: u68 (upval)
        local v1, v2, v3
        if not u68:isInParty() then
            v1, v2 = u68:createParty(true)
            if not v1 then
                ViewController:notify(string.format("Error: %s", v2 or "unknown"), 5, (Color3.new(1, 0, 0)))
                return
            end
        end
        v1 = #u68:getParty().players
        u68:setCount(v1)
        v2, v3 = u68:startMatchmaking(a1, v1)
        if not v2 then
            ViewController:notify(string.format("Error: %s", v3 or "Unable to start matchmaking"), 5, (Color3.new(1, 0, 0)))
        end
    end)

    local function onMatchStatue(a1) -- Line: 78
        -- upvalues: u6 (val), u3 (val), Charm (upval), MatchmakingStore (upval), self (val)
        local u8 = require(script.Statue).new(a1, u6)
        u3[a1] = u8
        local u23 = nil
        if a1.Name ~= "PvP" then
            u23 = Charm.subscribe(MatchmakingStore.getActive, function(a1) -- Line: 87 -- upvalues: u8 (val) -- types: a1: boolean
                u8:SetDisabled(not a1)
            end)
            u8:SetDisabled(not (MatchmakingStore.getActive()))
        else
            u8:SetDisabled(true)
        end
        u8:On("triggered", function(a1, a2, a3, a4, a5) -- Line: 95 -- upvalues: self (upval)
            if (self:getCurrentState()) == States.IDLE then
                self:updateModeSelection(States.SELECTING, a1, a2, a3, a4, a5)
                Sound("Bleep"):Play()
            end
        end)
        ;(a1:GetPropertyChangedSignal("Parent")):Connect(function() -- Line: 109 -- upvalues: a1 (val), u23 (ref), u8 (val), u3 (upval)
            if not a1.Parent then
                if u23 then
                    u23()
                    u23 = nil
                end
                u8:Destroy()
                u3[a1] = nil
            end
        end)
    end

    local function onMatchState() -- Line: 122
        -- upvalues: MatchmakingStore (upval), u3 (val), Players (upval), u74 (upval), u69 (upval), u2 (ref)
        local v1 = MatchmakingStore.getMatchState()
        local v2 = v1 < States.SELECTING
        for k, v in pairs(u3) do
            v:SetEnabled(v2)
        end
        if v1 == States.SELECTING then
            ViewController:setView("ModeSelection")
        elseif v1 == States.MATCHED then
            ViewController:setView("Matched")
            if workspace.Type.Value == "Game" then
                for i, j in Players.LocalPlayer.PlayerGui:GetChildren() do
                    if j:IsA("ScreenGui") and not u74[j.Name] then
                        j.Enabled = false
                    end
                end
            end
        elseif v1 == States.SEARCHING then
            ViewController:setView("Matchmaking")
        end
        if States.SELECTING <= v1 then
            u69 = "Matchmaking"
        end
        if not (States.MATCHED <= v1) then
            if u2 then
                u2 = false
            end
            return
        end
        if u2 then
            return
        end
        u2 = true
    end

    if workspace.Type.Value == "Lobby" then
        (CollectionService:GetInstanceAddedSignal("MATCH_STATUE")):Connect(onMatchStatue)
        for i, v in ipairs(CollectionService:GetTagged("MATCH_STATUE")) do
            task.spawn(onMatchStatue, v)
        end
    end
    FFlagController.Updated:Connect(updateActive)
    local v1 = u73()
    MatchmakingStore.setActive(v1)
    Charm.subscribe(MatchmakingStore.getMatchState, onMatchState)
    onMatchState()
    Network:init()
    a2()
end

function u68.isLeader(a1) -- Line: 196 -- upvalues: LocalPlayer (val)
    return a1:getParty().leader == LocalPlayer
end

function u68.canCancel(a1) -- Line: 200 -- upvalues: MatchmakingStore (val)
    return MatchmakingStore.getCanCancel()
end

function u68.isActive(a1) -- Line: 205 -- upvalues: MatchmakingStore (val)
    return MatchmakingStore.getActive()
end

function u68.getKickingPlayers(a1) -- Line: 209 -- upvalues: MatchmakingStore (val)
    return MatchmakingStore.getKickingPlayers()
end

function u68.isKickingPlayers(a1) -- Line: 213
    return #a1:getKickingPlayers() > 0
end

function u68.setKickPlayers(a1, a2) -- Line: 217 -- upvalues: MatchmakingStore (val) -- types: a1: table, a2: table
    MatchmakingStore.setKickingPlayers(a2)
end

function u68.removeKickingPlayer(a1, a2) -- Line: 221 -- upvalues: MatchmakingStore (val) -- types: a1: table, a2: table
    local v1 = table.clone(a1:getKickingPlayers())
    local v2 = table.find(v1, a2)
    if v2 then
        table.remove(v1, v2)
    end
    MatchmakingStore.setKickingPlayers(v1)
    local v3, v4 = a1:kickPlayer(a2)
    if not v3 then
        ViewController:notify(v4, 5, (Color3.new(1, 0, 0)))
    end
    return v2 ~= nil
end

function u68.isInParty(a1) -- Line: 240 -- upvalues: MatchmakingStore (val)
    return MatchmakingStore.getIsInParty()
end

function u68.hasInvite(a1, a2) -- Line: 245
    for k, v in pairs((a1:getInvites())) do
        if v == a2 then
            return true
        end
    end
    return false
end

function u68.isSingleParty(a1) -- Line: 258 -- upvalues: MatchmakingStore (val)
    return MatchmakingStore.getSingleParty()
end

function u68.updateModeSelection(a1, a2, a3, a4, a5, a6, a7) -- Line: 263 -- upvalues: MatchmakingStore (val)
    MatchmakingStore.updateSelectionState({
        mode = a3,
        night = a4,
        christmas = a5,
        difficulty = a6,
        matchState = a2,
        challenge = a7,
    })
end

function u68.getState(a1) -- Line: 275 -- upvalues: MatchmakingStore (val)
    return MatchmakingStore.getMatchState()
end

function u68:getCurrentState(a2) -- Line: 280
    return self:getState()
end

function u68.getCount(a1) -- Line: 284 -- upvalues: MatchmakingStore (val)
    return MatchmakingStore.getCount()
end

function u68.setCount(a1, a2) -- Line: 288 -- upvalues: MatchmakingStore (val) -- types: a1: table, a2: number
    MatchmakingStore.setCount(a2)
end

function u68.getStates(a1) -- Line: 293
    return States
end

function u68.getParty(a1) -- Line: 298 -- upvalues: MatchmakingStore (val)
    return MatchmakingStore.getParty()
end

function u68.getSearch(a1) -- Line: 303 -- upvalues: MatchmakingStore (val)
    return MatchmakingStore.getSearch()
end

function u68.getMode(a1) -- Line: 308 -- upvalues: MatchmakingStore (val)
    return MatchmakingStore.getSelection().mode
end

function u68.getNight(a1) -- Line: 313 -- upvalues: MatchmakingStore (val)
    return MatchmakingStore.getSelection().night
end

function u68.getDifficulty(a1) -- Line: 318 -- upvalues: MatchmakingStore (val)
    return MatchmakingStore.getSelection().difficulty
end

function u68.getChristmas(a1) -- Line: 323 -- upvalues: MatchmakingStore (val)
    return MatchmakingStore.getSelection().christmas
end

function u68.getChallenge(a1) -- Line: 328 -- upvalues: MatchmakingStore (val)
    return MatchmakingStore.getSelection().challenge
end

function u68.getInvites(a1) -- Line: 333 -- upvalues: MatchmakingStore (val)
    return MatchmakingStore.getInvites()
end

function u68:getInvite(a2) -- Line: 338
    for k, v in pairs((self:getInvites())) do
        if v == a2 then
            return k
        end
    end
    return nil
end

function u68.updateInvite(a1, a2, a3) -- Line: 350 -- upvalues: Network (val), MatchmakingStore (val), u69 (ref)
    local v1 = a1:getInvite(a2)
    if not v1 then
        local format = string.format
        return false, format("Player %q has not sent you an invite!", a2 and a2.Name or "Unknown")
    end
    if a1:isInParty() and a3 then
        return false, "You cannot accept invites while in a party!"
    end
    if not Network:inviteAction(v1, a3) then
        return false, "Failed to update invite"
    end
    MatchmakingStore.removeInvite(v1)
    if a3 and u69 == "" then
        ViewController:setView("Party")
    end
    return true
end

function u68.createInvite(a1, a2) -- Line: 381 -- upvalues: LocalPlayer (val), Network (val)
    local v1 = a1:getParty()
    if v1 and v1.leader == LocalPlayer then
        if table.find(v1.players, a2) then
            return false, "Player is already in your party!"
        end
        local v2 = a1:getCurrentState()
        if States.SEARCHING <= v2 then
            return false, "You cannot invite players while searching for/in a match"
        end
        if not Network:invitePlayer(a2) then
            return false, "Failed to invite player to your party"
        end
        ViewController:notify((string.format("You have invited %s to your party!", a2.Name)))
        return true
    end
    return false, "You must be in a party/be the party leader"
end

function u68:createParty(a2) -- Line: 401 -- upvalues: Network (val)
    local players = self:getParty().players
    if players and #players > 0 then
        return false, "You are already in a party!"
    end
    if not Network:createParty(a2) then
        return false, "Failed to create party!"
    end
    return true
end

function u68:kickPlayer(a2) -- Line: 417 -- upvalues: LocalPlayer (val), Network (val)
    local v1 = self:getParty()
    local v2 = self:getCurrentState(false)
    if v1 and v1.leader == LocalPlayer then
        if not table.find(v1.players, a2) then
            return false, "Player is not in your party"
        end
        if States.SEARCHING <= v2 and v2 ~= States.KICKING then
            return false, "You cannot kick players while searching for/in a match"
        end
        ViewController:notify(string.format("You have kicked %s from your party!", a2.Name), 5, (Color3.new(1, 0, 0)))
        return Network:kickPlayer(a2)
    end
    return false, "You must be in a party/be the party leader"
end

function u68:leaveParty() -- Line: 438 -- upvalues: Network (val)
    local players = self:getParty().players
    if players and not (#players < 1) then
        local v1 = self:getCurrentState()
        if States.SEARCHING <= v1 then
            return false, "You cannot leave while searching for/paired in a match"
        end
        if not Network:leaveParty() then
            return false, "Failed to leave party!"
        end
        return true
    end
    return false, "You are not in a party!"
end

function u68:startMatchmaking(a2, a3, a4, a5, a6, a7) -- Line: 457
    -- upvalues: LocalPlayer (val), MatchmakingStore (val), u69 (ref), Network (val)
    local v1 = self:getParty()
    local v2 = self:getState()
    local players = v1.players
    if players and not (#players < 1) then
        if v1.leader ~= LocalPlayer then
            return false, "You are not the leader of the party!"
        end
        if States.SELECTING < v2 and v2 ~= States.KICKING then
            return false, "You are already searching/have found a match!"
        end
        MatchmakingStore.setMatchState(States.IDLE)
        u69 = "Matchmaking"
        local v3 = {
            mode = a2,
            count = a3,
            night = a4,
            difficulty = a5,
            challenge = a6,
            story = a7,
        }
        local v4, v5 = Network:startMatchmaking(v3)
        if v4 then
            return true
        end
        if type(v5) == "string" then
            return false, v5
        end
        if v5 then
            if v5.rejectedPlayers then
                v3 = {}
                for i, j in v5.rejectedPlayers do
                    if j.player ~= LocalPlayer then
                        table.insert(v3, j.player)
                    end
                end
                MatchmakingStore.setMatchState(States.KICKING)
                ViewController:setView("KickingPlayers")
                self:setKickPlayers(v3)
                return true
            end
            if v5.rejectionMessage then
                return v5.rejectionMessage
            end
        end
        return false
    end
    return false, "You are not in a party!"
end

function u68.isV2(a1) -- Line: 517 -- upvalues: Network (val)
    return Network:isV2()
end

function u68.cancelMatchmaking(a1) -- Line: 522 -- upvalues: Network (val), LocalPlayer (val), MatchmakingStore (val)
    if (a1:getCurrentState(false)) ~= States.SEARCHING then
        return false, "You are not searching for a match!"
    end
    if a1:isV2() then
        return Network:stopMatchmaking()
    end
    local v1 = a1:getParty()
    local v2 = a1:isSingleParty()
    if v1.leader ~= LocalPlayer then
        return false, "You are not the leader of the party!"
    end
    if not Network:stopMatchmaking() then
        return false, "Failed to cancel matchmaking!"
    end
    if v2 then
        MatchmakingStore.resetParty()
    end
    return true
end

return (LazyLoader(u68))