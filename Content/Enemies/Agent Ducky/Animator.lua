-- Script path: ReplicatedStorage.Content.Enemies.Agent Ducky.Animator
-- Decompile time: 1.62 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
require(ReplicatedStorage.Shared.Modules.Projectile)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)

function v1.Initialize(a1) -- Line: 16 -- upvalues: Animation (val), Laser (val), TimescaleUtilities (val)
    function a1.Face(a1_2) -- Line: 17 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    a1.Executables = {
        Fire = function(a1_2, a2) -- Line: 27 -- upvalues: a1 (val), Animation (upval), Laser (upval), TimescaleUtilities (upval)
            a1.Face(a1_2)
            a1.Model.Weapon.Transparency = 0
            Animation.new({
                Track = a1.Model.Animations.FireGun,
                Target = a1.Model.AnimationController,
            }):Play():GetMarkerReachedSignal("FireGun"):Wait()
            a1.Model.Weapon.Start.Flash:Emit(1)
            a1.Model.Weapon.Start.Spark:Emit(1)
            a1.Model.Weapon.Fire:Play()
            local v1 = {
                Start = a1.Model.Weapon.Start.WorldPosition,
                Pos = a1_2,
                Color = BrickColor.new("Cork"),
                Transparency = 0.1,
                Size = 0.04,
                Fade = 90,
                Type = "Bullet",
                Bullet = "Normal",
            }
            Laser:Cast(v1)
            TimescaleUtilities.Delay(a2, function() -- Line: 54 -- upvalues: a1 (upval)
                if a1.Maid then
                    a1.Model.Weapon.Transparency = 1
                end
            end)
        end,
    }
end

return v1