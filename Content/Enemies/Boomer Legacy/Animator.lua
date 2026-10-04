-- Script path: ReplicatedStorage.Content.Enemies.Boomer Legacy.Animator
-- Decompile time: 0.42 ms

local v1 = {}
v1.__index = v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)

function v1.Initialize(a1) -- Line: 13 -- upvalues: EasySound (val), EffectsController (val)
    a1.Executables = {
        Explode = function(a1_2) -- Line: 15 -- upvalues: EasySound (upval), a1 (val), EffectsController (upval)
            EasySound.Play({
                id = 1043479862,
                volume = 1,
                destroyOnEnd = true,
                soundGroupName = "Enemies",
                parent = a1.Model.HumanoidRootPart,
            })
            EffectsController.Explosion({
                Particles = false,
                Visible = true,
                Position = a1.Model.HumanoidRootPart.Position,
                Radius = a1_2,
                Color = BrickColor.new("Parsley green"),
                Material = Enum.Material.Granite,
            })
        end,
    }
end

return v1