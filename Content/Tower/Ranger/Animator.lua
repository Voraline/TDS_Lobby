-- Script path: ReplicatedStorage.Content.Tower.Ranger.Animator
-- Decompile time: 8.62 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

local function debrisAddItem(a1, a2) -- Line: 16 -- upvalues: TimescaleUtilities (val)
    TimescaleUtilities.Delay(a2, function() -- Line: 17 -- upvalues: a1 (val)
        a1:Destroy()
    end)
end

local function FindFirstDescendant(a1, a2) -- Line: 22
    return a1:FindFirstChild(a2, true)
end

function v1:Fire(a2) -- Line: 26
    -- upvalues: Animation (val), SharedControllerFunctions (val), SoundPool (val), Laser (val), EmitterManager (val)
    -- upvalues: Create (val), TweenService (val), TimescaleUtilities (val)
    local ImpactExplosion, u551, v1, v2
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    local Torso = a2:FindFirstChild("Torso") or a2:FindFirstChild("Upper Torso")
    local Head = a2:FindFirstChild("Head")
    local Position = Torso and Torso.Position or PrimaryPart.Position
    local Position_2 = Head and Head.Position or Position
    local Effects = self.Model:FindFirstChild("Effects")
    local Gun = self.Model.Weapon:WaitForChild("Gun")
    local v3 = if not (3 < (self:GetLevel())) then 0 else 4
    local Cooldown = self.State.Cooldown
    if not self.FBXModel then
        local Attribute
        local Handle = Gun:WaitForChild("Handle")
        local Neon = Gun:FindFirstChild("Neon")
        local new = Animation.new
        v2 = {
            Track = self.Model.Animations.Fire[v3].Fire,
            Target = self.Model.AnimationController,
        }
        new(v2):Play()
        self:Face(Position)
        SharedControllerFunctions.AimArmsAt(self, Position)
        SharedControllerFunctions.AimHeadAt(self, Position_2)
        local Fire = Handle:FindFirstChild("Fire")
        if Fire and Fire:IsA("Sound") then
            local _fireSoundPools = self._fireSoundPools or {}
            self._fireSoundPools = _fireSoundPools
            v2 = self._fireSoundPools[Fire]
            if not v2 then
                local v4 = string.match(Fire.SoundId or "", "%d+")
                local v5 = v4 and tonumber(v4)
                if v5 then
                    v2 = SoundPool.new({size = 4, id = v5, parent = Handle, volume = Fire.Volume})
                    self._fireSoundPools[Fire] = v2
                end
            end
            if v2 then
                v2:play({
                    playbackSpeed = (Random.new()):NextNumber(Fire.PlaybackSpeed * 0.9, Fire.PlaybackSpeed * 1.2),
                    volume = Fire.Volume,
                })
            end
        end
        for k, v in pairs(Handle.Start:GetChildren()) do
            if v:IsA("ParticleEmitter") then
                Attribute = v:GetAttribute("EmitCount")
                if Attribute then
                    v:Emit(Attribute)
                end
            end
        end
        if not Neon then
            self:Bullet({
                Start = Handle.Start.WorldPosition,
                End = Position,
                Spread = 10,
                Speed = 140,
                Bullet = "Normal",
            })
        else
            v2 = {Lifetime = 0.5, minWidth = 0.1, maxWidth = 0.25, Bursts = 2}
            local Color = Neon.Color or Color3.fromRGB(0, 170, 255)
            v2.Color = Color
            v2.Start = Handle.Start.WorldPosition
            v2.End = Position
            v2.Offset = Random.new():NextNumber(0.15, 0.3)
            Laser:Lightning(v2)
            if Neon:FindFirstChild("Shock") then
                Neon.Shock.Enabled = true
                self:Delay(Cooldown * 0.5, function() -- Line: 110 -- upvalues: Neon (val)
                    if Neon and Neon:FindFirstChild("Shock") then
                        Neon.Shock.Enabled = false
                    end
                end)
            end
        end
        if self.Stats.Attributes.CanExplode then
            v1 = self.Replicator:Get("ExplosionRadiusMultiplier") or 1
            ImpactExplosion = Effects and Effects:FindFirstChild("ImpactExplosion")
            if not ImpactExplosion then
                EmitterManager.Emit("ImpactExplosion", CFrame.new(Position), self.Stats.Attributes.ExplosionRadius * v1)
            else
                u551 = ImpactExplosion:Clone()
                u551.CFrame = CFrame.new(Position)
                u551.Parent = workspace.Terrain
                EmitterManager.manualEmit(u551)
                TimescaleUtilities.Delay(u551:GetAttribute("Lifetime") or 1, function() -- Line: 17 -- upvalues: u551 (val)
                    u551:Destroy()
                end)
            end
        end
        self:Delay(Cooldown)
        return
    end
    local new_4 = Animation.new
    local v6 = {
        Track = self.Model.Animations.Fire[v3],
        Target = self.Model.AnimationController,
    }
    new_4(v6):Play()
    self:Face(Position)
    local Fire_2 = Gun:FindFirstChild("Fire", true)
    if Fire_2 and Fire_2:IsA("Sound") then
        local _fireSoundPools_2 = self._fireSoundPools or {}
        self._fireSoundPools = _fireSoundPools_2
        v6 = self._fireSoundPools[Fire_2]
        if not v6 then
            local v7 = string.match(Fire_2.SoundId or "", "%d+")
            v2 = v7 and tonumber(v7)
            if v2 then
                v6 = SoundPool.new({
                    size = 4,
                    id = v2,
                    parent = self.Model.PrimaryPart,
                    volume = Fire_2.Volume,
                })
                self._fireSoundPools[Fire_2] = v6
            end
        end
        if v6 then
            v6:play({
                playbackSpeed = (Random.new()):NextNumber(Fire_2.PlaybackSpeed * 0.9, Fire_2.PlaybackSpeed * 1.2),
                volume = Fire_2.Volume,
            })
        end
    end
    local Start = self.BoneVFX:FindFirstChild("Start" .. (tostring(self.Upgrade)), true) or PrimaryPart:FindFirstChild("Start", true) or Gun:FindFirstChild("Start", true)
    if Start then
        self._cachedStart = Start
    end
    if not Start and self._cachedStart then
        Start = self._cachedStart
    end
    if not Start then
        warn("No start attachment found for tower", self.Model:GetFullName())
        return
    end
    EmitterManager.manualEmit(Start)
    local Beam = Effects and Effects:FindFirstChild("Beam")
    if Beam and Beam:IsA("Folder") then
        v2 = Beam:FindFirstChild((tostring(self.Upgrade)))
        local Start_2 = Beam:FindFirstChild("Start") or Beam:FindFirstChild("0") or Start
        Beam = (v2 or Start_2):FindFirstChild("Attachment")
    end
    if not Beam then
        local Weapon = self.Model:FindFirstChild("Weapon")
        local Config = Weapon and Weapon:FindFirstChild("Config")
        self:Bullet({
            Start = Start.WorldPosition,
            End = Position,
            Spread = 10,
            Speed = 140,
            Bullet = Config and Config:GetAttribute("BulletType") or "Normal",
        })
    else
        v2 = Beam:GetAttribute("Lifetime") or 0.5
        local u437 = Create("Attachment", {Name = "End", Parent = workspace.Terrain, WorldCFrame = CFrame.new(Position)})
        for i, j in Beam:GetChildren() do
            local u459 = j:Clone()
            u459.Parent = Start
            u459.Attachment0 = Start
            u459.Attachment1 = u437
            u459.Enabled = true
            TweenService:Create(
                u459,
                TweenInfo.new(v2, Enum.EasingStyle.Cubic, Enum.EasingDirection.In, 0, false, 0),
                {Width0 = 0, Width1 = 0}
            ):Play()
            TimescaleUtilities.Delay(v2, function() -- Line: 17 -- upvalues: u459 (val)
                u459:Destroy()
            end)
        end
        TimescaleUtilities.Delay(v2, function() -- Line: 17 -- upvalues: u437 (val)
            u437:Destroy()
        end)
    end
    if self.Stats.Attributes.CanExplode then
        v1 = self.Replicator:Get("ExplosionRadiusMultiplier") or 1
        ImpactExplosion = Effects and Effects:FindFirstChild("ImpactExplosion")
        if not ImpactExplosion then
            EmitterManager.Emit("ImpactExplosion", CFrame.new(Position), self.Stats.Attributes.ExplosionRadius * v1)
        else
            u551 = ImpactExplosion:Clone()
            u551.CFrame = CFrame.new(Position)
            u551.Parent = workspace.Terrain
            EmitterManager.manualEmit(u551)
            TimescaleUtilities.Delay(u551:GetAttribute("Lifetime") or 1, function() -- Line: 17 -- upvalues: u551 (val)
                u551:Destroy()
            end)
        end
    end
    self:Delay(Cooldown)
end

function v1.Initialize(a1) -- Line: 276 -- upvalues: SharedControllerFunctions (val)
    if not a1.FBXModel then
        SharedControllerFunctions.RegisterJoints(a1, {a1.Model.Torso["Left Shoulder"], a1.Model.Torso["Right Shoulder"]})
    end
    a1.Maid:Mark(function() -- Line: 284 -- upvalues: a1 (val)
        if a1._fireSoundPools then
            for i, j in a1._fireSoundPools do
                j:destroy()
            end
            a1._fireSoundPools = nil
        end
    end)
    a1.OnUpgrade:Connect(function() -- Line: 293 -- upvalues: a1 (val)
        if a1._fireSoundPools then
            for i, j in a1._fireSoundPools do
                j:destroy()
            end
            for k in a1._fireSoundPools do
                a1._fireSoundPools[k] = nil
            end
        end
    end)
    a1:Thread(function() -- Line: 304 -- upvalues: a1 (val)
        local v1 = a1:FindTarget()
        if v1 then
            a1:Fire(v1)
        end
    end)
end

return v1