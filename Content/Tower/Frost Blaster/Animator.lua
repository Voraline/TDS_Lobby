-- Script path: ReplicatedStorage.Content.Tower.Frost Blaster.Animator
-- Decompile time: 1.86 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
game:GetService("Debris")
local v1 = {}
v1.__index = v1

function v1:FireVFX(a2) -- Line: 14 -- upvalues: Animation (val), EasySound (val)
    local Handle = self.Model.Weapon.Gun.Handle
    local Start = Handle:FindFirstChild("Start")
    if self.lastAnimation then
        self.lastAnimation:Stop()
    end
    self.lastAnimation = Animation.new({
        Track = self.Model.Animations.Fire[if not (4 <= self:GetLevel()) then 0 else 4].Fire,
        Target = self.Model.AnimationController,
    })
    self.lastAnimation:Play()
    self.AimAt(a2, a2 + Vector3.new(0, 1.5, 0))
    if Start then
        local v1
        local Fire = Handle.Fire
        EasySound.Play({
            audioGroup = "Towers",
            destroyOnEnd = true,
            id = Fire.SoundId,
            parent = Handle,
            playbackSpeed = (Random.new()):NextNumber(Fire.PlaybackSpeed * 0.9, Fire.PlaybackSpeed * 1.2),
            volume = Fire.Volume or 1,
        })
        for k, v in pairs(Start:GetChildren()) do
            if v:IsA("ParticleEmitter") then
                v1 = v:GetAttribute("EmitCount") or 1
                if v1 then
                    v:Emit(v1)
                end
            end
        end
    end
end

function v1.Initialize(a1) -- Line: 59
    -- upvalues: SharedControllerFunctions (val), Projectile (val), EmitterManager (val)
    a1.lastAnimation = nil
    a1._lastRepositionServerTime = (-1 / 0)
    if a1.Replicator and a1.Replicator.GetStateChangedSignal then
        a1.Maid:Mark(((a1.Replicator:GetStateChangedSignal("Position")):Connect(function() -- Line: 64 -- upvalues: a1 (val)
            a1._lastRepositionServerTime = workspace:GetServerTimeNow()
        end)))
    end
    SharedControllerFunctions.RegisterJoints(a1, {a1.Model.Torso["Left Shoulder"], a1.Model.Torso["Right Shoulder"]})

    function a1.AimAt(a1_2, a2) -- Line: 74 -- upvalues: a1 (val), SharedControllerFunctions (upval)
        a1:Face(a1_2)
        SharedControllerFunctions.AimArmsAt(a1, a1_2)
        SharedControllerFunctions.AimHeadAt(a1, a2 or a1_2)
    end

    a1.Executables = {
        Projectile = function(a1_2) -- Line: 81 -- upvalues: a1 (val), Projectile (upval), EmitterManager (upval)
            if a1_2.Started and a1_2.Started < a1._lastRepositionServerTime then
                return
            end
            local Start = a1.Model.Weapon.Gun.Handle:FindFirstChild("Start")
            local WorldPosition = Start and Start.WorldPosition or a1.Model.PrimaryPart.Position
            a1_2.Projectile = a1.Model:WaitForChild("Projectile")
            a1_2.Decay = 1
            a1:FireVFX(a1_2.End)
            a1_2.Start = WorldPosition
            Projectile:Pierce(a1_2, function(a1) -- Line: 96 -- upvalues: EmitterManager (upval)
                local Position = a1.PrimaryPart.Position
                EmitterManager.Emit("MagicHit", CFrame.new(Position))
            end)
        end,
    }
end

return v1