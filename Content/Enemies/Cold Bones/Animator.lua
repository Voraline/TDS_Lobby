-- Script path: ReplicatedStorage.Content.Enemies.Cold Bones.Animator
-- Decompile time: 0.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)

function v1.Initialize(a1) -- Line: 14 -- upvalues: Animation (val), EffectsController (val)
    a1.Executables = {
        Death = function() -- Line: 16 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Rattle:Play()
            a1.Model.Tnt:Destroy()
        end,
        Explode = function(a1_2) -- Line: 25 -- upvalues: EffectsController (upval), a1 (val)
            EffectsController.Explosion({
                Position = a1.Model.HumanoidRootPart.Position,
                Radius = a1_2,
                Color = BrickColor.new("Bright orange"),
                Sound = 560084389,
                Material = Enum.Material.Neon,
                Particles = true,
                Visible = true,
            })
        end,
    }
end

return v1