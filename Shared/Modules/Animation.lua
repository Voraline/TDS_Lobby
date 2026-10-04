-- Script path: ReplicatedStorage.Shared.Modules.Animation
-- Decompile time: 4.98 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local LocalPlayer = RunService:IsClient()
if LocalPlayer then
    LocalPlayer = Players.LocalPlayer
end
local u30 = {}
u30.__index = u30
local u31 = {}

function u30.new(a1) -- Line: 29
    -- upvalues: Create (val), LocalPlayer (val), u30 (val), GameState (val), u31 (val)
    local Track
    if not a1.Id then
        Track = a1.Track
    else
        Track = Create("Animation", {AnimationId = string.format("rbxassetid://%d", a1.Id)})
        if not Track then
            Track = a1.Track
        end
    end
    local ShouldStopAtEnd = if not a1.Track then a1.ShouldStopAtEnd or false else if a1.Track.Name ~= "Death" then a1.ShouldStopAtEnd or false else true
    local v1 = {Track = Track, Speed = a1.Speed or 1}
    local Properties = a1.Properties or {}
    v1.Properties = Properties
    local Target = a1.Target or LocalPlayer
    v1.Target = Target
    v1.IsPersistent = a1.IsPersistent or false
    v1.IgnorePriority = a1.IgnorePriority or false
    v1.ShouldStopAtEnd = ShouldStopAtEnd
    v1.Entity = a1.Entity
    local u47 = setmetatable(v1, u30)
    if a1.Preload then
        local success, result = pcall(function() -- Line: 55 -- upvalues: u47 (val), Track (val)
            return u47.Target:LoadAnimation(Track)
        end)
        if success and result then
            u47.Controller = result
            u47.Controller:SetAttribute("Speed", u47.Speed)
            if a1.Callback then
                u47.Controller.Ended:Connect(a1.Callback)
            end
            ;(u47.Controller:GetPropertyChangedSignal("IsPlaying")):Connect(function() -- Line: 66 -- upvalues: u47 (val), GameState (upval), u31 (upval)
                if not u47.Controller.IsPlaying then
                    u31[u47.Controller] = nil
                    return
                end
                u47.Controller:AdjustSpeed((u47:IsTimeScaled() and GameState.TimeScale or 1) * u47.Speed)
                u31[u47.Controller] = u47
            end)
        end
    end
    return u47
end

function u30:IsTimeScaled() -- Line: 82
    return self.Entity and self.Entity.TimeScaled ~= false
end

function u30:Load() -- Line: 86 -- upvalues: GameState (val), u31 (val)
    if not self.Controller then
        self.Controller = self.Target:LoadAnimation(self.Track)
        self.Controller:SetAttribute("Speed", self.Speed)
        local Attribute = self.Track:GetAttribute("TimePosition")
        if Attribute then
            self.Controller.TimePosition = Attribute
        end
        self.Length = self.Controller.Length
        ;(self.Controller:GetPropertyChangedSignal("IsPlaying")):Connect(function() -- Line: 97 -- upvalues: self (val), GameState (upval), u31 (upval)
            if self.Controller.IsPlaying then
                self.Controller:AdjustSpeed((self:IsTimeScaled() and GameState.TimeScale or 1) * self.Speed)
                u31[self.Controller] = self
                return
            end
            u31[self.Controller] = nil
            if self._destroyConn then
                self._destroyConn:Disconnect()
                self._destroyConn = nil
            end
        end)
    end
end

local u38 = {}

function u30:Play(...) -- Line: 117 -- upvalues: u38 (val), u31 (val), GameState (val)
    self:Load()
    if not self.Controller then
        return
    end
    if not self.IgnorePriority and u38[self.Target] then
        u38[self.Target]:Stop()
        u38[self.Target] = nil
    end
    if not self.IgnorePriority and not self._stoppedHooked then
        self._stoppedHooked = true
        self.Controller.Stopped:Connect(function() -- Line: 130 -- upvalues: u38 (upval), self (val)
            u38[self.Target] = nil
        end)
    end
    if not self._destroyConn then
        self._destroyConn = self.Target.Destroying:Connect(function() -- Line: 136 -- upvalues: u31 (upval), self (val), u38 (upval)
            u31[self.Controller] = nil
            if u38[self.Target] == self.Controller then
                u38[self.Target] = nil
            end
        end)
    end
    local v1 = {...}
    if type(v1[1]) == "function" then
        v1[1](self.Controller)
        table.remove(v1, 1)
    end
    if type(v1[1]) == "number" then
        local v2 = v1[1]
        v1[1] = v2 * (self:IsTimeScaled() and GameState.TimeScale or 1)
    end
    self.Controller:Play((unpack(v1)))
    if self.ShouldStopAtEnd then
        self.Controller.Stopped:Connect(function() -- Line: 158 -- upvalues: self (val), GameState (upval)
            self.Controller:Play(0)
            self.Controller:AdjustSpeed((self:IsTimeScaled() and GameState.TimeScale or 1) * self.Speed)
            self.Controller.TimePosition = self.Controller.Length
        end)
    end
    if not self.IgnorePriority then
        if self.IsPersistent ~= false then
            self.Controller.Priority = Enum.AnimationPriority.Core
        else
            u38[self.Target] = self.Controller
            self.Controller.Priority = Enum.AnimationPriority.Action
        end
    end
    return coroutine.resume(coroutine.create(function() -- Line: 176 -- upvalues: self (val)
        for k, v in pairs(self.Properties) do
            self.Controller[k] = v
        end
        return
    end)) and self.Controller
end

function u30:Stop(a2) -- Line: 184 -- upvalues: GameState (val) -- types: self: table, a2: number
    if self.Controller then
        self.Controller:Stop(a2 and a2 * GameState.TimeScale)
    end
    return self
end

function u30.Pause(a1) -- Line: 192
    a1:AdjustSpeed(0)
    return a1
end

function u30.ScaleAnimationToTime(a1, a2) -- Line: 198 -- types: a1: table, a2: number
    if a2 < 0 then
        warn("Time must be positive")
    elseif a1.Controller.Length == 0 then
        warn("AnimationTrack length is 0, cannot scale speed")
    end
    a1:AdjustSpeed(if a2 ~= 0 then a1.Controller.Length / a2 else 0)
end

function u30:AdjustSpeed(a2) -- Line: 210 -- upvalues: GameState (val) -- types: self: table, a2: number
    self.Speed = a2
    if self.Controller then
        self.Controller:AdjustSpeed((self:IsTimeScaled() and GameState.TimeScale or 1) * a2)
        self.Controller:SetAttribute("Speed", a2)
        self.Length = self.Controller.Length
    end
    return self
end

function u30:AdjustWeight(a2) -- Line: 222 -- types: self: table, a2: number
    if self.Controller then
        self.Controller:AdjustWeight(a2)
    end
end

if RunService:IsClient() then
    (GameState:GetState()):andThen(function() -- Line: 229 -- upvalues: GameState (val), u31 (val)
        (GameState.Replicator:GetStateChangedSignal("TimeScale")):Connect(function(a1) -- Line: 230 -- upvalues: u31 (upval) -- types: a1: number
            local v1, v2
            local v3 = nil
            local v4 = nil
            for i, j in u31, v3, v4 do
                v1 = j:IsTimeScaled() and a1 or 1
                v2 = (i:GetAttribute("Speed")) * v1
                i:AdjustSpeed(v2)
            end
        end)
    end)
    return u30
end
;(GameState.Replicator:GetStateChangedSignal("TimeScale")):Connect(function(a1) -- Line: 239 -- upvalues: u31 (val) -- types: a1: number
    local v1, v2
    local v3 = nil
    local v4 = nil
    for i, j in u31, v3, v4 do
        v1 = j:IsTimeScaled() and a1 or 1
        v2 = (i:GetAttribute("Speed")) * v1
        i:AdjustSpeed(v2)
    end
end)
return u30