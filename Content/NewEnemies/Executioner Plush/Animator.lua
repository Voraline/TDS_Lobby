-- Script path: ReplicatedStorage.Content.NewEnemies.Executioner Plush.Animator
-- Decompile time: 2.80 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local DialogController = require(ReplicatedStorage.Client.Controllers.Shared.DialogController)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)

function v1.Initialize(a1) -- Line: 18
    -- upvalues: DialogController (val), Animation (val), TweenService (val), TimescaleUtilities (val), Shaker (val)
    -- upvalues: GameState (val)
    a1.Name = "Executioner"

    function a1.Face(a1_2) -- Line: 23 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        return CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    function a1.Intro() -- Line: 31 -- upvalues: DialogController (upval)
        print("Running intro")
        for k, v in pairs({
            {Speaker = "Executioner", Emotion = "Neutral", Text = "Umbra, get ready to be EXECUTED!"},
            {Speaker = "Executioner", Emotion = "Neutral", Text = "I'm gonna chop you all to bits!"},
        }) do
            DialogController.Queue(v)
        end
    end

    a1.Executables = {
        Attack = function(a1_2, a2, a3, a4) -- Line: 52 -- upvalues: Animation (upval), a1 (val), TweenService (upval)
            Animation.new({
                Track = a1.Model.Animations.Throw,
                Target = a1.Model.AnimationController,
            }):Play()
            local CFrame = a1.Model.HumanoidRootPart.CFrame
            local v1 = a1.Face(a1_2)
            TweenService:Create(
                a1.Model.HumanoidRootPart,
                TweenInfo.new(a2, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0),
                {CFrame = v1}
            ):Play()
            a1:Delay(a2)
            a1.Model.Head.Throw:Play()
            a1:Delay(a3)
            local v2 = (a4 - a3 - a2) * 0.9
            TweenService:Create(
                a1.Model.HumanoidRootPart,
                TweenInfo.new(v2, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0),
                {CFrame = CFrame}
            ):Play()
        end,
        Hit = function() -- Line: 87 -- upvalues: a1 (val), TimescaleUtilities (upval), Shaker (upval)
            local Handle = a1.Model:FindFirstChild("Handle")
            if Handle then
                local Attribute
                local Hit = Handle:FindFirstChild("Hit")
                if Hit then
                    Hit = Handle.Hit:Clone()
                end
                Hit.Name = "HitSound"
                Hit.Parent = Handle
                Hit.PlaybackSpeed = (Random.new()):NextNumber(Hit.PlaybackSpeed * 0.9, Hit.PlaybackSpeed * 1.2)
                Hit:Play()
                TimescaleUtilities.Delay(Hit.TimeLength, function() -- Line: 100 -- upvalues: Hit (val)
                    Hit:Destroy()
                end)
                for k, v in pairs(Handle.Effect:GetChildren()) do
                    if v:IsA("ParticleEmitter") then
                        Attribute = v:GetAttribute("EmitCount")
                        if Attribute then
                            v:Emit(Attribute)
                        end
                    end
                end
                Shaker:Shake({1.5, 20, 0.1, 1}, 0.2, 0.5)
            end
        end,
        Death = function() -- Line: 118 -- upvalues: Animation (upval), a1 (val)
            local u10 = Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            })
            u10:Play()
            task.defer(function() -- Line: 126 -- upvalues: u10 (val), a1 (upval)
                while u10.Controller.Length == 0 do
                    a1:Delay(0.001)
                end
                a1:Delay(u10.Controller.Length * 0.95)
                u10.Controller:AdjustSpeed(0)
            end)
        end,
    }
    if GameState == "Act1" then
        a1.Intro()
    end
end

return v1