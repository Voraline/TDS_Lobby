-- Script path: ReplicatedStorage.Content.Enemies.Templar.Animator
-- Decompile time: 1.64 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 11 -- upvalues: Animation (val), Laser (val), TimescaleUtilities (val)
    function a1.Face(a1_2) -- Line: 12 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    Animation.new({
        Track = a1.Model.Animations.Shoot,
        Target = a1.Model.AnimationController,
    })
    local u19 = Animation.new({
        Track = a1.Model.Animations.Shoot,
        Target = a1.Model.AnimationController,
    })
    a1.Executables = {
        Barrage = function(a1_2, a2) -- Line: 30 -- upvalues: u19 (val), a1 (val)
            if a1_2 then
                u19:Play()
                a1.Face(a2)
                a1.Model.Weapon.Barrel.Fire:Play()
                a1.Model.Weapon.Handle.Barrel.MaxVelocity = 0.15
                return
            end
            u19:Stop()
            a1.Model.Weapon.Barrel.Fire:Stop()
            a1.Model.Weapon.Handle.Barrel.MaxVelocity = 0
            a1.Model.Weapon.Barrel.Ended:Play()
        end,
        Bullet = function(a1_2, a2, a3) -- Line: 44 -- upvalues: a1 (val), Laser (upval)
            a1.Model.Weapon.Barrel.Start.Flash:Emit(1)
            local v1 = {
                Start = a1.Model.Weapon.Barrel.Start.WorldPosition,
                Pos = a3,
                Color = BrickColor.new("Cork"),
                Transparency = 0.1,
                Size = 0.04,
                Fade = 90,
                Type = "Bullet",
                Bullet = "Normal",
            }
            Laser:Cast(v1)
        end,
        Shield = function(a1_2, a2) -- Line: 60 -- upvalues: a1 (val), TimescaleUtilities (upval)
            local Size = a1.Model.HumanoidRootPart.Size
            local u12 = game.ReplicatedStorage.Effects.Shield:Clone()
            u12:SetPrimaryPartCFrame(a1.Model.HumanoidRootPart.CFrame)
            u12.Effect.Size = Vector3.new(Size.X * 2.5, Size.Y * 1.5, Size.X * 2.5)
            u12.Effect.Damage1.Display.Text = a2
            u12.Effect.Damage2.Display.Text = a2
            u12.Effect.Damage3.Display.Text = a2
            u12.Effect.Damage4.Display.Text = a2
            u12.Parent = a1.Model
            u12.PrimaryPart.Weld.Part1 = a1.Model.HumanoidRootPart
            TimescaleUtilities.Delay(a1_2, function() -- Line: 74 -- upvalues: u12 (val)
                u12:Destroy()
            end)
        end,
        Death = function() -- Line: 79 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Death:Play()
        end,
    }
end

return v1