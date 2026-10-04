-- Script path: ReplicatedStorage.Client.Modules.PointerArrow
-- Decompile time: 4.00 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local u15 = {}
u15.__index = u15
local PointerArrow = ReplicatedStorage.Assets.Models.PointerArrow
local u19 = {}
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local spr = require(ReplicatedStorage.Shared.Modules.spr)

function u15.new(a1, a2) -- Line: 16
    -- upvalues: u15 (val), Maid (val), PointerArrow (val), Signal (val), u19 (ref), spr (val)
    local u5 = setmetatable({}, u15)
    u5._maid = Maid.new()
    local u12 = PointerArrow:Clone()
    u5._arrow = u12
    u5._scale = 0
    u5._distance = a2 or 20
    u5._arrowSize = u5._arrow.Size
    u5._targetPosition = a1 or Vector3.new(0, 0, 0)
    u5._enabled = false
    u5.Reached = Signal.new()
    u19[u5] = true
    u5._maid:Mark(function() -- Line: 33 -- upvalues: u5 (val), u12 (val), u19 (upval)
        u5:SetEnabled(false)
        task.delay(1, function() -- Line: 35 -- upvalues: u12 (upval), u19 (upval), u5 (upval)
            u12:Destroy()
            u19[u5] = nil
        end)
    end)
    u12.Parent = workspace
    spr.target(u5, 1, 1, {_scale = 1})
    return u5
end

function u15:SetEnabled(a2) -- Line: 47 -- upvalues: spr (val) -- types: self: table, a2: boolean
    if self._enabled == a2 then
        return
    end
    if not a2 then
        self.Reached:Fire()
    end
    self._arrow.Sparkles.Enabled = a2
    self._enabled = a2
    spr.target(self._arrow, 1, 5, {Transparency = if not a2 then 1 else 0})
end

function u15:Step(a2, a3) -- Line: 61 -- types: self: table, a2: number, a3: vector
    self._arrow.Size = self._arrowSize * self._scale
    self._arrow.CFrame = (CFrame.new(a3, self._targetPosition)) * CFrame.new(0, 0, -self._scale * 4)
    self:SetEnabled(self._distance < (self._targetPosition - a3).Magnitude)
end

function u15.clear() -- Line: 71 -- upvalues: u19 (ref)
    for k in pairs(u19) do
        k:Destroy()
    end
    u19 = {}
end

function u15:Destroy() -- Line: 79
    if self._maid then
        self._maid:Sweep()
        self._maid = nil
    end
end

Scheduler.add("PointArrowStep", RunService.Heartbeat, function(a1) -- Line: 86 -- upvalues: Players (val), u19 (ref)
    local Character = Players.LocalPlayer.Character and Players.LocalPlayer.Character.PrimaryPart and Players.LocalPlayer.Character.PrimaryPart.Position
    if not Character then
        return
    end
    for k in pairs(u19) do
        k:Step(a1, Character)
    end
end)
return u15