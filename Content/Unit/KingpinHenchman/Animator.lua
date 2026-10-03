-- Script path: ReplicatedStorage.Content.Unit.KingpinHenchman.Animator
-- Decompile time: 3.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local u22 = TweenInfo.new(0.3)
local v1 = {}
v1.__index = v1

local function resolveWeaponConfig(a1) -- Line: 13 -- types: a1: userdata
    local Weapon = a1:FindFirstChild("Weapon")
    if not Weapon then
        return
    end
    local Gun = Weapon:FindFirstChild("Gun")
    if not Gun then
        return
    end
    return Gun:FindFirstChildOfClass("Configuration")
end

local function resolveAttachment(a1, a2) -- Line: 27 -- types: a1: userdata, a2: string
    local v1
    local Weapon = a1:FindFirstChild("Weapon")
    if Weapon then
        local Gun = Weapon:FindFirstChild("Gun")
        v1 = if Gun then Gun:FindFirstChildOfClass("Configuration") else nil
    else
        v1 = nil
    end
    if not v1 then
        return
    end
    local Attachments = v1:FindFirstChild("Attachments")
    if not Attachments then
        return
    end
    local v2 = Attachments:FindFirstChild(a2)
    if not v2 then
        return
    end
    return v2.Value
end

local function playUnitSound(a1, a2) -- Line: 46 -- upvalues: EasySound (val) -- types: a1: userdata, a2: number
    EasySound.Play({
        destroyOnEnd = true,
        audioGroup = "Towers",
        timeScaled = true,
        id = a2,
        parent = a1.PrimaryPart,
        position = a1:GetPivot().Position,
    })
end

function v1.Initialize(a1) -- Line: 57
    a1._animations = {}
    a1:_setupAnimations()
    a1:_playTrack("Walk", Enum.AnimationPriority.Core)
    task.spawn(function() -- Line: 63 -- upvalues: a1 (val)
        a1:_setStandby((a1.Replicator:WaitForState("Standby")))
    end)
    ;(a1.Replicator:GetStateChangedSignal("Standby")):Connect(function(a1_2) -- Line: 68 -- upvalues: a1 (val) -- types: a1_2: boolean
        a1:_setStandby(a1_2)
    end)
    a1:Thread(function() -- Line: 72 -- upvalues: a1 (val)
        if not a1:IsAlive() then
            return
        end
        local v1 = a1:FindTarget()
        if v1 and a1:_canFire() then
            a1:_fireAt(v1)
        end
    end)
    a1.Executables = {
        Death = function() -- Line: 85 -- upvalues: a1 (val)
            a1:_setStandby(false)
            a1:_playTrack("Death", Enum.AnimationPriority.Action2)
        end,
    }
end

function v1:_canFire() -- Line: 92
    return self:IsAlive() and self.Replicator:Get("Standby") == true
end

function v1:_setupAnimations() -- Line: 96 -- upvalues: Animation (val)
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

function v1:_playTrack(a2, a3) -- Line: 114 -- types: self: table, a2: string
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

function v1:_stopTrack(a2) -- Line: 128 -- types: self: table, a2: string
    local v1 = self._animations[a2]
    if v1 then
        v1:Stop()
    end
end

function v1:_setStandby(a2) -- Line: 135 -- types: self: table, a2: boolean
    if a2 then
        self:_playTrack("Idle", Enum.AnimationPriority.Idle)
        return
    end
    self:_stopTrack("Idle")
    self:_stopTrack("Fire")
end

function v1:_fireAt(a2) -- Line: 144
    -- upvalues: u22 (val), EasySound (val), EmitterManager (val)
    local Value
    if not self:IsAlive() then
        return
    end
    local Position = a2:GetPivot().Position
    self:Face(Position, u22)
    self:_playTrack("Fire", Enum.AnimationPriority.Action)
    local Model = self.Model
    local Play = EasySound.Play
    local v1 = {
        id = 116135516334256,
        destroyOnEnd = true,
        audioGroup = "Towers",
        timeScaled = true,
        parent = Model.PrimaryPart,
        position = Model:GetPivot().Position,
    }
    Play(v1)
    local Weapon = self.Model:FindFirstChild("Weapon")
    if Weapon then
        local Gun = Weapon:FindFirstChild("Gun")
        v1 = if Gun then Gun:FindFirstChildOfClass("Configuration") else nil
    else
        v1 = nil
    end
    if v1 then
        local Attachments = v1:FindFirstChild("Attachments")
        if Attachments then
            local Start = Attachments:FindFirstChild("Start")
            Value = if Start then Start.Value else nil
        else
            Value = nil
        end
    else
        Value = nil
    end
    if Value then
        self:Bullet({
            Spread = 50,
            Speed = 140,
            Start = Value.WorldPosition,
            End = Position,
            Color = self.Model:GetAttribute("BulletColor"),
        })
        EmitterManager.manualEmit(Value)
    end
    self:Wait((self.Replicator:Get("Cooldown")))
end

return v1