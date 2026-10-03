-- Script path: ReplicatedStorage.Content.NewEnemies.Toxic.Animator
-- Decompile time: 0.64 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 9 -- upvalues: TimescaleUtilities (val)
    a1.Executables = {
        Death = function(a1_2) -- Line: 11 -- upvalues: a1 (val), TimescaleUtilities (upval)
            local u7 = a1.Model.HumanoidRootPart.DeathEffect:Clone()
            u7.Name = "ToxicParticles"
            u7.Parent = workspace.Terrain
            u7.WorldPosition = a1.Model.HumanoidRootPart.DeathEffect.WorldPosition
            for k, v in pairs(u7:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    v.Enabled = true
                end
            end
            a1:Delay(a1_2)
            for k2, i in pairs(u7:GetChildren()) do
                if i:IsA("ParticleEmitter") then
                    i.Enabled = false
                end
            end
            TimescaleUtilities.Delay(a1_2 + 3, function() -- Line: 31 -- upvalues: u7 (val)
                u7:Destroy()
            end)
        end,
    }
end

return v1