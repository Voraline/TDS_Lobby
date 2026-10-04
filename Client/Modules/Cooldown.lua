-- Script path: ReplicatedStorage.Client.Modules.Cooldown
-- Decompile time: 3.81 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Sift = require(ReplicatedStorage.Packages.Sift)
local u19 = {}
local u20 = 0
local Heartbeat = RunService.Heartbeat
local u22 = nil
local u23 = {}
u23.__index = u23
u23.ActiveCooldowns = u19
u23.Count = u20

local function startStepping() -- Line: 28 -- upvalues: u22 (ref), Heartbeat (val), GameState (val), u19 (val)
    u22 = Heartbeat:Connect(function(a1) -- Line: 29 -- upvalues: GameState (upval), u19 (upval)
        local v1
        local v2 = a1 * GameState.TimeScale
        for k, v in pairs(u19) do
            v1 = if not k.TimeScaled then a1 else v2
            k:step(v1)
        end
    end)
end

local function stopStepping() -- Line: 37 -- upvalues: u22 (ref)
    u22:Disconnect()
    u22 = nil
end

function u23.new(a1, a2) -- Line: 42 -- upvalues: u23 (val) -- types: a1: number?, a2: function?
    local v1 = setmetatable({}, u23)
    v1.TimeScaled = true
    v1.time = a1 or 0
    v1._timeToAdd = 0
    v1._forcedTime = nil
    v1._active = false
    v1._onFinish = a2
    if a1 then
        v1:_activate()
    end
    return v1
end

function u23:_activate() -- Line: 59
    -- upvalues: u19 (val), u20 (ref), Sift (val), u23 (val), u22 (ref), Heartbeat (val), GameState (val)
    u19[self] = true
    u20 = Sift.Dictionary.count(u19)
    u23.Count = u20
    self._active = true
    if u20 > 0 and u22 == nil then
        u22 = Heartbeat:Connect(function(a1) -- Line: 29 -- upvalues: GameState (upval), u19 (upval)
            local v1
            local v2 = a1 * GameState.TimeScale
            for k, v in pairs(u19) do
                v1 = if not k.TimeScaled then a1 else v2
                k:step(v1)
            end
        end)
    end
end

function u23:deactivate() -- Line: 70 -- upvalues: u19 (val), u20 (ref), Sift (val), u23 (val), u22 (ref)
    u19[self] = nil
    u20 = Sift.Dictionary.count(u19)
    u23.Count = u20
    self._active = false
    if u20 <= 0 and u22 then
        u22:Disconnect()
        u22 = nil
    end
end

function u23.setTime(a1, a2) -- Line: 81 -- types: a1: table, a2: number
    a1._forcedTime = a2
    if not a1._active then
        a1:_activate()
    end
end

function u23.addTime(a1, a2) -- Line: 88 -- types: a1: table, a2: number
    a1._timeToAdd = a1._timeToAdd + a2
    if not a1._active then
        a1:_activate()
    end
end

function u23.getTimeLeft(a1) -- Line: 96
    return a1.time
end

function u23.isActive(a1) -- Line: 100
    return a1._active
end

function u23:step(a2) -- Line: 104 -- types: self: table, a2: number
    if 0 < self._timeToAdd then
        self.time = self.time + self._timeToAdd
        self._timeToAdd = 0
    end
    if self._forcedTime then
        self.time = self._forcedTime
        self._forcedTime = nil
    end
    self.time = self.time - a2
    if self.time <= 0 then
        if self._onFinish then
            self._onFinish()
        end
        self:deactivate()
    end
end

function u23.Destroy(a1) -- Line: 124
    a1:deactivate()
end

return u23