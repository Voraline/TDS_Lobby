-- Script path: ReplicatedStorage.Content.Enemies.Explosive Ducky.Animator
-- Decompile time: 0.47 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
require(ReplicatedStorage.Shared.Modules.Animation)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
require(ReplicatedStorage.Shared.Modules.Projectile)

function v1.Initialize(a1) -- Line: 14 -- upvalues: EffectsController (val)
    a1.Executables = {
        Explode = function(a1_2) -- Line: 16 -- upvalues: EffectsController (upval), a1 (val)
            EffectsController.Explosion({
                Position = a1.Model.HumanoidRootPart.Position,
                Radius = a1_2,
                Color = BrickColor.new(Color3.new(1, 1, 0.113725)),
                Sound = 1043479862,
                Material = Enum.Material.Granite,
                Particles = false,
                Visible = true,
            })
        end,
    }
end

return v1