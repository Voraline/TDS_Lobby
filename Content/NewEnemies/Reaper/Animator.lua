-- Script path: ReplicatedStorage.Content.NewEnemies.Reaper.Animator
-- Decompile time: 2.31 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 12 -- upvalues: Animation (val), TweenService (val), EmitterManager (val)
    function a1.Face(a1_2) -- Line: 13 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        return CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    a1.Executables = {
        Swing = function(a1_2, a2) -- Line: 22 -- upvalues: Animation (upval), a1 (val), TweenService (upval)
            Animation.new({
                Track = a1.Model.Animations.Slash,
                Target = a1.Model.AnimationController,
            }):Play()
            local v1 = a1.Face(a1_2)
            TweenService:Create(
                a1.Model.HumanoidRootPart,
                TweenInfo.new(a2 * 0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0),
                {CFrame = v1}
            ):Play()
            a1:Delay(a2)
            a1.Model.Head.Swing:Play()
        end,
        Summon = function(a1_2) -- Line: 46 -- upvalues: Animation (upval), a1 (val)
            local Attribute
            Animation.new({
                Track = a1.Model.Animations.Summon,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(a1_2)
            for k, v in pairs(a1.Model.HumanoidRootPart.SpawnEffect:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    Attribute = v:GetAttribute("EmitCount")
                    if Attribute then
                        v:Emit(Attribute)
                    end
                end
            end
        end,
        Hit = function(a1) -- Line: 64 -- upvalues: EmitterManager (upval)
            for k, v in pairs(a1) do
                EmitterManager.Emit("HitFX", CFrame.new(v), 1.5)
                task.wait(0.05)
            end
        end,
        Death = function(a1_2) -- Line: 71 -- upvalues: Animation (upval), a1 (val), TweenService (upval) -- types: a1_2: number
            local u11 = Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            })
            u11:Play()
            task.defer(function() -- Line: 80 -- upvalues: u11 (val), a1 (upval), a1_2 (val), TweenService (upval)
                local v1, v2, v3, v4
                while u11.Controller.Length == 0 do
                    task.wait()
                end
                a1:Delay(u11.Controller.Length * 0.95)
                u11.Controller:AdjustSpeed(0)
                a1.Model:BreakJoints()
                local v5 = TweenInfo.new(a1_2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
                for k, v in pairs(a1.Model:GetChildren()) do
                    if v:IsA("MeshPart") and v.Transparency < 1 then
                        v.Anchored = true
                        v.TextureID = ""
                        v.Color = Color3.new(0.09803921568627451, 0.00784313725490196, 0.054901960784313725)
                        v.Color = Color3.new(0.09803921568627451, 0.00784313725490196, 0.054901960784313725)
                        v.Material = Enum.Material.Basalt
                        v2 = CFrame.Angles(
                            Random.new():NextNumber(0, 6.283185307179586),
                            Random.new():NextNumber(0, 6.283185307179586),
                            Random.new():NextNumber(0, 6.283185307179586)
                        )
                        v3 = CFrame.new(Random.new():NextNumber(-2, 2), Random.new():NextNumber(-2, 2), Random.new():NextNumber(-2, 2))
                        v4 = TweenService
                        v1 = {Transparency = 1, CFrame = v.CFrame * v2 * v3}
                        v4:Create(v, v5, v1):Play()
                    end
                end
            end)
        end,
    }
end

return v1