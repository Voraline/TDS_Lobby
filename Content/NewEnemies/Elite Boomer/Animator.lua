-- Script path: ReplicatedStorage.Content.NewEnemies.Elite Boomer.Animator
-- Decompile time: 0.82 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 6 -- upvalues: ReplicatedStorage (val), TimescaleUtilities (val)
    a1.Executables = {
        Explode = function(a1_2) -- Line: 8 -- upvalues: ReplicatedStorage (upval), a1 (val), TimescaleUtilities (upval)
            local Attribute
            local u8 = ReplicatedStorage.Assets.Effects.Particles.BoomerBile:Clone()
            u8.Parent = workspace.Terrain
            u8:ScaleTo(a1_2)
            u8:PivotTo(a1.Model.HumanoidRootPart.CFrame)
            for i, j in u8:GetDescendants() do
                if j:IsA("ParticleEmitter") then
                    Attribute = j:GetAttribute("EmitCount")
                    j:Emit(Attribute)
                end
            end
            TimescaleUtilities.Delay(5, function() -- Line: 21 -- upvalues: u8 (val)
                u8:Destroy()
            end)
        end,
    }
end

return v1