-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.MatchmakingController.Network
-- Decompile time: 10.18 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage:WaitForChild("Shared")
local LocalPlayer = Players.LocalPlayer
local Channel = (require(Shared.UI.Network)).Channel
local Enum = require(Shared.Modules.Enum)
local MatchmakingStore = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.MatchmakingStore)
local MatchmakingStates = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.MatchmakingStates)
local ViewController = require(script.Parent.Parent.ViewController)
local v1 = {}
local Multiplayer = Channel("Multiplayer")

local function formatEvent(a1) -- Line: 19
    return "on" .. (a1:gsub("%_(%a)", string.upper)):gsub("^%a", string.upper)
end

function v1.init(a1) -- Line: 23 -- upvalues: Multiplayer (val), MatchmakingStore (val), ViewController (val)
    local upper
    if a1._setup then
        return
    end
    a1._setup = true
    a1._mixins = {}
    a1._useV2 = nil
    for i, v in ipairs({"added", "removed", "kicked", "destroyed", "invite_add", "invite_remove", "update", "event"}) do
        upper = string.upper
        local u59 = "on" .. (v:gsub("%_(%a)", upper)):gsub("^%a", string.upper)
        if a1[u59] then
            a1:include(u59, function(...) -- Line: 57 -- upvalues: a1 (val), u59 (val)
                a1[u59](a1, ...)
            end)
            Multiplayer:On(v, function(...) -- Line: 61 -- upvalues: a1 (val), u59 (val)
                a1:use(u59, ...)
            end)
        else
            warn(string.format("Network: Missing event handler for %s (%s)", v, u59))
        end
    end
    Multiplayer:On("v2:update", function(a1) -- Line: 66 -- upvalues: MatchmakingStore (upval)
        MatchmakingStore.setV2Status(a1)
    end)
    Multiplayer:On("v2:ready", function(a1) -- Line: 70 -- upvalues: MatchmakingStore (upval)
        MatchmakingStore.setV2Match(a1)
    end)
    Multiplayer:On("v2:error", function(a1) -- Line: 74 -- upvalues: ViewController (upval)
        ViewController:notifyError(a1)
    end)
    pcall(function() -- Line: 78 -- upvalues: a1 (val)
        a1:_getV2()
    end)
end

function v1:use(a2, ...) -- Line: 83
    if not self._setup then
        return
    end
    local v1 = self._mixins[a2]
    if v1 then
        v1(...)
    end
end

function v1:include(a2, a3) -- Line: 94
    if not self._setup then
        return
    end
    self._mixins[a2] = a3
end

function v1:_getV2() -- Line: 102 -- upvalues: Multiplayer (val)
    self._useV2 = Multiplayer:InvokeServer("v2:active") == true
end

function v1:isV2(a2) -- Line: 107 -- types: self: table, a2: boolean?
    if self._useV2 == nil then
        self:_getV2()
    end
    return self._useV2
end

function v1.startMatchmaking(a1, a2) -- Line: 125 -- upvalues: Multiplayer (val), MatchmakingStore (val), Enum (val)
    if a1:isV2() then
        return Multiplayer:InvokeServer("v2:start", a2)
    end
    local v1 = MatchmakingStore.getParty()
    local v2 = MatchmakingStore.getSingleParty()
    if not v1.leader then
        return false
    end
    local v3 = Multiplayer:InvokeServer(if not v2 then "party_start" else "single_start", a2)
    if v3 == Enum.Result.Success then
        return true
    end
    return false, v3 and not (v3 == Enum.Result.Error) and v3.result or nil
end

function v1.stopMatchmaking(a1) -- Line: 147 -- upvalues: Multiplayer (val), MatchmakingStore (val), Enum (val)
    local v1
    if a1:isV2() then
        return Multiplayer:InvokeServer("v2:stop")
    end
    local leader = (MatchmakingStore.getParty()).leader
    local v2 = MatchmakingStore.getSingleParty()
    if not leader then
        return false
    end
    if (Multiplayer:InvokeServer(if not v2 then "party_stop" else "single_stop")) == Enum.Result.Success then
        MatchmakingStore.stopSearch()
    end
    return v1
end

function v1.customEvent(a1, a2, ...) -- Line: 169 -- upvalues: Multiplayer (val)
    return (Multiplayer:FireServer("party_event", {type = a2, data = {...}}))
end

function v1.customInvoke(a1, a2, ...) -- Line: 178 -- upvalues: Multiplayer (val)
    return Multiplayer:InvokeServer("party_invoke", {type = a2, data = {...}})
end

function v1.createParty(a1, a2) -- Line: 191
    -- upvalues: Multiplayer (val), Enum (val), MatchmakingStore (val), MatchmakingStates (val), LocalPlayer (val)
    local v1 = Multiplayer:InvokeServer(if not a2 then "party_create" else "single_create")
    if v1 and v1 ~= Enum.Result.Error then
        MatchmakingStore.setMatchState(MatchmakingStates.IDLE)
        MatchmakingStore.setParty({
            id = v1.id,
            single = a2,
            state = v1.state,
            children = {[LocalPlayer.UserId] = {player = LocalPlayer, session = {}}},
        })
        return true
    end
    return false
end

function v1.kickPlayer(a1, a2) -- Line: 215 -- upvalues: Multiplayer (val), Enum (val)
    if (Multiplayer:InvokeServer("party_kick", a2)) == Enum.Result.Error then
        return false
    end
    return true
end

function v1.leaveParty(a1) -- Line: 226 -- upvalues: Multiplayer (val), Enum (val), MatchmakingStore (val)
    local v1
    if (Multiplayer:InvokeServer("party_leave")) == Enum.Result.Success then
        MatchmakingStore.resetParty()
    end
    return v1
end

function v1.invitePlayer(a1, a2) -- Line: 240 -- upvalues: Multiplayer (val), Enum (val)
    return (Multiplayer:InvokeServer("invite_player", a2)) == Enum.Result.Success
end

function v1.inviteAction(a1, a2, a3) -- Line: 247
    -- upvalues: Multiplayer (val), Enum (val), ViewController (val), MatchmakingStore (val)
    local v1 = Multiplayer:InvokeServer("invite_action", a2, a3)
    if v1 ~= Enum.Result.Error and v1 then
        if v1 ~= Enum.Result.Success then
            local v2 = v1.children[tostring(v1.state.group_leader)]
            if v2 then
                ViewController:notify((string.format("You have joined %s's party!", v2.player.Name)))
            end
            MatchmakingStore.setParty({single = false, id = a2, state = v1.state, children = v1.children})
        end
        return true
    end
    return false, v1
end

function v1.onKicked(a1) -- Line: 281 -- upvalues: MatchmakingStore (val)
    MatchmakingStore.resetParty()
end

function v1.onRemoved(a1, a2) -- Line: 285 -- upvalues: MatchmakingStore (val)
    MatchmakingStore.removeMembers(a2)
end

function v1.onAdded(a1, a2) -- Line: 289 -- upvalues: MatchmakingStore (val)
    MatchmakingStore.addMembers(a2)
end

function v1.onDestroyed(a1) -- Line: 293 -- upvalues: MatchmakingStore (val)
    MatchmakingStore.resetParty()
end

function v1.onUpdate(a1, a2) -- Line: 302 -- upvalues: MatchmakingStore (val)
    MatchmakingStore.setState({state = a2.state, children = a2.children})
end

function v1.onEvent(a1, a2) -- Line: 309
    local event = a2.event
    local data = a2.data
    if not event then
        return
    end
    a1:use("on" .. ((event:gsub("%_(%a)", string.upper)):gsub("^%a", string.upper)), data)
end

function v1.onInviteAdd(a1, a2) -- Line: 327 -- upvalues: MatchmakingStore (val)
    MatchmakingStore.addInvite({id = a2.id, player = a2.creator})
end

function v1.onInviteRemove(a1, a2) -- Line: 334 -- upvalues: MatchmakingStore (val)
    MatchmakingStore.removeInvite(a2)
end

return v1