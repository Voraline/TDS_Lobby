-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Shared.PlayerStatsStore
-- Decompile time: 1.68 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Charm = require(ReplicatedStorage.Packages.Charm)

local function shouldPopulate(a1, a2) -- Line: 20 -- upvalues: RunService (val) -- types: a1: number, a2: number
    if RunService:IsRunning() then
        return a2
    end
    return a1
end

local v1 = {
    experience = 0,
    tutorial = 1,
    coins = if not RunService:IsRunning() then 9000000000 else 0,
    gems = if not RunService:IsRunning() then 0 else 0,
    level = if not RunService:IsRunning() then 0 else 0,
}
local v2 = math.random(20, 1000)
v1.loses = if not RunService:IsRunning() then v2 else 0
v1.revivetickets = if not RunService:IsRunning() then 100 else 0
v1.spintickets = if not RunService:IsRunning() then 100 else 0
v1.timescaletickets = if not RunService:IsRunning() then 100 else 0
v2 = math.random(20, 1000)
v1.triumphs = if not RunService:IsRunning() then v2 else 0
v2 = math.random(20, 1000)
v1.wins = if not RunService:IsRunning() then v2 else 0
local u99 = {
    Coins = "coins",
    Experience = "experience",
    Gems = "gems",
    Level = "level",
    Loses = "loses",
    ReviveTickets = "revivetickets",
    SpinTickets = "spintickets",
    TimescaleTickets = "timescaletickets",
    Triumphs = "triumphs",
    Tutorial = "tutorial",
    Wins = "wins",
}
local u111, u112 = Charm.signal(v1)

local function setKey(a1, a2) -- Line: 54 -- upvalues: u111 (val), u112 (val) -- types: a1: string, a2: number
    local v1 = u111()
    if v1[a1] == a2 then
        return
    end
    local v2 = table.clone(v1)
    v2[a1] = a2
    u112(v2)
end

return {
    getState = u111,
    getCoins = function() -- Line: 69 -- upvalues: u111 (val)
        return u111().coins
    end,
    getExperience = function() -- Line: 73 -- upvalues: u111 (val)
        return u111().experience
    end,
    getGems = function() -- Line: 77 -- upvalues: u111 (val)
        return u111().gems
    end,
    getLevel = function() -- Line: 81 -- upvalues: u111 (val)
        return u111().level
    end,
    getReviveTickets = function() -- Line: 85 -- upvalues: u111 (val)
        return u111().revivetickets
    end,
    getSpinTickets = function() -- Line: 89 -- upvalues: u111 (val)
        return u111().spintickets
    end,
    getTimescaleTickets = function() -- Line: 93 -- upvalues: u111 (val)
        return u111().timescaletickets
    end,
    getShowGems = function() -- Line: 97 -- upvalues: u111 (val)
        local v1 = u111()
        local v2 = true
        if not (50 <= (v1.level or 0)) then
            v2 = 0 < (v1.gems or 0)
        end
        return v2
    end,
    setTutorial = function(a1) -- Line: 102 -- upvalues: u111 (val), u112 (val) -- types: a1: number
        local v1 = u111()
        if v1.tutorial == a1 then
            return
        end
        local v2 = table.clone(v1)
        v2.tutorial = a1
        u112(v2)
    end,
    setValue = function(a1, a2) -- Line: 106 -- upvalues: u99 (val), u111 (val), u112 (val) -- types: a1: string, a2: number
        local v1 = u99[a1]
        if not v1 then
            return
        end
        local v2 = u111()
        if v2[v1] == a2 then
            return
        end
        local v3 = table.clone(v2)
        v3[v1] = a2
        u112(v3)
    end,
}