-- Script path: ReplicatedStorage.Client.Modules.StateManager
-- Decompile time: 5.34 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Thread)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local u15 = {}
u15.__index = u15

function u15.new(a1) -- Line: 82 -- upvalues: u15 (val) -- types: a1: table?
    local v1 = setmetatable({}, u15)
    v1._states = {}
    v1._onLeaveArgs = {}
    v1._cancelThreadsOnStateChange = a1 and a1.cancelThreadsOnStateChange or false
    v1.queue = {}
    v1.previousState = nil
    v1.currentState = nil
    return v1
end

function u15.update(a1) -- Line: 96
    if #a1.queue == 0 then
        return
    end
    local v1 = a1.queue[1]
    table.remove(a1.queue, 1)
    a1:changeState(v1.stateName, (table.unpack(v1.args)))
    return v1
end

function u15.step(a1, a2) -- Line: 108 -- types: a1: table, a2: number
    if a1.currentState and a1.currentState.onUpdate then
        a1.currentState.onUpdate(a2)
    end
end

function u15.getState(a1) -- Line: 114
    if a1.currentState then
        return a1.currentState.name
    end
    return ""
end

function u15.enqueueState(a1, a2, ...) -- Line: 122 -- types: a1: table, a2: string
    if not a1._states[a2] then
        warn((("%* is not an existing state"):format(a2)))
        return
    end
    table.insert(a1.queue, {stateName = a2, args = {...}})
end

function u15.resetQueue(a1) -- Line: 137
    a1.queue = {}
end

function u15:addState(a2) -- Line: 141 -- types: self: table, a2: table
    self._states[a2.name] = a2
end

function u15.addStates(a1, a2) -- Line: 145 -- types: a1: table, a2: table
    for i, v in ipairs(a2) do
        a1:addState(v)
    end
end

function u15.removeState(a1, a2) -- Line: 151
    a1._states[a2] = nil
end

function u15:changeState(a2, ...) -- Line: 155 -- upvalues: TimescaleUtilities (val)
    local v1
    local u2 = {}
    u2[1] = ...
    local u5 = self._states[a2]
    assert(u5, (("%* is not an existing state"):format(a2)))
    local currentState = self.currentState
    self.previousState = self.currentState
    self.currentState = u5
    if currentState and currentState.onLeave then
        v1 = {}
        if self._onLeaveArgs[currentState.name] then
            v1 = self._onLeaveArgs[currentState.name]
            self._onLeaveArgs[currentState.name] = nil
        end
        currentState.onLeave(table.unpack(v1))
    end
    if u5.onEnter then
        if self._cancelThreadsOnStateChange then
            if self._currentThread then
                task.cancel(self._currentThread)
                self._currentThread = nil
            end
            local u45 = false
            local v2 = task.spawn(function() -- Line: 182 -- upvalues: u5 (val), u2 (val), self (val), u45 (ref)
                local v1 = u5.onEnter(table.unpack(u2))
                if v1 then
                    self._onLeaveArgs[u5.name] = v1
                end
                u45 = true
            end)
            self._currentThread = v2
            while not u45 do
                TimescaleUtilities.Wait(0.01)
                if self._currentThread ~= v2 then
                    break
                end
            end
            return
        end
        v1 = u5.onEnter(table.unpack(u2))
        if v1 then
            self._onLeaveArgs[u5.name] = v1
        end
    end
end

function u15.Destroy(a1) -- Line: 207
    a1._states = nil
    a1.currentState = nil
    a1.previousState = nil
    setmetatable(a1, nil)
end

return u15