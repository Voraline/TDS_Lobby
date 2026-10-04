-- Script path: ReplicatedStorage.Content.Unit.KingpinBouncer.Animator
-- Decompile time: 2.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local ServerTicks = require(ReplicatedStorage.Shared.Modules.ServerTicks)
local u22 = TweenInfo.new(0.15)
local v1 = {}
v1.__index = v1

local function playUnitSound(a1, a2) -- Line: 13 -- upvalues: EasySound (val) -- types: a1: userdata, a2: number
    EasySound.Play({
        destroyOnEnd = true,
        audioGroup = "Towers",
        timeScaled = true,
        id = a2,
        parent = a1.PrimaryPart,
        position = a1:GetPivot().Position,
    })
end

function v1.Initialize(a1) -- Line: 24
    a1._animations = {}
    a1._attack = 0
    a1._lastAttacked = nil
    a1._lastSwingTrack = nil
    a1:_setupAnimations()
    a1:_playTrack("Walk", Enum.AnimationPriority.Core)
    task.spawn(function() -- Line: 33 -- upvalues: a1 (val)
        a1:_setStandby((a1.Replicator:WaitForState("Standby")))
    end)
    ;(a1.Replicator:GetStateChangedSignal("Standby")):Connect(function(a1_2) -- Line: 38 -- upvalues: a1 (val) -- types: a1_2: boolean
        a1:_setStandby(a1_2)
    end)
    a1:Thread(function() -- Line: 42 -- upvalues: a1 (val)
        if not a1:IsAlive() then
            return
        end
        local v1 = a1:FindTarget()
        if v1 and a1:_canFire() then
            a1:_fireAt(v1)
        end
    end)
    a1.Executables = {
        Death = function() -- Line: 55 -- upvalues: a1 (val)
            a1:_setStandby(false)
            a1:_playTrack("Death", Enum.AnimationPriority.Action2)
        end,
    }
end

function v1:_canFire() -- Line: 62
    return self:IsAlive() and self.Replicator:Get("Standby") == true
end

function v1:_setupAnimations() -- Line: 66 -- upvalues: Animation (val)
    local Animations = self.Model:WaitForChild("Animations")
    local AnimationController = self.Model:WaitForChild("AnimationController")
    for i, j in Animations:GetChildren() do
        if j:IsA("Animation") then
            self._animations[j.Name] = (Animation.new({
                IsPersistent = true,
                Track = j,
                Target = AnimationController,
                Entity = {TimeScaled = true},
            }))
        end
    end
end

function v1:_playTrack(a2, a3) -- Line: 84 -- types: self: table, a2: string
    local v1 = self._animations[a2]
    if not v1 then
        return nil
    end
    local v2 = v1:Play()
    if a3 then
        v2.Priority = a3
    end
    return v2
end

function v1:_stopTrack(a2) -- Line: 98 -- types: self: table, a2: string
    local v1 = self._animations[a2]
    if v1 then
        v1:Stop()
    end
end

function v1:_setStandby(a2) -- Line: 105 -- types: self: table, a2: boolean
    if a2 then
        self:_playTrack("Idle", Enum.AnimationPriority.Idle)
        return
    end
    self:_stopTrack("Idle")
    self._attack = 0
end

function v1:_fireAt(a2) -- Line: 115
    -- upvalues: u22 (val), ServerTicks (val), EasySound (val)
    local v1
    if not self:IsAlive() then
        return
    end
    self:Face((a2:GetPivot()).Position, u22)
    local Cooldown = self.Replicator:Get("Cooldown") or self.Stats.Cooldown
    local v2 = ServerTicks.getTime()
    local v3 = ("Attack%*"):format(if not self._lastAttacked then 1 else if not (v2 - self._lastAttacked < Cooldown + 0.1) then 1 else self._attack % 2 + 1)
    if self._lastSwingTrack then
        self._lastSwingTrack:Stop()
    end
    self._lastSwingTrack = self:_playTrack(v3, Enum.AnimationPriority.Action)
    local Model = self.Model
    EasySound.Play({
        id = 82126891885889,
        destroyOnEnd = true,
        audioGroup = "Towers",
        timeScaled = true,
        parent = Model.PrimaryPart,
        position = Model:GetPivot().Position,
    })
    self._attack = v1
    self._lastAttacked = v2
    self:Wait(Cooldown)
end

return v1