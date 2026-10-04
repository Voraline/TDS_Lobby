-- Script path: ReplicatedStorage.Content.Enemies.Flare.Animator
-- Decompile time: 0.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 9 -- upvalues: EffectsController (val)
    a1.Executables = {
        Explode = function(a1_2) -- Line: 11 -- upvalues: EffectsController (upval), a1 (val)
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