-- Script path: ReplicatedStorage.Content.Enemies.Minigunner.Animator
-- Decompile time: 2.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 11 -- upvalues: Animation (val), Laser (val), TweenService (val)
    a1.Shooting = false
    a1.BeamPos = Vector3.new(0, 0, 0)
    local u11 = Animation.new({
        Track = a1.Model.Animations.Fire,
        Target = a1.Model.AnimationController,
    })

    function a1.Face(a1_2) -- Line: 20 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        return CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    a1.Executables = {
        Barrage = function(a1_2, a2) -- Line: 30 -- upvalues: a1 (val), u11 (val)
            a1.BeamPos = a2
            a1.Shooting = a1_2
            local Handle = a1.Model.Gun:WaitForChild("Handle")
            if a1_2 then
                u11:Play()
                a1.Model.Head.Fire:Play()
                Handle.Barrel.MaxVelocity = 0.2
                return
            end
            u11:Stop(0.5)
            Handle.Barrel.MaxVelocity = 0
            a1.Model.Head.Fire:Stop()
            a1.Model.Head.Ended:Play()
        end,
        BeamPosition = function(a1_2, a2) -- Line: 48 -- upvalues: a1 (val), Laser (upval)
            local Attribute, v1
            local Handle = a1.Model.Gun:WaitForChild("Handle")
            a1.BeamPos = a2
            for k, v in pairs(Handle.Start:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    Attribute = v:GetAttribute("EmitCount")
                    if Attribute then
                        v:Emit(Attribute)
                    end
                end
            end
            for k2, i in pairs(a1_2) do
                v1 = {
                    Start = Handle.Start.WorldPosition,
                    Pos = i,
                    Color = BrickColor.new("Cork"),
                    Transparency = 0.1,
                    Size = 0.04,
                    Fade = 90,
                    Type = "Bullet",
                    Bullet = "Normal",
                }
                Laser:Cast(v1)
            end
        end,
        Death = function() -- Line: 77 -- upvalues: Animation (upval), a1 (val), TweenService (upval)
            local v1, v2, v3
            local u10 = Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            })
            u10:Play()
            a1.Model.Head.Shutdown:Play()
            task.defer(function() -- Line: 87 -- upvalues: u10 (val), a1 (upval)
                while u10.Controller.Length == 0 do
                    a1:Delay(0.01)
                end
                a1:Delay(u10.Controller.Length * 0.98)
                u10.Controller:AdjustSpeed(0)
            end)
            for k, v in pairs(a1.Model:GetDescendants()) do
                if v:IsA("BasePart") and v.Material == Enum.Material.Neon then
                    v2 = TweenService
                    v3 = TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)
                    v1 = {Color = Color3.new(0.0823529, 0.0823529, 0.0823529)}
                    v2:Create(v, v3, v1):Play()
                end
            end
            for k2, i in pairs(a1.Model.Torso.DeathParticle:GetChildren()) do
                if i:IsA("ParticleEmitter") then
                    i.Enabled = true
                end
            end
            a1:Delay(2)
            for k3, j in pairs(a1.Model.Torso.DeathParticle:GetChildren()) do
                if j:IsA("ParticleEmitter") and j.Name ~= "Smoke" then
                    j.Enabled = false
                end
            end
        end,
    }

    function a1.OnStepFunction(a1_2) -- Line: 131 -- upvalues: a1 (val)
        if a1.Shooting then
            local HumanoidRootPart = a1.Model.HumanoidRootPart
            HumanoidRootPart.CFrame = HumanoidRootPart.CFrame:Lerp(a1.Face(a1.BeamPos), a1_2 * 8)
        end
    end
end

return v1