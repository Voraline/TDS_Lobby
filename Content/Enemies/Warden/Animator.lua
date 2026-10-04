-- Script path: ReplicatedStorage.Content.Enemies.Warden.Animator
-- Decompile time: 1.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 9 -- upvalues: Animation (val)
    a1.Shooting = false
    a1.BeamPos = Vector3.new(0, 0, 0)
    Animation.new({
        Track = a1.Model.Animations.Rage,
        Target = a1.Model.AnimationController,
    })
    Animation.new({
        Track = a1.Model.Animations.Laser,
        Target = a1.Model.AnimationController,
    })
    local u29 = Animation.new({
        Track = a1.Model.Animations.Rage,
        Target = a1.Model.AnimationController,
    })
    local u38 = Animation.new({
        Track = a1.Model.Animations.Laser,
        Target = a1.Model.AnimationController,
    })
    local BeamEnd = a1.Model.HumanoidRootPart:WaitForChild("BeamEnd")

    function a1.Face(a1_2) -- Line: 32 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        return CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    function a1.EnableBeam(a1_2) -- Line: 41 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        local Head = a1.Model.Head
        local v1 = a1_2
        for k, v in pairs(HumanoidRootPart.BeamEnd:GetChildren()) do
            if v:IsA("Beam") or v:IsA("ParticleEmitter") then
                v.Enabled = v1
            end
        end
        if v1 then
            Head.Laser:Play()
            return
        end
        Head.Laser:Stop()
    end

    a1.Executables = {
        Barrage = function(a1_2, a2, a3) -- Line: 60 -- upvalues: a1 (val), u29 (val), u38 (val)
            a1.Shooting = a1_2
            if not a1_2 then
                u38:Stop()
                a1.EnableBeam(false)
                return
            end
            u29:Play()
            u29.Controller.Stopped:Wait()
            u38:Play()
            a1.Face(a3)
            a1.EnableBeam(true)
        end,
        BeamPosition = function(a1_2) -- Line: 77 -- upvalues: a1 (val)
            a1.BeamPos = a1_2
        end,
    }

    function a1.OnStepFunction(a1_2) -- Line: 82 -- upvalues: a1 (val), BeamEnd (val)
        if a1.Shooting then
            local HumanoidRootPart = a1.Model.HumanoidRootPart
            BeamEnd.WorldCFrame = BeamEnd.WorldCFrame:Lerp(CFrame.new(a1.BeamPos), a1_2 * 6)
            BeamEnd.WorldCFrame = BeamEnd.WorldCFrame:Lerp(CFrame.new(a1.BeamPos), a1_2 * 6)
            HumanoidRootPart.CFrame = HumanoidRootPart.CFrame:Lerp(a1.Face(a1.BeamPos), a1_2 * 8)
        end
    end
end

return v1