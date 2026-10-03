-- Script path: ReplicatedStorage.Shared.Modules.TimedQueue
-- Decompile time: 3.13 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local u10 = {}
u10.__index = u10
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameRules = require(ReplicatedStorage.Shared.Modules.GameRules)
local ServerTicks = require(ReplicatedStorage.Shared.Modules.ServerTicks)
local SkillsUtil = require(ReplicatedStorage.Shared.Modules.SkillsUtil)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local u46 = {}

function u10.new(a1, a2, a3, a4, a5) -- Line: 17
    -- upvalues: u10 (val), ServerTicks (val), Maid (val), Signal (val), u46 (val)
    local u8 = setmetatable({}, u10)
    u8._callback = a1 or function() -- Line: 26
        return
    end
    u8._time = a2 or 1
    u8._modifier = a4 == true
    u8._owner = a5
    u8._limit = a3 or (1 / 0)
    u8._curr = 0
    u8._lastSync = 0
    u8._timeStarted = ServerTicks.getTime()
    u8._tick = 0
    u8._maid = Maid.new()
    u8.onFire = Signal.new()
    u8.onTimeChanged = Signal.new()
    u8.onTimeStartedChanged = Signal.new()
    u8.onSync = Signal.new()
    u46[u8] = true
    u8._maid:Mark(function() -- Line: 47 -- upvalues: u8 (val), u46 (upval)
        u8._dead = true
        u46[u8] = nil
    end)
    return u8
end

function u10.HookToReplicator(a1, a2, a3) -- Line: 55
    local u8 = string.gsub(a3, " ", "_")
    a1._replicator = a2
    local _timeStarted = a1._timeStarted
    a2:Set(u8, _timeStarted)
    a2:Set(u8 .. "_time", a1._time)
    a1._maid:Mark((a1.onFire:Connect(function(a1) -- Line: 63 -- upvalues: a2 (val), u8 (ref)
        a2:Set(u8, a1)
    end)))
    a1._maid:Mark((a1.onTimeChanged:Connect(function(a1) -- Line: 67 -- upvalues: a2 (val), u8 (ref)
        a2:Set(u8 .. "_time", a1)
    end)))
    a1._maid:Mark((a1.onTimeStartedChanged:Connect(function(a1) -- Line: 71 -- upvalues: a2 (val), u8 (ref)
        a2:Set(u8, a1)
    end)))
    a1._maid:Mark(function() -- Line: 75 -- upvalues: a2 (val), u8 (ref)
        a2:Remove(u8)
        a2:Remove(u8 .. "_time")
    end)
end

function u10.SetLimit(a1, a2) -- Line: 81 -- types: a1: table, a2: number
    a1._limit = a2
end

function u10.Decrement(a1) -- Line: 85
    a1._curr = a1._curr - 1
end

function u10.AddTime(a1, a2) -- Line: 89 -- types: a1: table, a2: number
    a1._timeStarted = a1._timeStarted - a2
    a1.onTimeStartedChanged:Fire(a1._timeStarted)
end

function u10.SetCallback(a1, a2) -- Line: 94 -- types: a1: table, a2: function
    a1._callback = a2
end

function u10.SetTimeLeftTo(a1, a2) -- Line: 98 -- upvalues: ServerTicks (val) -- types: a1: table, a2: number
    a1._timeStarted = ServerTicks.getTime() - a2
    a1.onTimeStartedChanged:Fire(a1._timeStarted)
end

function u10.GetTime(a1, a2) -- Line: 103 -- upvalues: ServerTicks (val) -- types: a1: table, a2: number
    return ServerTicks.getTime() - a1._timeStarted
end

function u10.SetTime(a1, a2) -- Line: 107 -- types: a1: table, a2: number
    assert(a2 and typeof(a2) == "number", "Invalid time")
    a1._time = a2
    a1.onTimeChanged:Fire(a2)
end

function u10:Destroy() -- Line: 114
    self._maid:Sweep()
end

RunService.Heartbeat:Connect(function(a1) -- Line: 118
    -- upvalues: GameState (val), ServerTicks (val), u46 (val), GameRules (val), Enum (val), SkillsUtil (val)
    if not GameState.GameOver and GameState.GameStarted then
        local _owner, v1
        local v2 = ServerTicks.getTime()
        local v3 = a1
        for k in pairs(u46) do
            if not k._dead then
                k._tick = k._tick + v3 * GameState.TimeScale
                k._lastSync = k._lastSync + v3
                _owner = k._owner and k._owner.PlayerInstance
                v1 = 1
                if _owner and GameRules.HasSkill(Enum.SkillTreeNode.ExpandedBarracks) then
                    v1 = v1 - SkillsUtil.skillEval(_owner, Enum.SkillTreeNode.ExpandedBarracks) / 100
                end
                if k._time * v1 <= k._tick and k._curr < k._limit then
                    k._tick = 0
                    k._curr = k._curr + 1
                    k.onFire:Fire(v2)
                    k._callback()
                end
            else
                u46[k] = nil
                k:Destroy()
            end
        end
        return
    end
end)
return u10