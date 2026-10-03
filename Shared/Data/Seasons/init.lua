-- Script path: ReplicatedStorage.Shared.Data.Seasons
-- Decompile time: 2.75 ms

local v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(script:WaitForChild("Types"))
local Events = require(ReplicatedStorage.Shared.Data.Events)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local Seasons = Network.Channel("Seasons")
local u30 = {}
local u32 = Signal.new()
local u33 = {}
local u34 = {}
local u35 = {}

local function isSeasonActive(a1) -- Line: 23 -- upvalues: u33 (val), Events (val)
    local ServerTimeNow, v1
    if typeof(a1) ~= "string" then
        v1 = a1
        if not v1.disabled then
            if v1.activeCondition and not v1.activeCondition() then
                return false
            end
            if v1.event and not Events.isActive(v1.event) then
                return false
            end
            ServerTimeNow = workspace:GetServerTimeNow()
            if ServerTimeNow < v1.startsAt.UnixTimestamp then
                return false
            end
            if v1.endsAt and v1.endsAt.UnixTimestamp < ServerTimeNow then
                return false
            end
            return true
        end
        return false
    end
    v1 = u33[a1]
    if not v1 or v1.disabled then
        return false
    end
    if v1.activeCondition and not v1.activeCondition() then
        return false
    end
    if v1.event and not Events.isActive(v1.event) then
        return false
    end
    ServerTimeNow = workspace:GetServerTimeNow()
    if ServerTimeNow < v1.startsAt.UnixTimestamp then
        return false
    end
    if v1.endsAt and v1.endsAt.UnixTimestamp < ServerTimeNow then
        return false
    end
    return true
end

for k, v in pairs(script:WaitForChild("Templates"):GetChildren()) do
    v1 = require(v)
    table.sort(v1.tiers, function(a1, a2) -- Line: 70
        return a1.experience < a2.experience
    end)
    u33[v1.name] = v1
end

local function evaluateActivity() -- Line: 77
    -- upvalues: u33 (val), isSeasonActive (val), u34 (val), u35 (val), u32 (val)
    local v1, v2, v3, v4, v5
    for k, v in pairs(u33) do
        v1 = isSeasonActive(v)
        v2 = v1 and u34 or u35
        v3 = v1 and u35 or u34
        v4 = v2[v.name]
        v5 = v3[v.name]
        v2[v.name] = v
        v3[v.name] = nil
        if v2[v.name] ~= v4 or v3[v.name] ~= v5 then
            u32:Fire(v.name)
        end
    end
end

Seasons:On("Experience", function(a1, a2) -- Line: 156 -- upvalues: u33 (val), isSeasonActive (val), u30 (val) -- types: a1: string, a2: number
    local v1 = u33[a1]
    if not v1 then
        warn("Received experience for unknown season: " .. a1)
        return
    end
    if not isSeasonActive(v1) then
        warn("Received experience for inactive season: " .. a1)
        return
    end
    if u30[a1] then
        u30[a1]:Fire(a2)
    end
end)
evaluateActivity()
return {
    isSeasonActive = isSeasonActive,
    isSeasonPartTwo = function(a1) -- Line: 58
        local nextPartAt = a1.nextPartAt
        if not nextPartAt then
            return false
        end
        return nextPartAt.UnixTimestamp < (workspace:GetServerTimeNow())
    end,
    getLastInactiveSeason = function() -- Line: 95 -- upvalues: u34 (val), u35 (val)
        if next(u34) then
            return nil
        end
        local v1 = nil
        for k, v in pairs(u35) do
            if v.endsAt then
                if not v1 or v1.endsAt.UnixTimestamp < v.endsAt.UnixTimestamp then
                    v1 = v
                end
            end
        end
        return v1
    end,
    getSeasonChangedSignal = function(a1) -- Line: 119 -- upvalues: u33 (val), isSeasonActive (val), u30 (val), Signal (val) -- types: a1: string
        local v1 = u33[a1]
        if not v1 then
            warn("Unknown season: " .. a1)
            return
        end
        if not isSeasonActive(v1) then
            warn("Inactive season: " .. a1)
            return
        end
        local v2 = u30[a1]
        if not v2 then
            u30[a1] = (Signal.new())
        end
        return v2
    end,
    evaluateActivity = evaluateActivity,
    getActiveSeasonById = function(a1) -- Line: 139 -- upvalues: u34 (val), isSeasonActive (val)
        if type(a1) ~= "string" then
            return
        end
        local v1 = u34[a1]
        if not v1 or not isSeasonActive(v1) then
            return
        end
        return v1
    end,
    Seasons = u33,
    ActiveSeasons = u34,
    InactiveSeasons = u35,
    UpdatedSeasons = u32,
}