-- Script path: ReplicatedStorage.Client.Modules.TweenService
-- Decompile time: 7.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)

local function tryRequire(a1) -- Line: 13
    local success, result = pcall(require, a1)
    if success then
        return result
    end
    return nil
end

local u36 = {
    CFrame = true,
    Vector3 = true,
    Vector2 = true,
    UDim2 = true,
    Color3 = true,
}

local function lerpValue(a1, a2, a3) -- Line: 61 -- upvalues: u36 (val) -- types: a3: number
    local v1 = typeof(a1)
    if v1 ~= "boolean" and v1 ~= "EnumItem" then
        if v1 == "number" then
            return (math.lerp(a1, a2, a3))
        end
        if u36[v1] then
            return a1:Lerp(a2, a3)
        end
        if v1 == "Rect" then
            return Rect.new(a1.Min:Lerp(a2.Min, a3), a1.Max:Lerp(a2.Max, a3))
        end
        if v1 == "UDim" then
            return UDim.new(math.lerp(a1.Scale, a2.Scale, a3), (math.lerp(a1.Offset, a2.Offset, a3)))
        end
        if v1 == "Vector2int16" then
            return Vector2int16.new(math.lerp(a1.X, a2.X, a3), (math.lerp(a1.Y, a2.Y, a3)))
        end
        error((("lerpValue: Unsupported type %*"):format(v1)))
        return
    end
    return a2
end

local u38 = {}
local u39 = {}
local u40 = {}
local u41 = {}

local function queuePartMove(a1, a2) -- Line: 97 -- upvalues: u41 (val) -- types: a1: userdata, a2: userdata
    u41[a1] = a2
end

local function flushPartMoves() -- Line: 101 -- upvalues: u41 (val), Workspace (val)
    local v1 = 0
    for i in u41 do
        v1 = v1 + 1
    end
    if v1 == 0 then
        return
    end
    local u13 = table.create(v1)
    local u16 = table.create(v1)
    local v2 = 1
    for j, k in u41 do
        u13[v2] = j
        u16[v2] = k
        v2 = v2 + 1
    end
    pcall(function() -- Line: 118 -- upvalues: Workspace (upval), u13 (val), u16 (val)
        Workspace:BulkMoveTo(u13, u16)
    end)
    for n in u41 do
        u41[n] = nil
    end
end

Scheduler.add("TweenHeartbeat", RunService.Heartbeat, function(a1) -- Line: 126 -- upvalues: u38 (val), RunService (val), flushPartMoves (val) -- types: a1: number
    for i in u38 do
        i(a1)
    end
    if RunService:IsServer() then
        flushPartMoves()
    end
end)
Scheduler.add("TweenStepped", RunService.Stepped, function(a1, a2) -- Line: 135 -- upvalues: u39 (val) -- types: a2: number
    for i in u39 do
        i(a2)
    end
end)
if RunService:IsClient() then
    Scheduler.add("TweenRenderStepped", RunService.RenderStepped, function(a1) -- Line: 142 -- upvalues: u40 (val), flushPartMoves (val) -- types: a1: number
        for i in u40 do
            i(a1)
        end
        flushPartMoves()
    end)
end

local function connectToEvent(a1, a2) -- Line: 150
    -- upvalues: Enum (val), u38 (val), u39 (val), RunService (val), u40 (val)
    if a1 == Enum.TweenPriority.Heartbeat then
        u38[a2] = true
        return function() -- Line: 155 -- upvalues: u38 (upval), a2 (val)
            u38[a2] = nil
        end
    end
    if a1 == Enum.TweenPriority.Stepped then
        u39[a2] = true
        return function() -- Line: 160 -- upvalues: u39 (upval), a2 (val)
            u39[a2] = nil
        end
    end
    if a1 ~= Enum.TweenPriority.RenderStepped then
        error((("TweenService: TweenPriority \"%*\" is not supported"):format(a1)))
        return
    end
    if RunService:IsServer() then
        error("TweenService: TweenPriority.RenderStepped is not supported on the server")
        return
    end
    u40[a2] = true
    return function() -- Line: 170 -- upvalues: u40 (upval), a2 (val)
        u40[a2] = nil
    end
end

local u68 = {}
u68.__index = u68
local u72 = setmetatable({}, {__mode = "k"})

function u68.new(a1, a2, a3) -- Line: 187
    -- upvalues: lerpValue (val), u41 (val), Enum (val), Signal (val), u68 (val)
    local u47 = {}
    local v1 = a3
    local v2 = nil
    local u50 = nil
    if type(a3) == "table" then
        local u51 = table.clone(a3)
        local u52 = {}
        local v3 = nil
        local v4 = nil
        for i, j in u51, v3, v4 do
            assert((typeof(a1[i])) == typeof(j), "Initial and final values must be of the same type")
            u47[i] = true
        end

        function v2() -- Line: 211 -- upvalues: u51 (val), u47 (val), u52 (val), a1 (val), u50 (ref)
            for i in u51 do
                u47[i] = true
                u52[i] = a1[i]
            end
            if u51.Position and not u51.CFrame and a1:IsA("BasePart") then
                u50 = a1.CFrame
            end
        end

        function v1(a1_2) -- Line: 221
            -- upvalues: u51 (val), u47 (val), lerpValue (upval), u52 (val), a1 (val), u41 (upval), u50 (ref)
            local v1, v2, v3, v4
            local v5 = nil
            local v6 = nil
            for i, j in u51, v5, v6 do
                if u47[i] then
                    v1 = lerpValue(u52[i], j, a1_2)
                    if not a1:IsA("BasePart") then
                        a1[i] = v1
                    else
                        v2 = a1
                        if i == "CFrame" then
                            u41[v2] = v1
                        elseif i ~= "Position" or not u50 then
                            a1[i] = v1
                        else
                            v3 = u50 - u50.Position
                            v4 = CFrame.new(v1) * v3
                            u41[v2] = v4
                        end
                    end
                end
            end
        end
    end
    return (setmetatable({
        _time = 0,
        Instance = a1,
        TweenInfo = a2,
        Event = Enum.TweenPriority.Stepped,
        PlaybackState = Enum.PlaybackState.Begin,
        Completed = Signal.new(),
        _onTweenPlay = v2,
        _updateCallback = v1,
        _properties = u47,
    }, u68))
end

function u68.Play(a1) -- Line: 264
    -- upvalues: u72 (val), ReplicatedStorage (val), connectToEvent (val), TweenService (val)
    if not u72[a1.Instance] then
        u72[a1.Instance] = {}
    end
    if typeof(a1._updateCallback) == "table" then
        local v1 = nil
        local v2 = nil
        for i in a1._updateCallback, v1, v2 do
            if u72[a1.Instance][i] then
                u72[a1.Instance][i]._properties[i] = nil
            end
            u72[a1.Instance][i] = a1
        end
    end
    a1:_stop()
    if a1.PlaybackState ~= Enum.PlaybackState.Paused then
        a1._time = 0
    end
    assert(a1.Event)
    a1.PlaybackState = 0 < a1.TweenInfo.DelayTime and Enum.PlaybackState.Delayed or Enum.PlaybackState.Playing
    local GameState = ReplicatedStorage.Shared.Modules.GameState
    local success, result = pcall(require, GameState)
    local u68 = if not success then nil else result
    local TimescaleUtilities = ReplicatedStorage.Shared.Modules.TimescaleUtilities
    local success_2, result_2 = pcall(require, TimescaleUtilities)
    local u79 = if not success_2 then nil else result_2

    local function delayFunc(a1, a2) -- Line: 292 -- upvalues: u79 (val) -- types: a1: number, a2: function
        if u79 and u79.Delay then
            return u79.Delay(a1, a2)
        end
        return task.delay(a1, a2)
    end

    local DelayTime = a1.TweenInfo.DelayTime

    local function v3() -- Line: 299 -- upvalues: a1 (val), connectToEvent (upval), u68 (val), TweenService (upval)
        a1.PlaybackState = Enum.PlaybackState.Playing
        if a1._onTweenPlay then
            a1._onTweenPlay()
        end
        local EasingStyle = a1.TweenInfo.EasingStyle
        local EasingDirection = a1.TweenInfo.EasingDirection
        local RepeatCount = a1.TweenInfo.RepeatCount
        local Reverses = a1.TweenInfo.Reverses
        local v1 = RepeatCount + 1
        local u24 = v1 * (if not Reverses then 1 else 2)
        local u25 = 0
        a1._updateConnection = connectToEvent(a1.Event, function(a1_2) -- Line: 314
            -- upvalues: u68 (upval), a1 (upval), u25 (ref), TweenService (upval), EasingStyle (val)
            -- upvalues: EasingDirection (val), Reverses (val), u24 (val)
            local TimeScale = u68 and u68.TimeScale or 1
            local v1 = a1
            v1._time = v1._time + a1_2 * TimeScale
            v1 = math.min(a1._time / a1.TweenInfo.Time - u25, 1)
            local Value = TweenService:GetValue(v1, EasingStyle, EasingDirection)
            if Reverses and u25 % 2 == 1 then
                Value = 1 - Value
            end
            a1._updateCallback(Value)
            if v1 >= 1 then
                u25 = u25 + 1
            end
            if u24 <= u25 then
                a1:_stop()
                a1.PlaybackState = Enum.PlaybackState.Completed
                a1.Completed:Fire()
            end
        end)
    end

    a1._delayedThread = if not u79 then task.delay(DelayTime, v3) else if not u79.Delay then task.delay(DelayTime, v3) else u79.Delay(DelayTime, v3)
end

function u68:_stop() -- Line: 338 -- upvalues: u72 (val) -- types: self: table
    if u72[self.Instance] then
        local v1
        for i in self._properties do
            v1 = u72[self.Instance]
            if v1 and v1[i] == self then
                v1[i] = nil
            end
        end
    end
    if self._updateConnection then
        self._updateConnection()
        self._updateConnection = nil
    end
    if self._delayedThread and coroutine.status(self._delayedThread) == "suspended" then
        task.cancel(self._delayedThread)
    end
    self._delayedThread = nil
end

function u68.Cancel(a1) -- Line: 360 -- types: a1: table
    if a1.PlaybackState ~= Enum.PlaybackState.Begin then
        a1:_stop()
        a1.PlaybackState = Enum.PlaybackState.Cancelled
    end
end

function u68.Pause(a1) -- Line: 367 -- types: a1: table
    if a1.PlaybackState == Enum.PlaybackState.Playing then
        a1:_stop()
        a1.PlaybackState = Enum.PlaybackState.Paused
    end
end

return {
    GetValue = function(a1, a2, a3, a4) -- Line: 375 -- upvalues: TweenService (val) -- types: a1: table, a2: number
        return TweenService:GetValue(a2, a3, a4)
    end,
    Create = function(a1, a2, a3, a4) -- Line: 383 -- upvalues: u68 (val) -- types: a1: table, a2: userdata, a3: userdata
        return u68.new(a2, a3, a4)
    end,
}