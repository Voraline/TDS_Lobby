-- Script path: ReplicatedStorage.Content.Enemies.Solar Servant.Animator
-- Decompile time: 0.49 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)

function v1.Initialize(a1) -- Line: 13 -- upvalues: Animation (val), EffectsController (val)
    a1.Executables = {
        Stab = function() -- Line: 15 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Attack,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(0.5)
            a1.Model.Head.Slash:Play()
        end,
        Explode = function(a1, a2) -- Line: 24 -- upvalues: EffectsController (upval)
            EffectsController.Explosion({
                Position = a2,
                Radius = a1,
                Color = BrickColor.new("Bright orange"),
                Sound = 5447233442,
                Material = Enum.Material.Neon,
                Particles = true,
                Visible = true,
            })
        end,
    }
end

return v1