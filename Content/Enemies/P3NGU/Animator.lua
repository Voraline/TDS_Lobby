-- Script path: ReplicatedStorage.Content.Enemies.P3NGU.Animator
-- Decompile time: 3.33 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 14
    -- upvalues: Animation (val), GameState (val), TimescaleUtilities (val), TweenService (val)
    a1.Shooting = false
    a1.BeamPos = Vector3.new(0, 0, 0)
    Animation.new({
        Track = a1.Model.Animations.Shoot,
        Target = a1.Model.AnimationController,
    })
    Animation.new({
        Track = a1.Model.Animations.Flight,
        Target = a1.Model.AnimationController,
    })
    local u29 = Animation.new({
        Track = a1.Model.Animations.Shoot,
        Target = a1.Model.AnimationController,
    })
    local u38 = Animation.new({
        Track = a1.Model.Animations.Flight,
        Target = a1.Model.AnimationController,
    })
    local BeamEnd = a1.Model.HumanoidRootPart:WaitForChild("BeamEnd")

    function a1.Face(a1_2) -- Line: 37 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        return CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    function a1.RocketFeet(a1_2) -- Line: 46 -- upvalues: a1 (val), u38 (val), GameState (upval)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        local v1 = a1.Model["Left Leg"]
        local v2 = a1.Model["Right Leg"]
        if not a1_2 then
            u38:Stop()
            HumanoidRootPart.Fire:Stop()
            HumanoidRootPart.Land.PlaybackSpeed = 1 * GameState.TimeScale
            HumanoidRootPart.Land:Play()
        else
            u38:Play()
            HumanoidRootPart.Fire.PlaybackSpeed = 1 * GameState.TimeScale
            HumanoidRootPart.Fire:Play()
        end
        for k, v in pairs(v1.Effect:GetChildren()) do
            if v:IsA("ParticleEmitter") then
                v.Enabled = a1_2
            end
        end
        for k2, i in pairs(v2.Effect:GetChildren()) do
            if i:IsA("ParticleEmitter") then
                i.Enabled = a1_2
            end
        end
    end

    function a1.EnableBeam(a1_2) -- Line: 75 -- upvalues: a1 (val), GameState (upval)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        local Head = a1.Model.Head
        local v1 = a1_2
        for k, v in pairs(HumanoidRootPart.BeamEnd:GetChildren()) do
            if v:IsA("Beam") or v:IsA("ParticleEmitter") then
                v.Enabled = v1
            end
        end
        if not v1 then
            Head.Laser:Stop()
            return
        end
        Head.Laser.PlaybackSpeed = 1 * GameState.TimeScale
        Head.Laser:Play()
    end

    function a1.Intro() -- Line: 94 -- upvalues: a1 (val), TimescaleUtilities (upval), TweenService (upval)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        local Dust = a1.Model.Dust
        task.spawn(function() -- Line: 99 -- upvalues: Dust (val), TimescaleUtilities (upval), a1 (upval)
            Dust.Weld:Destroy()
            Dust.Anchored = true
            TimescaleUtilities.Delay(10, function() -- Line: 105 -- upvalues: Dust (upval)
                Dust:Destroy()
            end)
            a1:Delay(3.5999999999999996)
            Dust.Smoke.Enabled = true
            a1:Delay(2.4000000000000004)
            Dust.Smoke.Enabled = false
        end)
        local CFrame_2 = HumanoidRootPart.CFrame
        HumanoidRootPart.CFrame = CFrame_2 * CFrame.new(0, 50, 0)
        TweenService:Create(HumanoidRootPart, TweenInfo.new(6, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
            TweenService:Create(
                HumanoidRootPart,
                TweenInfo.new(6, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                {CFrame = CFrame_2}
            ):Play(),
        }):Play()
        a1.RocketFeet(true)
        a1:Delay(6)
        a1.RocketFeet(false)
    end

    a1.Executables = {
        Barrage = function(a1_2, a2) -- Line: 152 -- upvalues: a1 (val), u29 (val), GameState (upval)
            a1.Shooting = a1_2
            if not a1_2 then
                u29:Stop()
                a1.EnableBeam(false)
                return
            end
            u29:Play(0.5)
            a1.Face(a2)
            a1.EnableBeam(true)
            a1.Model.Head.Scream.PlaybackSpeed = 1 * GameState.TimeScale
            a1.Model.Head.Scream:Play()
        end,
        BeamPosition = function(a1_2) -- Line: 167 -- upvalues: a1 (val)
            a1.BeamPos = a1_2
        end,
    }

    function a1.OnStepFunction(a1_2) -- Line: 172 -- upvalues: a1 (val), BeamEnd (val)
        if a1.Shooting then
            local HumanoidRootPart = a1.Model.HumanoidRootPart
            BeamEnd.WorldCFrame = BeamEnd.WorldCFrame:Lerp(CFrame.new(a1.BeamPos), a1_2 * 6)
            BeamEnd.WorldCFrame = BeamEnd.WorldCFrame:Lerp(CFrame.new(a1.BeamPos), a1_2 * 6)
            HumanoidRootPart.CFrame = HumanoidRootPart.CFrame:Lerp(a1.Face(a1.BeamPos), a1_2 * 8)
        end
    end

    a1.Intro()
end

return v1