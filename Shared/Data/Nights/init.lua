-- Script path: ReplicatedStorage.Shared.Data.Nights
-- Decompile time: 1.34 ms

local v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
require(script:WaitForChild("Types"))
local Events = require(ReplicatedStorage.Shared.Data.Events)
local v2 = require(ReplicatedStorage.Shared.Modules.Signal).new()
local u29 = {}
local u30 = {}

local function isNightsActive(a1) -- Line: 17 -- upvalues: RunService (val), Events (val)
    if RunService:IsStudio() then
        return true
    end
    if a1.disabled then
        return false
    end
    if a1.event and not Events.isActive(a1.event) then
        return false
    end
    local ServerTimeNow = workspace:GetServerTimeNow()
    if a1.startsAt ~= nil and ServerTimeNow < a1.startsAt.UnixTimestamp then
        return false
    end
    if a1.endsAt ~= nil and a1.endsAt.UnixTimestamp < ServerTimeNow then
        warn("return false here")
        return false
    end
    return true
end

local function evaluateActivity() -- Line: 76 -- upvalues: u29 (val), isNightsActive (val), u30 (val)
    local v1
    for k, v in pairs(u29) do
        v1 = if not (isNightsActive(v)) then nil else v
        u30[v.name] = v1
    end
end

for k, v in pairs(script:WaitForChild("Templates"):GetChildren()) do
    v1 = require(v)
    u29[v1.name] = v1
end
evaluateActivity()
return {
    getActiveNights = function() -- Line: 84 -- upvalues: evaluateActivity (val), u30 (val)
        evaluateActivity()
        return u30
    end,
    isNightsActive = isNightsActive,
    isNightIndexActive = function(a1, a2) -- Line: 50 -- upvalues: RunService (val), isNightsActive (val) -- types: a2: number
        if RunService:IsStudio() then
            return true
        end
        if not isNightsActive(a1) then
            return false
        end
        local v1 = a1.nights[a2]
        if a1 and a1.startsAt then
            local ServerTimeNow = workspace:GetServerTimeNow()
            if ServerTimeNow < v1.startsAt.UnixTimestamp then
                return false
            end
            if v1.endsAt and v1.endsAt.UnixTimestamp < ServerTimeNow then
                return false
            end
            return true
        end
        return false
    end,
    evaluateActivity = evaluateActivity,
    Nights = u29,
    ActiveNights = u30,
    Updated = v2,
}