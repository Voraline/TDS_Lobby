-- Script path: ReplicatedStorage.Content.Unit.KingpinHitman.Animator
-- Decompile time: 5.01 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ServerTicks = require(ReplicatedStorage.Shared.Modules.ServerTicks)
local v1 = {}
v1.__index = v1

local function resolveWeaponConfig(a1) -- Line: 15 -- types: a1: userdata
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

local function resolveAttachment(a1, a2) -- Line: 29 -- types: a1: userdata, a2: string
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

local function playUnitSound(a1, a2) -- Line: 48 -- upvalues: EasySound (val) -- types: a1: userdata, a2: number
    EasySound.Play({
        destroyOnEnd = true,
        audioGroup = "Towers",
        timeScaled = true,
        id = a2,
        parent = a1.PrimaryPart,
        position = a1:GetPivot().Position,
    })
end

function v1.Initialize(a1) -- Line: 59 -- upvalues: RunService (val)
    a1._animations = {}
    a1:_setupAnimations()
    a1:_playTrack("Walk", Enum.AnimationPriority.Core)
    task.spawn(function() -- Line: 65 -- upvalues: a1 (val)
        a1:_setStandby((a1.Replicator:WaitForState("Standby")))
    end)
    a1:_setAimStart((a1.Replicator:Get("AimStart")))
    ;(a1.Replicator:GetStateChangedSignal("Standby")):Connect(function(a1_2) -- Line: 72 -- upvalues: a1 (val) -- types: a1_2: boolean
        a1:_setStandby(a1_2)
    end)
    ;(a1.Replicator:GetStateChangedSignal("AimStart")):Connect(function(a1_2) -- Line: 76 -- upvalues: a1 (val) -- types: a1_2: number?
        a1:_setAimStart(a1_2)
    end)
    a1.Maid:Mark((RunService.RenderStepped:Connect(function(a1_2) -- Line: 80 -- upvalues: a1 (val)
        if not a1:IsAlive() then
            return
        end
        a1:_trackAimTarget(a1_2)
        a1:_updateAimReverse()
    end)))
    a1:Thread(function() -- Line: 89 -- upvalues: a1 (val)
        if not a1:IsAlive() then
            return
        end
        local v1 = a1:FindTarget()
        a1:_setAimStart((a1.Replicator:Get("AimStart")))
        if v1 and a1:_canFire() then
            a1:_fireAt(v1)
        end
    end)
    a1.Executables = {
        Death = function() -- Line: 105 -- upvalues: a1 (val)
            a1:_setStandby(false)
            a1:_playTrack("Death", Enum.AnimationPriority.Action2)
        end,
    }
end

function v1:_canFire() -- Line: 112 -- upvalues: ServerTicks (val)
    if not self:IsAlive() then
        return false
    end
    local v1 = self.Replicator:Get("AimStart")
    local WeaponDrawTime = self.Stats.Attributes.WeaponDrawTime
    local v2 = ServerTicks.getTime()
    if self.Replicator:Get("Standby") == true and v1 and WeaponDrawTime then
        return WeaponDrawTime <= v2 - v1
    end
    return false
end

function v1:_trackAimTarget(a2) -- Line: 128 -- types: self: table, a2: number
    if self:IsAlive() and self.Replicator:Get("AimStart") ~= nil then
        local v1 = self:FindTarget()
        if v1 and v1.Parent then
            local PrimaryPart = self.Model.PrimaryPart
            if not PrimaryPart then
                return
            end
            local Position_2 = PrimaryPart.Position
            local Position_3 = v1:GetPivot().Position
            local v2 = Vector3.new(Position_3.X, Position_2.Y, Position_3.Z)
            if (v2 - Position_2).Magnitude <= 0.001 then
                return
            end
            local v3 = PrimaryPart.CFrame:Lerp(CFrame.lookAt(Position_2, v2), 1 - math.exp(a2 * -12))
            self:Face(v3.Position + v3.LookVector)
            return
        end
        return
    end
end

function v1:_setupAnimations() -- Line: 158 -- upvalues: Animation (val)
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

function v1:_playTrack(a2, a3) -- Line: 176 -- types: self: table, a2: string
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

function v1:_stopTrack(a2) -- Line: 190 -- types: self: table, a2: string
    local v1 = self._animations[a2]
    if v1 then
        v1:Stop()
    end
end

function v1:_stopAimTrack() -- Line: 197
    self:_stopTrack("Aim")
    self._aimTrack = nil
    self._reversingAim = false
end

function v1:_setAimStart(a2) -- Line: 203 -- upvalues: ServerTicks (val) -- types: self: table, a2: number?
    if not a2 then
        self._aimStart = nil
        if self.Replicator:Get("Standby") == true then
            self:_reverseAimTrack()
            return
        end
        self:_stopAimTrack()
        return
    end
    if self._aimStart == a2 then
        return
    end
    self._aimStart = a2
    self._reversingAim = false
    local v1 = self:_playTrack("Aim", Enum.AnimationPriority.Action)
    if not v1 then
        return
    end
    self._aimTrack = v1
    local v2 = math.max(ServerTicks.getTime() - a2, 0)
    v1:AdjustSpeed(1)
    if 0 < v1.Length then
        v1.TimePosition = math.min(v2, v1.Length)
    end
end

function v1:_reverseAimTrack() -- Line: 236
    local _aimTrack = self._aimTrack
    if not _aimTrack then
        self:_stopAimTrack()
        return
    end
    local TimePosition = _aimTrack.TimePosition
    if not _aimTrack.IsPlaying and 0 < _aimTrack.Length and TimePosition <= 0 then
        TimePosition = _aimTrack.Length
    end
    if TimePosition <= 0 then
        self:_stopAimTrack()
        return
    end
    if not _aimTrack.IsPlaying then
        _aimTrack:Play()
        _aimTrack.TimePosition = TimePosition
    end
    self._reversingAim = true
    _aimTrack:AdjustSpeed(-1)
end

function v1:_updateAimReverse() -- Line: 262
    if not self._reversingAim then
        return
    end
    local _aimTrack = self._aimTrack
    if not _aimTrack or _aimTrack.TimePosition <= 0 then
        self:_stopAimTrack()
    end
end

function v1:_setStandby(a2) -- Line: 273 -- types: self: table, a2: boolean
    if a2 then
        self:_playTrack("Idle", Enum.AnimationPriority.Idle)
        return
    end
    self:_stopTrack("Idle")
    self:_stopTrack("Fire")
    self:_stopAimTrack()
end

function v1:_fireAt(a2) -- Line: 283
    -- upvalues: EasySound (val), EmitterManager (val)
    local Value
    if not self:IsAlive() then
        return
    end
    local Position = a2:GetPivot().Position
    self:_playTrack("Fire", Enum.AnimationPriority.Action2)
    local Model = self.Model
    local Play = EasySound.Play
    local v1 = {
        id = 5079650495,
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
            Spread = 0,
            Speed = 140,
            Start = Value.WorldPosition,
            End = Position,
            Color = self.Model:GetAttribute("BulletColor"),
        })
        EmitterManager.manualEmit(Value)
    end
    self:Wait(self.Replicator:Get("Cooldown") or self.Stats.Cooldown)
end

return v1