-- Script path: ReplicatedStorage.Client.Controllers.Lobby.DisconnectionPenaltyController
-- Decompile time: 6.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Cache = require(ReplicatedStorage.Client.Modules.Cache)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local u17 = {Restricted = "NOT_RESTRICTED"}
local u18 = {
    DisconnectionStart = 0,
    GamesQuit = 0,
    GamesPlayed = 0,
    PenalizedDuration = 0,
    PenalizedStart = 0,
}
local u19 = {"DisconnectionStart", "PenalizedStart", "PenalizedDuration", "GamesQuit", "GamesPlayed"}

local function _checkRestrictions(a1) -- Line: 27
    if not a1 then
        return "NOT_RESTRICTED"
    end
    if 0 < a1.DisconnectionStart then
        return "MATCH_ACTIVE"
    end
    local PenalizedDuration = a1.PenalizedDuration
    local PenalizedStart = a1.PenalizedStart
    if not (PenalizedDuration <= 0) and not (PenalizedStart <= 0) then
        if os.time() < PenalizedStart + PenalizedDuration then
            return "PENALIZED"
        end
        return "NOT_RESTRICTED"
    end
    return "NOT_RESTRICTED"
end

local function _updateDisconnectionPenalty(a1) -- Line: 54 -- upvalues: u17 (val), ViewController (val)
    local v1
    local DisconnectionStart = a1.DisconnectionStart
    local GamesQuit = a1.GamesQuit
    local GamesPlayed = a1.GamesPlayed
    local PenalizedDuration = a1.PenalizedDuration
    if not a1 then
        v1 = "NOT_RESTRICTED"
    elseif not (0 < a1.DisconnectionStart) then
        local PenalizedDuration_2 = a1.PenalizedDuration
        local PenalizedStart = a1.PenalizedStart
        v1 = if PenalizedDuration_2 <= 0 then "NOT_RESTRICTED" else if not (PenalizedStart <= 0) then if not (os.time() < PenalizedStart + PenalizedDuration_2) then "NOT_RESTRICTED" else "PENALIZED" else "NOT_RESTRICTED"
    else
        v1 = "MATCH_ACTIVE"
    end
    u17.Restricted = v1
    if ViewController:getCurrentView() == "RejoinMatchPopup" and v1 == "PENALIZED" then
        ViewController:setView("RestrictedPopup")
        return
    end
end

local function recomputePenaltyState() -- Line: 70 -- upvalues: u18 (val), u17 (val), ViewController (val)
    if u18.DisconnectionStart and u18.PenalizedDuration then
        local v1
        local v2 = u18
        local DisconnectionStart = v2.DisconnectionStart
        local GamesQuit = v2.GamesQuit
        local GamesPlayed = v2.GamesPlayed
        local PenalizedDuration = v2.PenalizedDuration
        if not v2 then
            v1 = "NOT_RESTRICTED"
        elseif not (0 < v2.DisconnectionStart) then
            local PenalizedDuration_2 = v2.PenalizedDuration
            local PenalizedStart = v2.PenalizedStart
            v1 = if PenalizedDuration_2 <= 0 then "NOT_RESTRICTED" else if not (PenalizedStart <= 0) then if not (os.time() < PenalizedStart + PenalizedDuration_2) then "NOT_RESTRICTED" else "PENALIZED" else "NOT_RESTRICTED"
        else
            v1 = "MATCH_ACTIVE"
        end
        u17.Restricted = v1
        if ViewController:getCurrentView() == "RejoinMatchPopup" and v1 == "PENALIZED" then
            ViewController:setView("RestrictedPopup")
            return
        end
    end
end

function u17.IsRestrictedFromMatchmaking() -- Line: 76 -- upvalues: u17 (val)
    return u17.Restricted
end

function u17.init() -- Line: 80 -- upvalues: Cache (val), ViewController (val), u19 (val), u18 (val), u17 (val)
    local v1, v2
    if workspace.Type.Value ~= "Lobby" then
        return
    end
    ;(Cache("DisconnectionPenalty.DisconnectionStart"):Get()):andThen(function(a1) -- Line: 87 -- upvalues: ViewController (upval)
        if a1 > 0 then
            ViewController:queueView("RejoinMatchPopup")
        end
    end)
    for i, j in u19 do
        v1 = Cache("DisconnectionPenalty." .. j)

        function v2(a1) -- Line: 95 -- upvalues: u18 (upval), j (val), u17 (upval), ViewController (upval)
            u18[j] = a1
            if u18.DisconnectionStart and u18.PenalizedDuration then
                local v1
                local v2 = u18
                local DisconnectionStart = v2.DisconnectionStart
                local GamesQuit = v2.GamesQuit
                local GamesPlayed = v2.GamesPlayed
                local PenalizedDuration = v2.PenalizedDuration
                if not v2 then
                    v1 = "NOT_RESTRICTED"
                elseif not (0 < v2.DisconnectionStart) then
                    local PenalizedDuration_2 = v2.PenalizedDuration
                    local PenalizedStart = v2.PenalizedStart
                    v1 = if PenalizedDuration_2 <= 0 then "NOT_RESTRICTED" else if not (PenalizedStart <= 0) then if not (os.time() < PenalizedStart + PenalizedDuration_2) then "NOT_RESTRICTED" else "PENALIZED" else "NOT_RESTRICTED"
                else
                    v1 = "MATCH_ACTIVE"
                end
                u17.Restricted = v1
                if ViewController:getCurrentView() == "RejoinMatchPopup" and v1 == "PENALIZED" then
                    ViewController:setView("RestrictedPopup")
                    return
                end
            end
        end

        v1:Get():andThen(v2)
        v1.Updated:Connect(v2)
    end
end

task.spawn(u17.init)
return u17