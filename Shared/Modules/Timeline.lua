-- Script path: ReplicatedStorage.Shared.Modules.Timeline
-- Decompile time: 1.93 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u5 = {}
u5.__index = u5
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Promise = require(script.Parent.Promise)
require(ReplicatedStorage.Shared.Types.PromiseTypes)

function u5.new(a1, a2) -- Line: 28 -- upvalues: u5 (val) -- types: a1: table?, a2: boolean?
    local v1 = setmetatable({}, u5)
    v1._events = a1 or {}
    v1._currentEvent = 0
    v1._currentEventTime = 0
    v1._waitForFunctionFinish = a2 or true
    v1._waitingForFunction = false
    return v1
end

function u5.AddEvent(a1, a2, a3) -- Line: 45 -- types: a2: number, a3: function
    table.insert(a1._events, {time = a2, event = a3})
end

function u5:Update(a2) -- Line: 54 -- upvalues: GameState (val) -- types: a2: number
    local _currentEventTime
    self._currentEventTime = self._currentEventTime + a2 * GameState.TimeScale
    while self._currentEvent < #self._events do
        _currentEventTime = self._currentEventTime
        if not (self._events[self._currentEvent + 1].time <= _currentEventTime) then
            break
        end
        self._currentEvent = self._currentEvent + 1
        self._waitingForFunction = true
        self._events[self._currentEvent].event()
        self._waitingForFunction = false
    end
    local _currentEvent = self._currentEvent
    return #self._events <= _currentEvent
end

function u5:Reset() -- Line: 73
    self._currentEvent = 0
    self._currentEventTime = 0
end

function u5:Stop() -- Line: 81
    if self._runningPromise then
        self._runningPromise:cancel()
        self._runningPromise = nil
    end
end

function u5.Play(a1) -- Line: 92 -- upvalues: Promise (val), GameState (val)
    a1:Stop()
    a1:Reset()
    local v1 = Promise.new(function(a1_2, a2, a3) -- Line: 96 -- upvalues: a1 (val), GameState (upval)
        local u3 = nil

        local function finish() -- Line: 99 -- upvalues: u3 (ref), a1_2 (val)
            if u3 then
                u3:Disconnect()
            end
            a1_2()
        end

        a3(function() -- Line: 106 -- upvalues: u3 (ref), a1_2 (val)
            if u3 then
                u3:Disconnect()
            end
            a1_2()
        end)
        local v1 = (game:GetService("RunService")).Heartbeat:Connect(function(a1_3) -- Line: 110 -- upvalues: a1 (upval), GameState (upval), u3 (ref), a1_2 (val) -- types: a1_3: number
            if a1._waitForFunctionFinish and a1._waitingForFunction then
                return
            end
            local v1 = a1_3 * (GameState.TimeScale or 1)
            if a1:Update(v1) then
                if u3 then
                    u3:Disconnect()
                end
                a1_2()
            end
        end)
    end)
    a1._runningPromise = v1
    return v1
end

return u5