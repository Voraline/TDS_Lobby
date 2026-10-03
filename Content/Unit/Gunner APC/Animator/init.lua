-- Script path: ReplicatedStorage.Content.Unit.Gunner APC.Animator
-- Decompile time: 3.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local u27 = require("@self/GunnerApcSkinConfig")
local v1 = {}
v1.__index = v1

function v1:_getModelConfig() -- Line: 25
    return self.Model:FindFirstChild("Configuration")
end

function v1:_face(a2, a3) -- Line: 29 -- upvalues: TweenService (val)
    local PrimaryPart = self.Model.PrimaryPart
    local lookVector = PrimaryPart.CFrame.lookVector
    local Unit = (a2 - PrimaryPart.Position).Unit
    local v1 = math.deg((math.atan2(lookVector.Z, lookVector.X)) - (math.atan2(Unit.Z, Unit.X))) * 0.017453292519943295
    if self._resetAimThread then
        task.cancel(self._resetAimThread)
        self._resetAimThread = nil
    end
    if self._resetTween then
        self._resetTween:Cancel()
        self._resetTween = nil
    end
    if not self._originalCFrame then
        local CFrame_2 = a3:IsA("Bone") and a3.CFrame or a3.C0
        self._originalCFrame = CFrame_2
    end
    local v2 = self._originalCFrame * CFrame.Angles(0, v1, 0)
    if a3:IsA("Bone") then
        a3.CFrame = v2
    elseif a3:IsA("Motor6D") then
        a3.C0 = v2
    end
    self._resetAimThread = self:Delay(4, function() -- Line: 59 -- upvalues: self (val), a3 (val), TweenService (upval)
        if self:IsAlive() then
            local v1 = a3:IsA("Bone") and {CFrame = self._originalCFrame} or {C0 = self._originalCFrame}
            local v2 = TweenService:Create(a3, TweenInfo.new(1), v1)
            v2:Play()
            self._resetTween = v2
        end
    end)
end

function v1:_fire(a2) -- Line: 71 -- upvalues: EasySound (val), EmitterManager (val), u27 (val)
    local Value_2, Value_3
    local v1 = self:_getModelConfig()
    local Name = self.Model.Name
    local Position = a2.PrimaryPart.Position
    self:_face(Position, if not v1 then self.Model.Chasis.HeadRotate else v1.Y_Pivot.Value)
    if not v1 then
        Value_2 = self.Model.Weapon.CannonBarrel.Start
        Value_3 = self.Model.Weapon.Head.Fire
    else
        Value_2 = v1.FireEffect.Value
        Value_3 = v1.FireSound.Value
    end
    EasySound.Play({
        name = "FireSound",
        destroyOnEnd = true,
        audioGroup = "Towers",
        id = Value_3.SoundId,
        parent = Value_3.Parent,
        volume = Value_3.Volume,
    })
    self.FireAnimation:Play()
    EmitterManager.manualEmit(Value_2)
    local v2 = u27.Overrides.Bullet[Name]
    if not v2 then
        self:Bullet({Start = Value_2.WorldPosition, End = Position, Spread = 50, Speed = 140})
    else
        v2(self, Value_2.WorldPosition, Position)
    end
    self:Delay(self.Cooldown)
end

function v1.Initialize(a1) -- Line: 124 -- upvalues: EasySound (val), Animation (val), u27 (val), EmitterManager (val)
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local PrimaryPart = a1.Model.PrimaryPart
    local Name = a1.Model.Name
    local Drive = PrimaryPart:FindFirstChild("Drive")
    if Drive then
        EasySound.Play({
            looped = true,
            audioGroup = "Towers",
            id = Drive.SoundId,
            parent = PrimaryPart,
            volume = Drive.Volume,
            playbackSpeed = Drive.PlaybackSpeed or 1,
        })
    end
    a1.FireAnimation = Animation.new({Track = Animations:WaitForChild("Fire"), Target = AnimationController})
    Animation.new({
        IgnorePriority = true,
        Track = Animations:WaitForChild("Walk"),
        Target = AnimationController,
    }):Play()
    a1.Executables = {
        Death = function() -- Line: 154 -- upvalues: u27 (upval), Name (val), a1 (val), EmitterManager (upval), PrimaryPart (val)
            local v1 = u27.Overrides.DeathExplosion[Name]
            if not v1 then
                local v2 = u27.DeathExplosion[Name]
                EmitterManager.Emit(v2 and v2.Name or "LargeExplosion", PrimaryPart.CFrame, v2 and v2.Scale or 4)
            else
                v1(a1)
            end
            if a1._resetAimThread then
                task.cancel(a1._resetAimThread)
                a1._resetAimThread = nil
            end
            if a1._resetTween then
                a1._resetTween:Cancel()
                a1._resetTween = nil
            end
        end,
    }
    a1:Thread(function() -- Line: 179 -- upvalues: a1 (val)
        local v1 = a1:FindTarget()
        if v1 and a1:IsAlive() then
            a1:_fire(v1)
        end
    end)
end

return v1