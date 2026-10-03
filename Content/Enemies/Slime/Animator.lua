-- Script path: ReplicatedStorage.Content.Enemies.Slime.Animator
-- Decompile time: 0.84 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 11 -- upvalues: EffectsController (val), TimescaleUtilities (val)
    a1.Executables = {
        Explode = function(a1_2) -- Line: 13 -- upvalues: EffectsController (upval), a1 (val), TimescaleUtilities (upval)
            local Attribute
            EffectsController.Explosion({
                Position = a1.Model.HumanoidRootPart.Position,
                Radius = a1_2,
                Color = BrickColor.new("Shamrock"),
                Sound = 3781479909,
                Material = Enum.Material.Neon,
                Particles = false,
                Visible = true,
                Type = "Sphere",
            })
            local u23 = a1.Model.HumanoidRootPart.DeathParticle:Clone()
            u23.Name = "ToxicParticles"
            u23.Parent = workspace.Terrain
            u23.WorldPosition = a1.Model.HumanoidRootPart.DeathParticle.WorldPosition
            for k, v in pairs(u23:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    Attribute = v:GetAttribute("EmitCount")
                    if Attribute then
                        v:Emit(Attribute)
                    end
                end
            end
            TimescaleUtilities.Delay(2, function() -- Line: 39 -- upvalues: u23 (val)
                u23:Destroy()
            end)
        end,
    }
end

return v1