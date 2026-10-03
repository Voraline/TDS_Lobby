-- Script path: ReplicatedStorage.Shared.Modules.TimerClass
-- Decompile time: 4.53 ms

local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local u15 = {}
u15.__index = u15
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local u45 = nil
if RunService:IsServer() then
    u45 = require(ServerStorage.Server.Modules.ServerTagReplicator)
end
local u46 = {}

function u15.new(a1, a2, a3, a4, a5, a6) -- Line: 69
    -- upvalues: u15 (val), Maid (val), Signal (val), RunService (val), u45 (ref), u46 (val)
    local u9 = setmetatable({}, u15)
    u9.Maid = Maid.new()
    u9.StartTime = a4 or workspace:GetServerTimeNow()
    u9.EndTime = a2
    u9.LastTick = math.floor(u9.StartTime)
    u9.TimeScaled = a6 ~= false
    u9.OnSecond = Signal.new()
    u9.OnCountdown = Signal.new()
    u9.OnFinish = Signal.new()
    u9.TimePassSignals = {}
    u9.PingRate = a3 or 1
    u9.Maid:Mark(u9.OnSecond)
    u9.Maid:Mark(u9.OnFinish)
    u9.Maid:Mark(u9.OnCountdown)
    u9._type = a1
    u9._tick = 0
    u9._pauseSources = {}
    u9._pausedAt = nil
    if not a5 and RunService:IsServer() then
        u9.Replicator = u45.new(a1, {
            Duration = a2,
            TimeScaled = u9.TimeScaled,
            StartTime = u9.StartTime,
            EndTime = u9.StartTime + a2,
        })
        u9.Replicator.ReplicationFolder.Name = "TimerReplicator"
        u9.Maid:Mark(u9.Replicator)
    end
    u46[u9] = true
    u9.Maid:Mark(function() -- Line: 110 -- upvalues: u46 (upval), u9 (val)
        u46[u9] = nil
    end)
    return u9
end

function u15:IsPaused() -- Line: 118
    return next(self._pauseSources) ~= nil
end

function u15.SetPaused(a1, a2, a3) -- Line: 122 -- types: a1: table, a2: string, a3: boolean
    if not a1.Maid then
        return
    end
    local v1 = a1:IsPaused()
    local v2 = if not a3 then nil else true
    a1._pauseSources[a2] = v2
    local v3 = a1:IsPaused()
    if v1 == v3 then
        return
    end
    local ServerTimeNow = workspace:GetServerTimeNow()
    if not v3 then
        a1.LastTick = a1.LastTick + (ServerTimeNow - a1._pausedAt)
        a1._pausedAt = nil
    else
        a1._pausedAt = ServerTimeNow
    end
    if a1.Replicator then
        a1.Replicator:Set("Paused", v3)
    end
end

function u15.AddTime(a1, a2) -- Line: 148 -- types: a1: table, a2: number
    a1.EndTime = a1.EndTime + a2
end

function u15.GetTimeLeft(a1) -- Line: 156
    return a1.EndTime - a1._tick
end

function u15.SetTimeLeftToAtLeast(a1, a2) -- Line: 164
    if a2 < a1.EndTime - a1._tick then
        a1.EndTime = a1._tick + a2
    end
end

function u15.Wait(a1) -- Line: 199 -- upvalues: Promise (val)
    return Promise.race({
        Promise.new(function(a1_2) -- Line: 201 -- upvalues: a1 (val)
            a1.OnFinish:Wait()
            a1_2()
        end),
        (Promise.new(function(a1_2, a2, a3) -- Line: 205 -- upvalues: a1 (val)
            while a1.Maid ~= nil do
                if a3() then
                    return
                end
                task.wait()
            end
            a2("Timer cancelled")
        end)),
    })
end

function u15.Cancel(a1) -- Line: 220
    a1.OnFinish:Fire()
    a1:Destroy()
end

function u15.GetTimePassedSignal(a1, a2) -- Line: 239 -- upvalues: Signal (val)
    local v1 = a1.TimePassSignals[a2]
    if v1 then
        return v1
    end
    v1 = Signal.new()
    a1.Maid:Mark(v1)
    a1.TimePassSignals[a2] = v1
    return v1
end

function u15:Destroy() -- Line: 262
    if self.Maid then
        self.Maid:Sweep()
        self.Maid = nil
    end
end

function u15.clear() -- Line: 276 -- upvalues: u46 (val)
    for i in u46 do
        i:Destroy()
    end
end

RunService.Heartbeat:Connect(function(a1) -- Line: 282 -- upvalues: u46 (val), GameState (val), ReplicatedStorage (val)
    local EndTime, TimeScale, v1, v2, v3
    local ServerTimeNow = workspace:GetServerTimeNow()
    local v4 = nil
    local v5 = nil
    for i in u46, v4, v5 do
        if not i:IsPaused() then
            TimeScale = i.TimeScaled ~= false and GameState.TimeScale or 1
            v3 = i.PingRate / TimeScale
            if TimeScale == 0 then
                i.LastTick = i.LastTick + a1
            end
            if v3 < ServerTimeNow - i.LastTick then
                EndTime = i.EndTime
                if i._tick < EndTime then
                    v1 = (ServerTimeNow - i.LastTick) * TimeScale
                    i._tick = i._tick + v1
                    v2 = not (v3 ~= 1) and math.floor(ServerTimeNow) or ServerTimeNow
                    i.LastTick = v2
                    while v3 <= v1 do
                        v1 = v1 - v3
                        i.OnSecond:Fire(i.EndTime - i._tick)
                    end
                    if (math.ceil(i.EndTime - i._tick)) <= 5 then
                        i.OnCountdown:Fire()
                    end
                end
            end
            if i._type == "ClientUITimer" then
                ReplicatedStorage.State.Timer.Time.Value = math.ceil(i.EndTime - i._tick)
            end
            for k, v in pairs(i.TimePassSignals) do
                if k <= i._tick then
                    i.TimePassSignals[k] = nil
                    v:Fire()
                end
            end
            if i.EndTime <= i._tick then
                i.OnFinish:Fire()
                i:Destroy()
            end
        end
    end
end)
return u15