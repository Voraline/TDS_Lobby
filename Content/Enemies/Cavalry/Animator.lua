-- Script path: ReplicatedStorage.Content.Enemies.Cavalry.Animator
-- Decompile time: 1.65 ms

local v1 = {}
v1.__index = v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)

function v1.Initialize(a1) -- Line: 12 -- upvalues: Animation (val), TweenService (val), Laser (val)
    function a1.Face(a1_2) -- Line: 15 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        return CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    a1.Executables = {
        Stab = function(a1_2) -- Line: 25 -- upvalues: Animation (upval), a1 (val), TweenService (upval), Laser (upval)
            local Attribute
            Animation.new({
                Track = a1.Model.Animations.Shoot,
                Target = a1.Model.AnimationController,
            }):Play()
            local v1 = a1.Face(a1_2)
            TweenService:Create(
                a1.Model.HumanoidRootPart,
                TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                {CFrame = v1}
            ):Play()
            a1:Delay(0.65)
            local Handle = a1.Model.Handle
            for k, v in pairs(Handle.Start:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    Attribute = v:GetAttribute("EmitCount")
                    if Attribute then
                        v:Emit(Attribute)
                    end
                end
            end
            local v2 = Handle.Fire:Clone()
            v2.Name = "FireSound"
            v2.PlaybackSpeed = Random.new():NextNumber(0.8, 1.2)
            v2.Parent = Handle
            v2:Play()
            game.Debris:AddItem(v2, v2.TimeLength)
            local v3 = {
                Start = Handle.Start.WorldPosition,
                Pos = a1_2,
                Color = BrickColor.new("Cork"),
                Transparency = 0.1,
                Size = 0.1,
                Fade = 90,
                Type = "Bullet",
                Bullet = "Normal",
            }
            Laser:Cast(v3)
        end,
        Death = function() -- Line: 78 -- upvalues: Animation (upval), a1 (val)
            local u10 = Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            })
            u10:Play()
            task.defer(function() -- Line: 86 -- upvalues: u10 (val), a1 (upval)
                while u10.Controller.Length == 0 do
                    task.wait()
                end
                a1:Delay(u10.Controller.Length * 0.9)
                u10.Controller:AdjustSpeed(0)
            end)
        end,
    }
end

return v1