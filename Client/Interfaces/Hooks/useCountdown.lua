-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useCountdown
-- Decompile time: 3.74 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local useBinding = React.useBinding
local useEffect = React.useEffect
local u27 = {}
local u28 = nil

local function getTime() -- Line: 24 -- upvalues: RunService (val)
    return RunService:IsRunning() and workspace:GetServerTimeNow() or tick()
end

local function removeTimer(a1) -- Line: 28 -- upvalues: u27 (val), u28 (ref) -- types: a1: string
    u27[a1] = nil
    if not next(u27) then
        u28 = nil
    end
end

local function stepTimers() -- Line: 36 -- upvalues: RunService (val), u27 (val), u28 (ref)
    local v1
    local ServerTimeNow = RunService:IsRunning() and workspace:GetServerTimeNow() or tick()
    for i, j in u27 do
        v1 = math.max(0, (math.ceil(j.endTime - ServerTimeNow)))
        j.setState(v1)
        if v1 == 0 then
            u27[i] = nil
            if not next(u27) then
                u28 = nil
            end
        end
    end
end

local function timerAdded() -- Line: 49 -- upvalues: u28 (ref), HttpService (val), stepTimers (val)
    if u28 then
        return
    end
    local u5 = HttpService:GenerateGUID(false)
    u28 = u5
    task.spawn(function() -- Line: 57 -- upvalues: u28 (upval), u5 (val), stepTimers (upval)
        while u28 == u5 do
            stepTimers()
            task.wait(0.5)
        end
    end)
end

return function(a1) -- Line: 65
    -- upvalues: useBinding (val), useEffect (val), RunService (val), HttpService (val), u27 (val), u28 (ref)
    -- upvalues: stepTimers (val)
    local v1, u4 = useBinding(0)
    local v2 = {a1}
    useEffect(function() -- Line: 68
        -- upvalues: a1 (val), RunService (upval), u4 (val), HttpService (upval), u27 (upval), u28 (upval)
        -- upvalues: stepTimers (upval)
        local v1
        local v2 = a1 ~= nil
        if v2 then
            local ServerTimeNow = RunService:IsRunning() and workspace:GetServerTimeNow() or tick()
            v2 = a1 <= ServerTimeNow
        end
        if v1 and not v2 then
            local u27_2 = HttpService:GenerateGUID(false)
            u27[u27_2] = {setState = u4, endTime = a1}
            if not u28 then
                local u37 = HttpService:GenerateGUID(false)
                u28 = u37
                task.spawn(function() -- Line: 57 -- upvalues: u28 (upval), u37 (val), stepTimers (upval)
                    while u28 == u37 do
                        stepTimers()
                        task.wait(0.5)
                    end
                end)
            end
            return function() -- Line: 86 -- upvalues: u27_2 (val), u27 (upval), u28 (upval)
                u27[u27_2] = nil
                if not next(u27) then
                    u28 = nil
                end
            end
        end
        u4(0)
    end, v2)
    return v1
end