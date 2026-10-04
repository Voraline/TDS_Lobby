-- Script path: ReplicatedStorage.Content.Enemies.Eggsplosive.Animator
-- Decompile time: 0.50 ms

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
                Color = BrickColor.new("Br. yellowish orange"),
                Sound = 4725504496,
                Material = Enum.Material.Neon,
                Particles = true,
                Visible = true,
            })
        end,
    }
end

return v1