-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Lobby.ChallengeMapStore
-- Decompile time: 2.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u18, u19 = Charm.signal({currentTimestamp = 0, completed = false})
local v1 = {getState = u18}

local function setField(a1, a2) -- Line: 23 -- upvalues: u18 (val), table (val), u19 (val) -- types: a1: string
    local v1 = u18()
    if v1[a1] == a2 then
        return
    end
    local v2 = table.clone(v1)
    v2[a1] = a2
    u19(v2)
end

function v1.setChallenge(a1) -- Line: 34 -- upvalues: u18 (val), table (val), u19 (val) -- types: a1: string?
    local v1 = u18()
    if v1.challenge == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.challenge = a1
    u19(v2)
end

function v1.setMap(a1) -- Line: 38 -- upvalues: u18 (val), table (val), u19 (val) -- types: a1: string?
    local v1 = u18()
    if v1.map == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.map = a1
    u19(v2)
end

function v1.setTimeExpires(a1) -- Line: 42 -- upvalues: u18 (val), table (val), u19 (val) -- types: a1: number?
    local v1 = u18()
    if v1.timeExpires == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.timeExpires = a1
    u19(v2)
end

function v1.setTimestamp(a1) -- Line: 46 -- upvalues: u18 (val), table (val), u19 (val) -- types: a1: number
    local v1 = u18()
    if v1.currentTimestamp == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.currentTimestamp = a1
    u19(v2)
end

function v1.setCompleted(a1) -- Line: 50 -- upvalues: u18 (val), table (val), u19 (val) -- types: a1: boolean
    local v1 = u18()
    if v1.completed == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.completed = a1
    u19(v2)
end

function v1.setRewards(a1) -- Line: 54 -- upvalues: u18 (val), table (val), u19 (val)
    local v1 = u18()
    if v1.rewards == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.rewards = a1
    u19(v2)
end

return v1