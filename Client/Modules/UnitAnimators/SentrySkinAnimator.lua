-- Script path: ReplicatedStorage.Client.Modules.UnitAnimators.SentrySkinAnimator
-- Decompile time: 5.70 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local u42 = {}
u42.__index = u42
local u44 = Random.new()

local function createSpatialSoundPool(a1, a2, a3, a4) -- Line: 21
    -- upvalues: SoundPool (val)
    if a1 and a1:IsA("Sound") and a2 then
        local v1 = SoundPool.new({
            audioGroup = "Towers",
            id = a1.SoundId,
            parent = a2,
            volume = a1.Volume,
            size = a4,
        })
        a3.Maid:Mark(v1)
        return v1
    end
end

function u42:resolveConfig(a2) -- Line: 38 -- types: self: table, a2: string
    local Configuration = self.Model:FindFirstChild("Configuration")
    local v1 = Configuration and Configuration:FindFirstChild(a2)
    if v1 and v1:IsA("ObjectValue") then
        return v1.Value
    end
    return v1
end

function u42:resolveAnimation(a2) -- Line: 48 -- types: self: table, a2: string
    local Animations = self.Model:FindFirstChild("Animations")
    local v1 = Animations and Animations:FindFirstChild(a2)
    if v1 and v1:IsA("Folder") then
        return v1:FindFirstChild("0") or v1:FindFirstChildWhichIsA("Animation")
    end
    return v1
end

function u42:_recoilBarrel() -- Line: 58
    if not self._barrelRecoilSpring then
        return
    end
    self._barrelRecoilSpring.v = self._barrelRecoilSpring.v + 5
end

function u42:_spinBarrel() -- Line: 66
    if not self._barrelSpinSpeedSpring then
        return
    end
    self._barrelSpinSpeedSpring.v = self._barrelSpinSpeedSpring.v + 120
end

function u42:_fire(a2) -- Line: 74 -- upvalues: EmitterManager (val) -- types: self: table, a2: vector
    local _startAttachment = self._startAttachment
    if not _startAttachment then
        return
    end
    self.NPC:Face(a2)
    self:_recoilBarrel()
    self:_spinBarrel()
    if self._fireSoundPool then
        self._fireSoundPool:play()
    end
    EmitterManager.manualEmit(_startAttachment)
    self.NPC:Bullet({Start = _startAttachment.WorldPosition, End = a2, Spread = 50, Speed = 140})
end

function u42:_projectile(a2, a3) -- Line: 98 -- upvalues: EmitterManager (val), u44 (val), EffectsController (val)
    if self._rocketStarts and #self._rocketStarts ~= 0 then
        local PrimaryPart = a2.PrimaryPart
        if not PrimaryPart then
            return
        end
        self._rocketIndex = self._rocketIndex + 1
        local _rocketIndex = self._rocketIndex
        if #self._rocketStarts < _rocketIndex then
            self._rocketIndex = 1
        end
        local v1 = self._rocketStarts[self._rocketIndex]
        local Position = PrimaryPart.Position
        self.NPC:Face(Position)
        EmitterManager.manualEmit(v1)
        if self._rocketFireSoundPool then
            self._rocketFireSoundPool:play({playbackSpeed = u44:NextNumber(0.9, 1.15)})
        end
        self.NPC:Bullet({Start = v1.WorldPosition, End = Position, Spread = 0, Speed = 45})
        self.NPC:Delay((v1.WorldPosition - Position).Magnitude / 45)
        EffectsController.Explosion({Sound = 4725504496, Position = Position, Radius = a3})
        return
    end
end

function u42.Initialize(a1, a2) -- Line: 140
    -- upvalues: u42 (val), createSpatialSoundPool (val), SpringClass (val), RunService (val), TweenService (val)
    -- upvalues: Animation (val)
    local u5 = setmetatable({}, u42)
    u5.NPC = a2
    u5.Model = a2.Model
    u5._barrelBone = u5:resolveConfig("Barrel")
    u5._startAttachment = u5:resolveConfig("Start")
    u5._fireSound = u5:resolveConfig("Fire")
    u5._rocketFireSound = u5:resolveConfig("RocketFire")
    u5._rocketIndex = 0
    u5._rocketStarts = {}
    u5._barrelSpinAngle = 0
    u5._fireSoundPool = createSpatialSoundPool(u5._fireSound, u5._startAttachment, a2)
    local Configuration = u5.Model:FindFirstChild("Configuration")
    u5._isMinigunBarrel = string.lower((tostring(Configuration and Configuration:GetAttribute("BarrelType")))) == "minigun"
    if u5._isMinigunBarrel then
        u5._barrelSpinSpeedSpring = SpringClass.new(0, 1, 6)
    end
    local v1 = u5:resolveConfig("RocketStart1")
    local v2 = u5:resolveConfig("RocketStart2")
    if v1 then
        table.insert(u5._rocketStarts, v1)
    end
    if v2 then
        table.insert(u5._rocketStarts, v2)
    end
    if #u5._rocketStarts > 0 then
        u5._rocketFireSoundPool = createSpatialSoundPool(u5._rocketFireSound, u5.Model.PrimaryPart, a2, 3)
    end
    if u5._barrelBone then
        u5._barrelBaseTransform = u5._barrelBone.Transform
        u5._barrelRecoilSpring = SpringClass.new(0, 0.5, 20)
        a2.Maid:Mark((RunService.Stepped:Connect(function(a1, a2) -- Line: 178 -- upvalues: u5 (val)
            local v1 = math.clamp(u5._barrelRecoilSpring.p, 0, 1)
            local identity = CFrame.identity
            if u5._isMinigunBarrel then
                local v2 = math.max(u5._barrelSpinSpeedSpring.p, 0)
                if v2 > 0.001 then
                    u5._barrelSpinAngle = (u5._barrelSpinAngle + a2 * v2) % 6.283185307179586
                end
                identity = CFrame.Angles(0, u5._barrelSpinAngle, 0)
            end
            u5._barrelBone.Transform = u5._barrelBaseTransform * CFrame.new(0, -v1, 0) * identity
        end)))
    end
    local PrimaryPart = u5.Model.PrimaryPart and u5.Model.PrimaryPart:FindFirstChild("Build")
    if PrimaryPart and PrimaryPart:IsA("Sound") then
        PrimaryPart:Play()
    end
    local Executables = a2.Executables or {}
    a2.Executables = Executables
    if #u5._rocketStarts > 0 then
        function a2.Executables.Projectile(a1, a2) -- Line: 206 -- upvalues: u5 (val)
            u5:_projectile(a1, a2)
        end
    end
    local Shield = u5.Model:FindFirstChild("Shield")
    if Shield then
        local Mesh = Shield:FindFirstChild("Mesh")
        local Decal = Shield:FindFirstChild("Decal")
        local Scale = Mesh
        if Scale then
            Scale = Mesh.Scale
        end
        if Mesh then
            Mesh.Scale = Vector3.new(0, 0, 0)
        end
        if Decal then
            Decal.Transparency = 1
        elseif Shield:IsA("BasePart") then
            Shield.Transparency = 1
        end

        function a2.Executables.Shield(a1) -- Line: 226
            -- upvalues: Shield (val), Mesh (val), Scale (val), TweenService (upval), Decal (val)
            local v1
            local v2 = if not a1 then 1 else 0.8
            if not a1 then
                local Attribute
                local Pop = Shield:FindFirstChild("Pop")
                if Pop and Pop:IsA("Sound") then
                    Pop:Play()
                end
                for i, j in Shield:GetDescendants() do
                    if j:IsA("ParticleEmitter") then
                        Attribute = j:GetAttribute("EmitCount")
                        if Attribute then
                            j:Emit(Attribute)
                        end
                    end
                end
            end
            if Mesh and Scale then
                v1 = TweenService
                local v3 = TweenInfo.new(1.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
                v1:Create(Mesh, v3, {Scale = a1 and Scale or Vector3.new(0, 0, 0)}):Play()
            end
            if Decal or Shield:IsA("BasePart") then
                v1 = TweenService
                v1:Create(Decal or Shield, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Transparency = v2}):Play()
            end
        end
    end
    local Animator = (u5.Model:WaitForChild("AnimationController")):WaitForChild("Animator")
    local v3 = u5:resolveAnimation("Idle")
    local v4 = u5:resolveAnimation("Intro")
    local v5 = nil
    if v3 then
        v5 = Animation.new({
            IgnorePriority = true,
            IsPersistent = true,
            Preload = true,
            Track = v3,
            Target = Animator,
        })
    end
    if v4 then
        Animation.new({
            IgnorePriority = true,
            IsPersistent = true,
            Preload = true,
            Track = v4,
            Target = Animator,
        }):Play(0)
    end
    a2:Delay(a2.Stats.Attributes.SendTime)
    if v5 then
        v5:Play(0)
    end
    a2:Thread(function() -- Line: 296 -- upvalues: a2 (val), u5 (val)
        local v1 = a2:FindTarget()
        local PrimaryPart = v1 and v1.PrimaryPart
        if PrimaryPart and a2.Dead == false then
            u5:_fire(PrimaryPart.Position)
            a2:Delay(a2.Cooldown)
        end
    end)
end

return u42